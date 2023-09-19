- [Git](#git)
  - [Initialize Git repository](#initialize-git-repository)
  - [Config Git](#config-git)
  - [Commit](#commit)
    - [Dismiss modification](#dismiss-modification)
    - [Change commit author](#change-commit-author)
    - [Commit log list](#commit-log-list)
  - [Recover file](#recover-file)
  - [Change filename](#change-filename)
  - [Custom aliases](#custom-aliases)

# Git

Git is a Version control system.

## Initialize Git repository

```bash
git init
```

to initialize an empty Git repository. It creates an .git folder. **Never** modify this folder.

```bash
tree .git/
```

to see the content of the folder.

```bash
git status
```

to see if every file is updated.

```bash
git add earth.txt
```

to add a file into the **staging area**. The status of the file pass from **untracked** to **staged**.

## Config Git

```bash
git config --global user.name "Matteo Nurisso"
git config --global user.email "mnurisso@sissa.it"
```

```bash
git config --global core.editor "vim"
```

to setup Vim as standard editor for commit messages.

## Commit

A commit is a screen shot of your working tree at a specif time. Another way to see them is as an increment of the previous work, everyone pointing to the previous one. 

```bash
git commit
```

Open a text editor to edit the commit message. You need to add a commit message in order to do a proper commit. With the commit the file is now in the **repository** .git. Git doesn't see any other file in the working tree, because the file is now considered as unmodified wrt the last repository version.

By modifying a file wrt the repository version the command

```bash
git status
```

should show it as modified.

```bash
git diff
```

shows the differences between repository version and local modified version. The file has to be added to the **staging area** by 

```bash
git add filename.txt
```

To commit in a single line:

```bash
git commit -m "git comment"
```

### Dismiss modification

```bash
git checkout -- filename
```

To dismiss modification that you don't want to add and commit.

### Change commit author

To change the author info of the last commit.

```bash
git commit --amend --reset-author
```

### Commit log list

```bash
git log
```

shows a list of every commit with the commit comment and a unique identifier.

```bash
git checkout 946bdd #some characters from the identifier are enough
```

to go back to the specific commit. Move the **HEAD**, a pointer to the commit in which you are.

To show were you are in the commits (in a goodloking way):

```bash
git log --oneline --graph --all --decorate

* 06d935a (master) add humans
* 946bdd8 (HEAD) add earth.txt
```

you can also deine an alias for this command.

To go back to the newest version (of a specific branch):

```bash
git checkout master #master is the branch name
```

## Recover file

```bash
git checkout -- .
```

to recover files if you by mistake delete important files. If you want to recover only a single file:

```bash
git checkout -- filename.txt
```

## Change filename

If a file is renamed:

```bash
git add oldname.txt newname.txt
```

In this way git is able to compare the content of the deleted and new file and to recognize that a filename is changed.

```bash
git mv oldname.txt newname.txt
```

Automatically add the change to the **staging** area.

## Custom aliases

To define a new alias available for every git repository:

```bash
git config --global alias.graph "log --all --graph --decorate --oneline"
```

this will create a new command `git graph` that will show the commit log in a nice way.
