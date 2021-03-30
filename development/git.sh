#!/bin/bash

""" 
Install and check version 
"""
sudo dnf install git
git --version
git --help


""" 
Config 
This config writed on ~/.gitconfig
"""
git config --global user.name "username"
git config --global user.name "useremail"
git config --global color.ui auto
git config -l

"""
Git Structure
"""
                 _________________________________________ git pull ____________________________________________________________
                |                                                                                                               |  
                V                                                                                                               |
 ___________________                             ______________                        ----------------                      _______________
|                   | --------- git add ------> |              |                      |                |                    |               |
| Working Directory |                           | Staging Area | ------git commit---> | Commit History | ------git push---> | Remote Server |
|                   | <--- git rm --cached ---  |              |                      |                |                    |               | 
 -------------------                             --------------                        ----------------                      ---------------
		^                                         ^                                  | |    |                               |
                |                                         |                                  | |    |                                -> github git remote add origin
		|					   -git restore --staged <filename>--  |    |                                -> gitlab
	         ----------------- git restore <filename> -------------------------------------      -> git log
											             -> git show <HASH>
"""
Basic Command
"""
git init .                         # Initialize git repository in Working directory
git status                         # View files status
git add <filename>                 # Add <filename> to Staging Area
git add .                          # Add all files in current directory to Staging Area
git add -A                         # Add all files to Staging Area
git rm --cached <filename>         # Remove <filename> from Staging Area
git rm -r --cached .               # Remove all files from Staging Area
git commit -m "<message>"          # Commit stagged files
git log                            # Log all commits
git log --oneline                  # Log all commits each log one line
git show <HASH>                    # Show commit with hash <HASH>
git show <HEAD>:<filename>         # Show commited version of <filename>
git diff                           # Diff between Commite and working directory
git diff --staged                  # Diff between Commite and Stagged
git restore <filename>             # Restore last commited file and ignore changes in Working Directory
git command --amend -m "<message>" # Amend commit message

"""
Remote Server, Config ssh key
"""
git remote add origin <git URL>
git branch -M main
git push -u <origin> <main>
git pull <origin> <main>

"""
Branches
"""
git branch                       # Branches in local machine
git branch -r                    # Branches in remote server
git branch -a                    # Branches in local machine and remote server
git branch <branchname           # Create new branch from active branch
git checkout <branchname>        # Checkout to branch <branchname>
git checkout -b <branchname>     # Create branch and checkout from active branch
git branch -d <branchname>       # Delete branch only IF branch commited
git branch -D <branchname>       # FORCE Delete branch
git remote prune origin          # In case of Git remote branch deleted, but still it appears in 'branch -a'
git branch -d -r origin/<branch> # In case of Git remote branch deleted, but still it appears in 'branch -a'


"""
git workflow
"""

