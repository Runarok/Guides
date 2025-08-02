Assignment3:Version Control with GitBranching: 
Create a new branch in your Git repository called "feature-branch." 
Make changes to a file in this branch and commit them. 
Provide a screenshot of the branch creation and commit process.
Merging: Merge the "feature-branch" into the main branch. 
Explain the merge process and resolve any conflicts if they occur

1. Create a new branch:
git branch feature-branch

2. Switch to the new branch:
git checkout feature-branch

3. Make changes to a file:
Edit a file in your project.

4. Stage the changes:
git add <file_name>

5. Commit the changes:
git commit -m "Added a new feature"

Merging the Feature Branch into Main
1. Switch to the main branch:
git checkout main

2. Merge the feature branch:
git merge feature-branch

Understanding the Merge Process
When you merge a branch, Git attempts to combine the changes from both branches into a single commit. If there are no conflicts (i.e., both branches have made changes to different parts of the same file), the merge is straightforward. However, if there are conflicts, Git will stop the merge process and indicate the files with conflicts.
Resolving Conflicts

If there are conflicts, you'll need to manually resolve them. Git will mark the conflicting sections in the file with special markers (<<<<<<<, =======, >>>>>>>). You'll need to edit the file to decide which changes to keep.

Example:
<<<<<<< HEAD
This is the main branch version
=======
This is the feature branch version
>>>>>>> feature-branch

You would then edit the file to choose between the two versions or combine them as needed.
Once the conflicts are resolved:
git add <conflicted_file>
git commit -m "Merged feature-branch with conflict resolution"
