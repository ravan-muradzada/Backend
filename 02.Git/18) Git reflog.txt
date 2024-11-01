git reflog is a powerful command in Git that allows you to view the history of changes made to the references (like HEAD or branch pointers) in your local repository. It provides a record of all the movements of HEAD, including commits, checkouts, resets, rebases, and other operations. This makes git reflog an essential tool for recovering lost commits or undoing certain actions.

Key Concepts of git reflog:

Local-Only History: git reflog tracks the local changes to HEAD and branches. It is independent of what’s pushed to or pulled from a remote repository, meaning that reflog entries exist only on your local machine.

Reference Movements: Every time HEAD moves (for example, when you make a commit, checkout a branch, or reset), Git records that movement in the reflog. This includes actions that do not appear in the usual commit history, such as checking out a different commit or resetting a branch.

Recover Lost Commits: If you accidentally reset, rebase, or checkout a different branch and seem to have lost commits, git reflog helps you recover those commits. It records every movement of HEAD, so even if commits are no longer in the branch’s visible history, they can still be referenced and restored.

---------------------------------------

The syntax:
git reflog

'git log -g' command is used to view the history of changes in the Git reflog. This command provides a log-style view of the reflog, showing the changes to references (like HEAD or branches) in a more detailed format, similar to git log. It includes commit messages, timestamps, and other information about each change.

'git reflog --since="1.hour"' command filters the reflog entries and shows only those that were made within a specific time range. In this case, it displays the reflog entries created within the last hour.

---------------------------------------

How to restore lost commits?

If you've lost commits due to actions like git reset, git rebase, or even an accidental branch deletion, you can recover those commits using git reflog. Reflog keeps track of the movements of HEAD and branch pointers in your local repository, even for actions that aren't visible in the commit history.

When we use "git reflog", the list of all commits including lost ones will be displayed.
To restore the lost commit, we should use its hash.
So we can create a new branch starting from the lost commit.

For that we need to use that: 'git branch <new branch name> <hash of lost commit>'



