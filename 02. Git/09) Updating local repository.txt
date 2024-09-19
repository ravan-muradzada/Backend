To keep our local repository updated is important. Especially, after merging the other branches with the master branch, we may want to get new master branch again to see all updates and work from this repository version and thus we need to be able to update our local repository.

'git fetch' - retrieves updates from the remote repository but does not automatically merge those changes into your local branch. Used like 'git fetch origin'
This command fetches all branches from the remote repository (origin), but your local branches will not be updated. You’ll need to manually merge or review the changes.

'git merge' - integrates changes from one branch into another. Used like 'git merge origin/main'.
This command merges changes from the origin/main branch (the remote tracking branch) into your current branch.

'git pull' - is a combination of git fetch and git merge. It retrieves changes from the remote repository and merges them into your current branch in one step.
Used like 'git pull origin main'.
This command fetches updates from the origin/main branch and merges them into your current branch.