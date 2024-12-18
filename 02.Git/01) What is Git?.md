Git is a distributed version control system used to track changes in source code during software development. It allows multiple developers to collaborate on a project, manage different versions of the codebase, and maintain a history of changes.

1) Version control:
Git keeps a record of every change made to a project’s files over time. This allows developers to track the evolution of the project, identify when changes were made, and by whom.

2) Branching and Merging:
Git allows you to create branches, which are separate copies of the project where you can work on new features or bug fixes without affecting the main codebase. Once your changes are complete, you can merge the branch back into the main branch.

3) Distributed system:
Unlike centralized version control systems, Git is distributed, meaning every developer has a complete copy of the project’s history. This allows for better collaboration, offline work, and redundancy.

4) Collaboration:
Git enables multiple developers to work on the same project simultaneously without stepping on each other’s toes. Changes from different contributors can be integrated into the main project through pull requests and merges.

5) Commit history:
Git keeps a log of all commits, which are snapshots of the project at specific points in time. This history helps developers understand the context of changes and allows for easy rollbacks if something goes wrong.

6) Efficiency:
Git is designed to handle large projects efficiently. It uses compression and delta encoding to store changes in a way that minimizes storage space and speeds up operations.

---------------------------------------------------
What is commit and stage?

A commit is a snapshot of your repository at a specific point in time. When you commit changes, Git takes all the staged changes and stores them in the repository as a new commit. Each commit records:

The changes made (differences from the previous commit).
A unique ID (SHA-1 hash) that identifies the commit.
A commit message that describes the changes.
Metadata, such as the author and timestamp.

Committing is the way you save your changes in the version history. Each commit serves as a checkpoint that you can revert to, compare with, or use as a base for further development. It’s an essential part of tracking the evolution of your project.


Staging is the process of preparing changes to be included in the next commit. When you modify files in your working directory, these changes are initially unstaged. To include these changes in your next commit, you must stage them.
Staging allows you to control which changes are included in your next commit. You might have multiple changes in different files, but you can choose to stage only some of them, allowing you to make smaller, more logical commits.
---------------------------------------------------
Tracked and untracked files.

Tracked files are files that Git is aware of and is monitoring. These files are part of the repository and their changes are being tracked by Git. Tracked files go through different states:

Unmodified: The file has not been changed since the last commit.

Modified: The file has been changed but not yet staged for commit.

Staged: The file has been modified and is staged, meaning it's ready to be included in the next commit.

Untracked files are files that exist in your working directory but are not yet being tracked by Git. This means they are not part of the repository and will not be included in commits unless you explicitly add them. Git does not monitor changes to these files until you tell it to do so.

