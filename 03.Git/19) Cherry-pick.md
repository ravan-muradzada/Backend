What is cherry-pick?

git cherry-pick is a Git command used to apply changes from a specific commit (or commits) onto the current branch. Instead of merging or rebasing entire branches, git cherry-pick allows you to select individual commits from another branch or from your commit history and apply them to your current branch.

When to Use git cherry-pick? 

Isolated Bug Fixes: If you have a bug fix in one branch and want to bring it into another branch without merging other changes, cherry-picking is perfect.

Selective Application of Features: When you only want to apply specific features or commits from one branch to another.

Quick Patches: If a commit in another branch is urgently needed on a different branch, cherry-pick lets you apply it without dealing with a full merge.


In summary, git cherry-pick is a powerful tool for applying individual commits from one branch to another, giving you fine-grained control over what changes to bring into your current work.

-----------------------------

The basic syntax is like that: git cherry-pick <commit-hash>


Key Points about git cherry-pick

Selecting Specific Commits: Unlike git merge or git rebase, which operate on entire branches, git cherry-pick allows you to be selective and pick individual commits to apply to your branch.

Creates a New Commit: Even though you’re applying an existing commit, cherry-picking creates a new commit on your current branch. The original commit’s hash is not preserved; instead, a new hash is generated, but the content and message remain the same.

Cherry-Picking Multiple Commits: You can cherry-pick multiple commits at once by specifying a range:
git cherry-pick <start-commit>..<end-commit>

Or by listing individual commits:
git cherry-pick abc1234 def5678 ghi9012


If the changes in the cherry-picked commit conflict with existing changes in your branch, Git will pause the cherry-pick and prompt you to resolve conflicts. After resolving conflicts, you need to add the file to staging area and finish the cherry-pick with:
git cherry-pick --continue


Abort Cherry-Pick: If something goes wrong or you don’t want to continue with the cherry-pick, you can abort the process:
git cherry-pick --abort
