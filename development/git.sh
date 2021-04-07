#!/bin/bash

""" 
    Pro Git
    Scott Chacon, Ben Straub
    Version 2.1.300, 2021-03-24
    ---
    Appendix C: Git Commands    
"""
Setup and Config
- git config
- git help
Getting and Creating Projects
- git init
- git clone
Basic Snapshotting
- git add
- git status
- git diff
- git difftool
- git commit
- git reset
- git rm
- git mv
- git clean
Branching and Merging
- git branch
- git checkout
- git merge
- git mergetool
- git log
- git stash
- git tag
Sharing and Updating Projects
- git fetch
- git pull
- git push
- git remote
- git archive
- git submodule
Inspection and Comparison
- git show
- git shortlog
- git describe
Debugging
- git bisect
- git blame
- git grep
Patching
- git cherry-pick
- git rebase
- git revert
Email
- git apply
- git am
- git format-patch
- git imap-send
- git send-email
- git request-pull
External Systems
- git svn
- git fast-import
Administration
- git gc
- git fsck
- git reflog
- git filter-branch
Plumbing Commands
- ls-remote
- ls-files
- rev-parse


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
|   Working Tree    |                            | Staging Area |                                |     History    |                    | Remote Server |
|                   |<--------- restore ---------|   (Index)    |<------- restore --staged-------|      .git      |<---- git fetch ----|               | 
|                   |                            |    .git      |                                |                |                    |               |
|-------------------|                            |--------------|                                |----------------|                    |---------------|
|    Untracked      |                            |    Staged    |                                |                |                    |               |
|    Unstaged       |      git rm --cached <file>|              |                                |                |                    |               |
|                   |                            |              |                                |                |                    |               |
|                   |                            |              |                                |                |                    |               |
|                   |                            |              |                                |                |                    |               |
|                   |<------------ diff -------->|              |<-------- diff --staged ------->|                |                    |               |
|                   |                             --------------                                 |                |                    |               |
|                   |                                                                            |                |                    |               |
|                   |                                                                            |                |                    |               |
|                   |                                                                            |                |                    |               |
|                   |<------- restore --source=<HASH> --worktree --staged <file_name> -----------|                |                    |               |
|                   |                                                                             ----------------                     |               |
|                   |git rm <file>                                                                                                     |               |
|                   |                                                                                                                  |               |
|                   |<---------------------------------------------------------------------------------------- git pull ---------------|               | 
 -------------------                                                                                                                    ---------------


""" Action Command """
$git add <filename>                 # Add <file> to Staging Area, or add precisely this content to the next commit
$git add .                          # Add all files in current directory to Staging Area
$git add -A                         # Add all files to Staging Area
$git add -p                         # Add Chunk
$git commit -m "message"            # Commit stagged files
$git commit --amend -m "message"    # Amend commit message
$git rm <file>                      # Remove <file> and staged it
$git mv <file_from> <file_to>       # Rename file and staged it
$echo file >> .gitignore            # https://github.com/github/gitignore
$git commit --amend                 # Undo commit  
$git restore <file>                 # To discard Unstaged changes in working directory
$git rm --cached <file>            # Remove new <file> from Staging Area
$git rm -r --cached .              # Remove all files from Staging Area
$git restore --source=<HASH> --worktree --staged <file_name>
 
""" Monitoring Command """
$git status                                  # View  status
$git status -s                               # View short status  XX left X is status of STAGING, right X is status of Working Directory
$git show <HASH>                             # Show commit with hash <HASH>
$git show <HEAD>:<file>                      # Show commited version of <file>
$git show --pretty="" --name-only <HASH>     # List all the files in a <HASH>
$git diff                                    # Working Tree <-> STAGE !!!!Only Trackef Files!!!!
$git diff --staged                           # STAGE <-> HISTORY !!!1 All Files!!!!
$git log                                     # Log all commits -p --patch --stat --prety=oneline
$git log --oneline                           # Log all commits each log one line
$git log --since --until                     # Log all commits between since and untill
$git log --oneline --decorate --all --graph

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
create develop branch from main/master and make it default
  $git checkout -b develop
  $git push -u origin develop
  github->repo->settings->branches->Default branch
1- pull the latest changes from develop branch from remote server
  $git pull origin develop
2- create a new feature branch.
  $git branch <F-C-324-adding-python-file>
  $git checkout <F-C-324-adding-python-file>
4- work on new feature/bug on new branch with some uniqe commits
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


""" Contribute on open source workflow """
Fork repository in github                           # Fork this repository by clicking on the fork button on the top of this page. This will create a copy of this repository in your account.
Clone the (forked) repository                       # git clone git@github.com:msoodb/first-contributions.git
Add Upstream                                        # git remote add upstream
Sync your fork (origin)                             # git checkout master; git fetch upstream; git merge upstream/master
Create a feature branch                             # git checkout -b add-msoodb
Make necessary changes and commit those changes     # git add Contributors.md; git commit -m "Add msoodb to Contributors list"
Make work more presentable                          # tidy/squash commits, write good commit messages. Also wrebase your branch.
Push changes to GitHub                              # git push origin add-msoodb
Submit your changes for review                      # If you go to your repository on GitHub, you'll see a Compare & pull request button. Click on that button, submit the pull request.
Sync your fork (origin)                             # git checkout master; git fetch upstream; git merge upstream/master
Delete feature branch


""" Manipulating Commits """
$git log --oneline                                  # See witch commit should be squashed
$git rebase -i HEAD~<number_of_commits>             # Rewording, Deleting, Squashing, Splitting


""" Low Level git """
$echo "Hello World" | git hash-object -w --stdin
