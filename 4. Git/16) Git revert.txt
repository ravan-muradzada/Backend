git revert is a Git command used to undo changes by creating a new commit that reverses the effects of a previous commit. Unlike git reset, which modifies the commit history, git revert is considered a "safe" way to undo changes, especially in shared repositories, because it doesn't rewrite history. Instead, it preserves the history by adding a new commit that negates the changes made in the original commit.

Basically, the new commit is created and here the changes in specific commit is neglected.

Syntax:

git revert <commit-hash>

You can also revert a range of commits, but this is done in a sequence of individual revert operations, not in one go.
git revert <oldest-commit-hash>..<newest-commit-hash>
