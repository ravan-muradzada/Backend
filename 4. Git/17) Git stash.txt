git stash is a command used to temporarily save changes in your working directory and staging area (index) that you’re not ready to commit. This allows you to clean your working directory and switch branches or perform other tasks without losing your uncommitted changes.

Some commands related to stashing process:

1) git stash: This command saves the current state of your working directory and index, creating a new stash entry and reverting your working directory to the state of the last commit.

2) git stash push -m "message": Adds a descriptive message to your stash, making it easier to identify later.

3) git stash list: Displays a list of all stash entries, each with an identifier like stash@{0}, stash@{1}, etc.

4) git stash apply: Applies the most recent stash entry to your working directory. The stash entry remains in the stash list.

5) git stash pop: Applies the most recent stash entry and then removes it from the stash list.

6) git stash drop stash@{n}: Deletes a specific stash entry without applying it.

7) git stash clear: Removes all stash entries.

-----------------------------------------------

If we have two stashes from two different branches, we can apply them for each other, even if the stash was created on a different feature branch.
When you apply the stash from the first branch to the second branch, Git will attempt to merge the changes from the stashed commit into the current state of the second branch. If the changes in the stash do not conflict with the current state of the second branch, Git will apply the stash cleanly, and the modifications will appear in your working directory. However, if there are conflicts (for example, if the same file or lines were changed in both the stash and the second branch), Git will prompt you to resolve the conflicts manually. After resolving them, you can continue working with the applied stash. This flexibility in Git allows you to reuse changes across different branches, but it may require careful conflict resolution depending on how different the branches are.


