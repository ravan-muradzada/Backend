git reset is a powerful Git command used to undo changes by moving the current HEAD to a different commit, altering the state of the working directory, the staging area, and the commit history. It’s often used to “uncommit” changes, update the index (staging area), or modify the working directory without making a new commit. Depending on the options you use with git reset, it can either leave or discard changes in your working directory and the staging area.

-----------------------------
Key Concepts
HEAD: Points to the current commit you're working on.
Commit History: All the previous commits made to the repository.
Staging Area (Index): Where files are placed before committing.
Working Directory: The actual files on your file system (what you see and edit).
-----------------------------

git reset [mode] [commit]

[mode]: Defines how the command affects the working directory and staging area. It can be one of three options: --soft, --mixed, or --hard.
[commit]: Specifies the commit to which HEAD should be reset.

Modes of git reset:

1) --soft: moves HEAD to the specified commit but keeps both the staging area and working directory unchanged. You can use it when you want to undo the last commit(s) but keep your changes staged for a new commit.

2) --mixed (default): Moves HEAD to the specified commit, clears the staging area (index), but leaves the working directory untouched. You can use if you want to uncommit and unstage changes, but keep your working directory unchanged so you can review or re-stage them.

3) --hard: All changes after the specified commit are discarded completely, both from the staging area and the working directory. You've made several commits or changes, but decide you want to completely revert back to a previous commit and discard all the changes since then. This is a destructive reset, so use it with caution.
HEAD is moved back to the specified commit.
Staged changes are cleared.
Working directory is reset to match the specified commit.
All uncommitted changes are lost.

---------------------

While writing its command, we can use commit's hash or HEAD~n. (n is natural number).
HEAD~n: Refers to the commit n steps (or "parents") before HEAD. So, HEAD~1 is the parent of the current commit, HEAD~2 is the grandparent, and so on.