1) 'git init' is used to create a new Git repository. It initializes an empty repository in the specified directory or in the current directory if no path is given. This command is the first step when starting a new project with Git, as it sets up the necessary structure for tracking changes in your files.

2) 'git status' shows the current state of the working directory and the staging area. It displays which changes have been staged, which haven't, and which files are untracked by Git.

It Shows:
Tracked Files: Whether they are staged (ready to be committed) or modified but not yet staged.

Untracked Files: Files that are not being tracked by Git yet.

Branch Information: The current branch and whether it’s ahead or behind the remote repository.

'git status -s' is used for short-format output of the 'git status' command. It’s a quicker way to see the status of files without the more detailed output. [-s means --short]

The output is more compact, displaying a list of files with short codes indicating their status:
A (Added): A file is staged for commit.
M (Modified): A file has been modified.
?? (Untracked): A file is not being tracked by Git.
D (Deleted): A file has been deleted.

3) 'git add' is used to stage changes in your working directory. Staging a file means adding it to the list of files that will be included in the next commit.

git add <filename>          # Stages a specific file
git add .                   # Stages all changes in the current directory
git add *.txt               # Stages all .txt files in the current directory

4) 'git commit' is used to save changes to the local repository in Git. When you commit, you create a snapshot of the current state of your project, which becomes part of the project's history. This is a fundamental operation in version control, allowing you to track and manage changes to your codebase over time.

A commit represents a snapshot of all the files in your project at a specific point in time. It captures the state of the files that have been staged.

Each commit includes a commit message, which is a brief description of the changes made in that commit. The message helps provide context and rationale for the changes.

Every commit is assigned a unique identifier (a SHA-1 hash), which allows Git to reference it in history and manage relationships between commits.

Commits are stored locally in your Git repository. They are not shared with others until you push them to a remote repository using git push.

Use git commit to create a new commit with the staged changes. You can add a commit message using the -m flag.

If you omit the -m flag, Git will open your default text editor to allow you to write a detailed commit message.

'git commit -a' - Automatically stages all modified and deleted files before committing. It does not include untracked files.

'git commit --amend' - Modify the most recent commit. This is useful if you need to change the commit message or include additional changes.

'git commit --amend --no-edit' is used when we want to amend the commit, but keep the message same as before. The commit will be updated with the staged changes without opening the text editor.
Amending commits does not create a new commit, rather it just modifies the lastest one.

5) 'git rm <filename>' removes a file from both the working directory and the staging area. 

'git rm --cached <filename>' removes a file from the staging area, leaving it in the working directory.

'git rm -r -cached <directory>' removes a directory and its contents from the staging area only, leaving them in the working directory.

6) 'git restore' is used to revert or discard changes in your working directory.

Imagine you have a file with some information. Then you commit it and then make some changes in that file. In this case, if you use that command, this last changes will be discarded and commited version will be back.

'git restore --staged' used to unstage changes that have been added to the staging area (git add), effectively moving them back to the working directory.
