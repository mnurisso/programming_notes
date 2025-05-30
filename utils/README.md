# `auto_rsync.sh` — Resilient `rsync` with Auto-Restart on Timeout

This script wraps around `rsync` to make file transfers more robust. It automatically restarts the transfer if no progress is detected for a given timeout (default: **30 seconds**). Useful for large transfers over flaky or slow connections, such as on HPC systems or long-distance remote syncs.

## ✅ Features

- Automatically restarts `rsync` if it gets stuck or stalls.
- Monitors real-time progress by checking for updates in the log.
- Logs output both to the screen and to a temporary file.
- Retries until the transfer completes successfully.
- Uses a clean, self-contained mechanism (named pipe and `tee`).

## 🚀 Usage

The script can be directly used. Make sure to modify in the script:

- SRC: the path in the source machine
- DEST: the destination (machine+path) in the destination machine

A set of rsync option is available under the RSYNC_OPTS.
A default timeout of 30 seconds is set and can be modified with the TIMEOUT option
