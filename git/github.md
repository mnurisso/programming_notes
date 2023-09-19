- [Github](#github)
  - [Clone](#clone)
  - [Pull](#pull)
  - [Fork](#fork)
  - [Push](#push)

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

If you want to push a tag on the repository online this has to be done manually:

```bash
git push origin tag_name
```

or to update at the same time every tags:

```bash
git push origin --tags
```