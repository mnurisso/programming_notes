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
git config --global user.mail "mnurisso@sissa.it"
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

# Github

You can connect your repository trough **ssh** or **https**. With the first one you don't need to put username and password every time, it uses the public key to generate and encripted message that can be decripted only with your private key.

## Clone

```bash
git clone "repository adress"
```

Create a folder with the same name of the repository on your local directory.

```bash
git remote -v

origin	https://github.com/asartori86/advanced_programming_2019-20.git (fetch)
origin	https://github.com/asartori86/advanced_programming_2019-20.git (push)
```

The default name for the address is **origin**, so that it can be used in commits as shortcut for the standard online address.

If you have already a local repository and you want to create an online repository on GitHub, the repository address can be added with the command:

```bash
git remote add origin https://github.com/user/repo.git
```

## Pull

The actual pull command performs two different commands.

```bash
git fetch origin
```

Fetch downloads the changes but they're stored only in the **.git repository** but without modifying your local files. 

```bash
git merge origin/master
```

To actually apply modifications to your local directory.

```bash
git pull origin master
```

does both the commands at the same time.

## Fork

Fork a repository means that you're creating a repository under your username with the material of the original one. It takes a snapshot of the original repository but then is up to you to keep the repository updated with the original one.

You can add a remote link to the local folder by:

```bash
git remote add myfork https://github.com/mnurisso/advanced_programming_2019-20.git
```

So in this way I can have more than one remote link to the local folder, one without writing permission to clone the updates from the original forked code and one with permission to upload and keep track of modifications that I do to the original code.

## Push

```bash
git push myfork master #myfork is usually origin with only one remote
```

By using **http** it will require username and password.

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

If you want to push a tag on the repository online this has to be done manually:

```bash
git push origin tag_name
```

or to update at the same time every tags:

```bash
git push origin --tags
```

