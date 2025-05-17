1) Git ignoring allows you to specify files or directories that you want Git to exclude from tracking. This is useful for files that are generated automatically, configuration files, or temporary files that you don't want to clutter your repository.

How to create a .gitignore file?

Create a file named .gitignore in the root directory of your repository.
Add patterns to the file to specify which files or directories should be ignored.

Example patterns:
*.pyc: Ignores Python compiled bytecode files.
node_modules/: Ignores the node_modules directory used for npm packages.
*.swp: Ignores Vim swap files.

2) 'git log' is a command that displays a list of commits in your repository, along with information about each commit such as:

Commit hash: A unique identifier for the commit.
Author: The name of the person who made the commit.
Date: The date and time the commit was made.
Commit message: A brief description of the changes made in the commit.

'git log -n' (n is natural number) - shows last n commits.


