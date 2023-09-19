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
  - [Branch](#branch)
    - [Switch branch](#switch-branch)
  - [Merge](#merge)
    - [Delete merged branches](#delete-merged-branches)
  - [Fetch](#fetch)
  - [Tag](#tag)
  - [Compare different versions](#compare-different-versions)

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

## Branch

**Branch** is a pointer to a commit. The branch always point to the last commit done on the specific branch.

To create a new branch:

```bash
git branch moon
```

To see the list of branches:

```bash
git branch

* master
  moon
```

After the creation of a branch I'm still not in the new branch, in order to do that I need to use the **checkout** command.

```bash
git branch newbranch startingbranch #e.g. jupiter master
```

The branch is created from the actual position or adding another branchname to the branch command.

A general rule for branches is: new feature = new branch.

### Switch branch

```bash
git checkout branch_name
```

or

```bash
git switch branch_name
```

The switch command is more recent and it's more clear, while `checkout` is more general and can be used for other things.
To switch to a new branch and create it at the same time:

```bash
git switch -c branch_name
```

## Merge

```bash
git checkout master #final branch
git merge branch_name
```

Fast-forward if there is nothing else apart from pushing forward the master branch. If it's not fast-forward a commit message is necessary to explain why the merge is necessary.

```bash
git branch -d branch_name
```

Delete a branch, but it's only a pointer so it's not deleting the commitments.

### Delete merged branches

It can be useful to delete old branches that are now merged into the master/main branch.

To automatically delete these branches run the following commands:

```bash
git fetch
git branch # to see the initial list
git branch --merged main | grep -v "^\* main" | xargs -n 1 -r git branch -d
git branch # to see what remains
```

If you want instead to delete branches that are not in the github anymore run:

```bash
git fetch
git branch -vv | grep ': gone]' | grep -v '\*' | awk '{ print $1; }' | xargs -r git branch -d
```

## Fetch

The `git fetch` command downloads objects to the local machine without overwriting existing local code in the current branch. 

The git fetch command retrieves commits, files, branches, and tags from a remote repository. The general syntax for command is:

```bash
git fetch <options> <remote name> <branch name>
```

With a `git fetch` the working directory is unaffected. 
The content can be accessed with `git checkout` on the fetched branch or can be merged by going in the final branch in which the merge should happen and with the command:

```bash
git merge <remote name> <branch name>
```

## Tag

A **lightweight tag** is simply a pointer to a specific commit. An **annotated tag** instead has a comment and can be used to create a pointer to a specific version of your code with the changelog as comment.

```bash
git tag -a tag_name -m 'tag comment (changelog)'
```

`-a` specify the request of an annotated tag, while `-m` specify the comment.

```bash
git show tag_name
```

shows the comment related to the specific tag.

Instead a lightweight tag can be created by typing:

```bash
git tag tag_name
```

A tag can be added also to commit already created using its checksum:

```bash
git tag -a tag_name 9fceb02 #checksum or part of it
```

## Compare different versions

If you want to compare the same file for different commitments you can use the `git diff` command
```bash
git diff <id1> <id2> filename
```

where the `<id>` refers to the version identifiers that can be found through the `git log` command.