#!/bin/bash

""" Install and check version and help """
$sudo dnf install git
$git --version
$git --help
$git help <verb>
$git <verb> --help
$git <verb> -h
$man git-<verb>


""" Config Level, Each level overrides values in the previous level, so values in .git/config trump those in /etc/gitconfig """
1- /etc/gitconfig                          # --system
2- ~/.gitconfig or ~/.config/git/config    # --global
3- [project]/.git/config                   # --local
$git config --global user.name "username"
$git config --global user.name "useremail"
$git config --global core.editor emacs
$git config --global color.ui auto
$git config --list --show-origin


""" Basic Command """
$git init .              # Initialize git repository in Working directory
$git clone <git URL>     # Clone git repository


""" Git Map """
 ___________________                              ______________                                  ________________                      _______________
|                   |------------ add ---------->|              |------------ commit ----------->|                |------ git push --->|               |
|   Working Tree    |                            | Staging Area |                                |   Repository   |                    | Remote Server |
|                   |<--------- restore ---------|   (Index)    |<------- restore --staged-------|                |<---- git fetch ----|               | 
|                   |                            |              |                                |                |                    |               |
|-------------------|                            |--------------|                                |----------------|                    |---------------|
|    Untracked      |                            |    Staged    |                                |                |                    |               |
|    Unstaged       |                            |              |                                |                |                    |               |
|                   |                            |              |                                |                |                    |               |
|                   |                            |              |                                |                |                    |               |
|                   |                            |              |                                |                |                    |               |
|                   |<------------ diff -------->|              |<-------- diff --staged ------->|                |                    |               |
|                   |                             --------------                                 |                |                    |               |
|                   |                                                                            |                |                    |               |
|                   |                                                                            |                |                    |               |
|                   |                                                                            |                |                    |               |
|                   |                                                                            |                |                    |               |
|                   |                                                                             ----------------                     |               |
|                   |                                                                                                                  |               |
|                   |                                                                                                                  |               |
|                   |<---------------------------------------------------------------------------------------- git pull ---------------|               | 
 -------------------                                                                                                                    ---------------


""" Action Command """
$git add <filename>                 # Add <file> to Staging Area, or add precisely this content to the next commit
$git add .                          # Add all files in current directory to Staging Area
$git add -A                         # Add all files to Staging Area
$git commit -m "message"            # Commit stagged files
$git commit --amend -m "message"    # Amend commit message
$git rm <file>                      # Remove <file> and staged it
$git mv <file_from> <file_to>       # Rename file and staged it
$echo file >> .gitignore            # https://github.com/github/gitignore
$git commit --amend                 # Undo commit  
$git restore <file>                 # To discard Unstaged changes in working directory
#$git rm --cached <file>            # Remove new <file> from Staging Area
#$git rm -r --cached .              # Remove all files from Staging Area


""" Monitoring Command """
$git status                                  # View  status
$git status -s                               # View short status  XX left X is status of STAGING, right X is status of Working Directory
$git show <HASH>                             # Show commit with hash <HASH>
$git show <HEAD>:<file>                      # Show commited version of <file>
$git diff                                    # Working Tree <-> STAGE !!!!Only Trackef Files!!!!
$git diff --staged                           # STAGE <-> HISTORY !!!1 All Files!!!!
$git log                                     # Log all commits -p --patch --stat --prety=oneline
$git log --oneline                           # Log all commits each log one line
$git log --since --until                     # Log all commits between since and untill
$git log --all --decorate --oneline --graph

""" Remote Server, Config ssh key """
$git remote add origin <git URL>
$git remote
$git remote -v
$git remote show origin 
$git branch -M main
$git push -u <origin> <main>
$git pull <origin> <main>

""" Branches """
$git branch                         # Branches in local machine
$git branch -r                      # Branches in remote server
$git branch -a                      # Branches in local machine and remote server
$git branch <branchname             # Create new branch from active branch
$git checkout <branchname>          # Checkout to branch <branchname>
$git checkout -b <branchname>       # Create branch and checkout from active branch
$git checkout <HASH>                # Checkout to <HASH> commit in current branch
$git branch -d <branchname>         # Delete branch only IF branch commited
$git branch -D <branchname>         # FORCE Delete branch
$git remote prune origin            # In case of Git remote branch deleted, but still it appears in 'branch -a'
$git branch -d -r origin/<branch>   # In case of Git remote branch deleted, but still it appears in 'branch -a'
$git pull --rebase origin <main>    # Rebase active branch with <main> branch

""" git workflow """
create develop branch from main/master and make it default.
  $git checkout -b develop
  $git push -u origin develop
  github->repo->settings->branches->Default branch
1- pull the latest changes from develop branch from remote server.
  $git pull origin develop
2- create a new feature branch.
  $git branch <F-C-324-adding-python-file>
  $git checkout <F-C-324-adding-python-file>
4- work on new feature/bug on new branch with some uniqe commits.
  $git add .
  $git commit -m "commit 1"
  $git add .
  $git commit -m "commit 2"
  $git add .
  $git commit -m "commit 3"
5- rebase new branch with develop
  $git checkout develop
  $git pull origin develop
  $git checkout <feature-brach>
  $git rebase develop
  $fix conflict
  #$git add <fixed_file>
  $git rebase --continue
6- push new branch
  $git push origin <F-C-324-adding-python-file>
  $create pull request, merged it by somenoe else
  $git checkout develop
  $git pull origin develop
  $git branch -d <F-C-324-adding-python-file>


""" Tag and Version, Git supports two types of tags: lightweight and annotated """
Smantic Versioning  v<major>.<minor>.<patch>               # https://semver.org/  X.x.x
$git tag -a <tag_name> <commit_sha> -m "message"           # git tag -a v1.4 2775732 -m "my version 1.4"
$git push origin <tag_name>                                # Sharing <tag_name> Tag
$git push origin --tags                                    # Sharing Tags


""" Delete tag """
$git tag -d <tag>
$git push --delete <tag>
