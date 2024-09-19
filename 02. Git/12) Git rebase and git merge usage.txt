Actually, in most cases, it's not recommended to rebase your feature branch directly onto the `master` branch, especially in a company with a large codebase and multiple developers. Let’s break down why, and clarify what should happen:

Why not rebase directly onto `master`?

1. Rewriting History: When you rebase, you're rewriting the commit history of your feature branch. This is fine for your local work, but if your feature branch has already been pushed to a shared remote (like a company's Git server), rebasing can cause conflicts and confusion for other team members who have already based their work on the previous state of the branch.
   
2. Shared Branch Issue: If multiple developers are collaborating on a feature branch, rebasing can lead to synchronization issues because everyone would need to force-pull the new history, potentially losing their work or causing conflicts.

What should happen instead?

In a typical company workflow, especially with a large codebase, you would follow these steps:

1. Keep your feature branch up to date with `master`:
   - While you're working on your feature branch, you would regularly merge or rebase your feature branch onto `master` to stay updated with the latest changes in `master`.
   - Why? This ensures that by the time you're ready to merge into `master`, your branch is compatible with all the new updates in the `master` branch.

2. Merge your feature branch into `master` (preferably using a pull request):
   - Once your feature is complete, tested, and reviewed, you should merge your feature branch into `master`. 
   - Merge, not rebase: You would create a pull request (PR) to merge your changes into `master`. This keeps the history intact and ensures your feature branch's work is fully traceable as its own set of commits, along with any associated comments or reviews.

3. Rebase your feature branch onto `master (only in certain cases):
   - Sometimes, before merging into `master`, teams might rebase the feature branch onto `master` to make sure the feature branch contains the latest changes from `master` and to ensure the history is clean. This is done within the feature branch, not directly on `master`.
   - After this, you would still do a merge (not rebase) into `master`.

Why Merge Instead of Rebase at the End?

- Safety and Traceability: Merging keeps the history clear. It shows that a feature branch was merged into `master` at a specific point in time, preserving the context of when the feature was added.
- Avoid Conflicts: Rewriting history (through rebasing) after your feature branch has been shared or reviewed can lead to conflicts and confusion among other developers who may already be working based on that history.
- Collaborative Workflow: Merging with a pull request allows for code reviews, automatic testing, and approval, which is standard in most companies.

Summary

So, in a large company with a shared codebase, the general practice is to merge your feature branch into `master`. You might rebase your feature branch *onto* `master` during development to keep your branch up-to-date with the latest changes, but when it's time to finalize, you do a merge to ensure the process is safe and the history remains clear.