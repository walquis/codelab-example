summary: Git Basics
id: git-basics
categories: git
tags: beginner
status: Published 
authors: cwalquist
Feedback Link: https://dev.null

# Git Basics - Collaborating with Git
<!-- ------------------------ -->
## Overview 
Duration: 1

In this two-session hands-on course, you will experience the essence of git by working in teams to build a simple static website, laying a foundation for collaborating in a professional environment.

I've presented some variation of this material to every CodePlatoon cohort since Bravo. Several graduates report that, equipped with a firm grasp of these git basics, they have become go-to resources for git in their software teams.

Your team will collaborate on changes, working in parallel and delivering to main until your site looks more or less like the sample project (you can view it locally by cloning it and opening index.html in your browser).

As you proceed, you will get lots of practice expressing your changes in terms of git's data model - The Three Objects - and moving them around in git's state model - The Three Trees.

The three objects - blob, tree, commit
The three trees - HEAD, index, workspace
Along the way, we will practice some Common Git Workflows.

By the end of our time, we'll have substantially covered the topics in the Course Syllabus.

<!-- ------------------------ -->
## Course Schedule
Duration: 2

### Prework
The Prework consists of...

- Reviewing the Syllabus.
- Taking a look at a sample project repo.

### Session One - Git Trees and Git Objects

#### Sprint 1.1
- *Instruction* - 40 min - Set up your team and your git repo. Some orientation w.r.t. class and basic Git/Linux.
- *LAB 1.1* - 20 min - local/remote workflow - Each member of the team commit and push at least one (non-merge-conflicting) change.

#### Sprint 1.2
- *Instruction* - 30 min - Using each team's existing repo and git reset, demonstrate moving changes back and forth in The Three Trees.
- *LAB 1.2* - 30 min - git reset - Each member make changes and move them forward and back, using git commands including `git reset` with appropriate options.

#### Sprint 1.3
- *Instruction* - 30 min - Walk the class through creating and resolving a merge conflict.
- *LAB 1.3*& - 30 min - merge conflicts - Each team member change same line in a file, and practice resolving merge conflict.

### 3 Objects, 3 Trees Exercise (can be homework)
Work through the entire Objects and Trees Exercise, poking around in the project repo you started in Session 1. We'll have already touched on these concepts, but this exercise is designed to test and expand your understanding.

### Session Two - Collaborate with your team to run the project

#### Sprint 2.1
- *Instruction* - 30 min - Branching and merging. A look at a sample project repo.
- *LAB 2.1* - 30 min - project collaboration - Feel free to use the sample project repo's commits for inspiration as to what your team should do.

#### Sprint 2.2
- *Instruction* - 30 min - Managing commits with 'git rebase' and 'git cherry-pick'. [Demonstrate squashing the sample repo's last 3 commits. Discuss the caveats of altering already-pushed commits].
- *LAB 2.2* - 30 min - LAB 5 - rebase and cherry-pick

- *LAB 2.3* - if time - More project collaboration - Keep delivering changes to your website.

### Wrap-up
- Final comments.
- Students complete feedback survey.

<!-- ------------------------ -->
## Sprint 1.1 - local/remote workflow
Duration: 20

### Instruction - Set up your team and your git repo
Some orientation w.r.t. class and basic Git/Linux.
### Lab 1.1 - local/remote workflow, with no merge conflicts
- Each member of the team commit and push at least one (non-merge-conflicting) change.

<!-- ------------------------ -->
## Sprint 1.2 - git reset
Duration: 30
### Instruction
Using each team's existing repo and git reset, demonstrate moving changes back and forth in The Three Trees.
### Lab 1.2 - git reset
Each member make changes and move them forward and back, using git commands including `git reset` with appropriate options.

<!-- ------------------------ -->
## Sprint 1.3 - resolve merge conflicts
Duration: 30

### Instruction
Walk the class through creating and resolving a merge conflict.
### LAB 1.3 - resolve merge conflicts
Each team member change same line in a file, and practice resolving merge conflict.

<!-- ------------------------ -->
## 3 Objects, 3 Trees Exercise (can be homework)
Duration: 60

Work through the entire Objects and Trees Exercise, poking around in the project repo you started in Session 1. We'll have already touched on these concepts, but this exercise is designed to test and expand your understanding.

<!-- ------------------------ -->
## Sprint 2.1 - project collaboration
Duration: 30

### Instruction
Branching and merging. A look at a sample project repo.
### LAB 2.1 - project collaboration
Feel free to use the sample project repo's commits for inspiration as to what your team should do.

<!-- ------------------------ -->
## Sprint 2.2 - `git rebase` and `git cherry-pick`
Duration: 30

### Instruction - Managing commits with 'git rebase' and 'git cherry-pick'.
Demonstrate squashing the sample repo's last 3 commits. Discuss the caveats of altering already-pushed commits.

### LAB 2.2 - rebase and cherry-pick

### LAB 2.3 - More project collaboration
Keep delivering changes to your website as a team.

### Wrap-up
- Final comments.
- Feedback survey.

<!-- ------------------------ -->
## References
Duration: 1

Most of these are from Git-Scm

- 1.1 - Nice-to-Know - Skim - 3 min - About Version Control
- 1.3 - Fundamental - Read Carefully - 10 min - Git Basics
- 2.2 - Fundamental - Skim - 5 min - Recording Changes to the Repo
- 2.5 - Fundamental - Skim - 5 min - Working With Remotes
- 5.2 - Nice-to-Know - Skim - 10 min - Contributing to a Project
- Essential - Git Objects - The Three Objects: Commit, Tree, Blog
- Essential - Reset Demystified - The Three Trees: HEAD, Index, Workspace
- Branches In a Nutshell
- Resolve Merge Conflicts
- Rebase - Replay a string of commits onto another place
- Cherry-pick - grab a commit from another branch
- Bisect - Find the commit with the bug
- Highly Recommended - A bash tutorial, such as Bash Scripting For Beginners. At a minimum, know these basic Linux commands.
- Be Your Own Best Friend - Learn Vim. Just learn it. Here, here, here, and/or here.


Checkout the official documentation here: [Codelab Formatting Guide](https://github.com/googlecodelabs/tools/blob/master/FORMAT-GUIDE.md)
