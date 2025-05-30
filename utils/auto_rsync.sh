#!/bin/bash

SRC="/scratch/project_462000911/mnurisso/prec_italy_new_selection"
DEST="tintin:/work/users/clima/nurisso"
RSYNC_OPTS="--partial --inplace --progress -avz --no-perms -L --delete"

LOG_FILE="/tmp/rsync_progress.log"
TIMEOUT=30  # seconds

while true; do
    echo "Starting rsync..."
    echo "Running: rsync $RSYNC_OPTS $SRC $DEST"

    rm -f "$LOG_FILE"
    PIPE=$(mktemp -u)
    mkfifo "$PIPE"

    # Start tee to both show and log
    tee "$LOG_FILE" < "$PIPE" &
    TEE_PID=$!

    # Start rsync
    rsync $RSYNC_OPTS "$SRC" "$DEST" > "$PIPE" 2>&1 &
    RSYNC_PID=$!

    LAST_MOD=$(date +%s)
    RSYNC_KILLED=0

    # Monitor loop
    while kill -0 $RSYNC_PID 2> /dev/null; do
        sleep 5
        if [ -f "$LOG_FILE" ]; then
            NEW_MOD=$(stat -c %Y "$LOG_FILE")
        else
            NEW_MOD=$LAST_MOD
        fi

        if (( NEW_MOD > LAST_MOD )); then
            LAST_MOD=$NEW_MOD
        elif (( $(date +%s) - LAST_MOD > TIMEOUT )); then
            echo "No progress for $TIMEOUT seconds. Restarting rsync..."
            kill -TERM $RSYNC_PID
            RSYNC_KILLED=1
            break
        fi
    done

    # Wait for rsync to exit if still running
    if kill -0 $RSYNC_PID 2>/dev/null; then
        wait $RSYNC_PID
        RSYNC_EXIT=$?
    else
        wait $RSYNC_PID 2>/dev/null
        if [ $RSYNC_KILLED -eq 1 ]; then
            RSYNC_EXIT=20  # Custom code for killed by timeout
        else
            RSYNC_EXIT=1   # Something else went wrong
        fi
    fi

    # Cleanup
    kill $TEE_PID 2>/dev/null
    wait $TEE_PID 2>/dev/null
    rm -f "$PIPE"

    if [ $RSYNC_EXIT -eq 0 ]; then
        echo "rsync completed successfully."
        break
    else
        echo "rsync exited with code $RSYNC_EXIT. Restarting..."
    fi

    sleep 1
done
