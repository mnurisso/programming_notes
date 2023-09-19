# Github

You can connect your repository trough **ssh** or **https**. With the first one you don't need to put username and password every time, it uses the public key to generate and encripted message that can be decripted only with your private key.

In order to check if you correctly can connect to the right user you can use the command:

```bash
ssh -vT git@github.com
```

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

If you want to push a tag on the repository online this has to be done manually:

```bash
git push origin tag_name
```

or to update at the same time every tags:

```bash
git push origin --tags
```

## Compare different versions

If you want to compare the same file for different commitments you can use the `git diff` command
```bash
git diff <id1> <id2> filename
```

where the `<id>` refers to the version identifiers that can be found through the `git log` command.