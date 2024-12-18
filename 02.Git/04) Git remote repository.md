1) 'git remote -v' lists the remote repositories associated with your local Git repository.

2) Origin is the default name given to the remote repository. The URL shown is the location of your remote repository on GitHub (or another Git hosting service).

3) 'git remote add origin <URL>' This command adds a new remote repository under the name origin.
It's typically used to link your local repository to a remote repository when you first set it up.

4) 'git push origin -u master' This command pushes our local master branch to the origin remote repository.

5) 'git clone <URL>' - This command creates a copy of a remote repository on your local machine. It’s used to clone a repository, including all its history, branches, and files.

6) GitHub is a web-based platform that provides hosting for version control and collaboration using Git. It is widely used by developers to manage and collaborate on software projects. Here’s an overview of GitHub and its key features:

GitHub uses Git, a distributed version control system, to track changes to files and manage different versions of a project.

GitHub hosts repositories (repos) where you can store and manage your code. Each repository contains all the project’s files and the revision history.

Multiple people can work on the same project simultaneously. GitHub provides tools for code review, issue tracking, and discussion to facilitate collaboration.

GitHub allows you to create branches to develop features or fix bugs independently from the main codebase. Changes can later be merged back into the main branch.

7) How to add git repository to github? What are steps?

First, we should have directory where we have already initialize git using "git init". Then it is needed to commit tracked files here.
Now we should go to github website and click "Create New Repository" and here we need to copy URL link.

In the command line on the directory, we need to write "git remote add origin <URL>".
Then using that command we can push our code to github: "git push -u origin master".

8) If we update our files in directory and want it change in github too, basically we need to add these files to tracked files and then commit them. Then we need just to use "git push" command and refresh github page to see new updates.