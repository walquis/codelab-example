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

#### Sprint (and Lab) 0.5 - Setup
- 15 min - Set up your team and your git repo.

#### Sprint 1.1 - local/remote operations
- *Instruction* - Go over "local" vs "remote" operations.
- *LAB 1.1* - 20 min - local/remote operations - Each member of the team commit and push at least one (non-merge-conflicting) change.

#### Sprint 1.2 - git reset
- *Instruction* - 30 min - Using each team's existing repo and git reset, demonstrate moving changes back and forth in The Three Trees.
- *LAB 1.2* - 30 min - git reset - Each member make changes and move them forward and back, using git commands including `git reset` with appropriate options.

#### Sprint 1.3 - merge conflicts
- *Instruction* - 30 min - Walk the class through creating and resolving a merge conflict.
- *LAB 1.3* - 30 min - merge conflicts - Each team member change same line in a file, and practice resolving merge conflict.

### 3 Objects, 3 Trees Exercise (can be homework or prework)
Work through the entire Objects and Trees Exercise, poking around in the [Sample Project Repo](https://github.com/walquis/git-basics-sample-project-repo/commits/main){:target="_blank"}.

### Session Two - Collaborate on the project; `git rebase`, `git 

#### Sprint 2.1
- *Instruction* - 30 min - A basic workflow involving changing a local branch, merging to main, and pushing.
- *LAB 2.1* - 30 min - project collaboration - Deliver some changes as a team.

#### Sprint 2.2 - git rebase
- *Instruction* - 30 min - Managing commits with 'git rebase'.
- *LAB 2.2.1* - 10 min - `git rebase` - Replay commits onto another branch
- *LAB 2.2.2* - 20 min - `git rebase -i` - Squash/rewrite commits on current branch

#### Sprint 2.3 - git cherry-pick
- *Instruction* - Show how to use `git cherry-pick` to copy a commit from another branch to current branch.
- *LAB 2.3* - 10 min - `git cherry-pick`

#### *Sprint 2.4* - if time - Collaborate to deliver more changes to your website.
Allocate tasks among your team, and practice.  The [Sample Project Repo](https://github.com/walquis/git-basics-sample-project-repo/commits/main){:target="_blank"} demonstrates some examples of changes your team could make.

### Wrap-up
- Questions/comments
- Students complete feedback survey

<!-- ------------------------ -->
## Sprint and Lab 0.5 - Set up team's git repo
Duration: 15

Orientation, setup, and basic Git/Linux.

**Objective**: Team lead create repo and add collaborators; everyone clone repo

**Evidence**: Screenshot of your successful `git clone`.

1. **Project team lead**: Create a repo on github.com (check the box for a README).
1. **Project team lead**: Invite your teammates as collaborators to that repo.
1. **Everyone**: `git clone` team lead's repo to your local machine.
1. **Everyone**: Run these commands locally (if you haven't already):
```
alias adog='git log --all --decorate --oneline --graph'
git config --global pull.rebase false  # Tell git what to do when pulling
git config --global core.editor "code --wait"  # Set git editor to vscode
unset LESS   # Leave 'adog' output on screen after exit (no -R)
```

<!-- ------------------------ -->
## Sprint 1.1 - local/remote operations
Duration: 20

### Instruction
Discuss what "local" and "remote" are...which operations are local and which involve the remote.

### Lab 1.1 - local/remote operations (with no merge conflicts)
**Objective**: Each member of the team commit and push at least one **non-conflicting** change.

**Evidence**: Screenshot of your successful `git push`.

1. Coordinate among your team, such that each team member creates and pushes one file: For example a file could be named `index.html`, `help.html`, `about.html`, `faq.html`, `map.html`, or similar.  The file can be empty.  For instance:
```
$ touch index.html
$ git add index.html
$ git commit -m "Empty index.html"
$ git push origin main
```
1. Explore: What happens if you're not the first one on your team to push? (This will be N-minus-one of you!)  How do you resolve it?  Does this qualify as a merge conflict?

<!-- ------------------------ -->
## Sprint 1.2 - git reset
Duration: 30

### Instruction
Using each team's existing repo and git reset, demonstrate moving changes back and forth in The Three Trees.

### Lab 1.2.1 - git reset
**Objective**: Each student change a file in local git repo; move change into git and back out, using git commands including `git reset` with appropriate options.

**Evidence**: Screenshot of command history, ending with `git diff` showing modified file as it was when changed at beginning of lab.

For instance:  Supposing you had previously committed `index.html`, your session might look something like this...
```
$ git status   # Make sure no changes are in-progress.
$ cat >> index.html
Hi, this is a line at the end of this file
[Press Ctrl-D]
$ git diff
$ git diff --staged
$ git add index.html
$ git diff
$ git diff --staged
$ git commit -m "adding a line at end"
$ git diff
$ git diff --staged
$ git reset --soft HEAD^
$ git diff
$ git diff --staged
# Why wouldn't this be "HEAD^" ?
$ git reset --mixed HEAD  # Could omit '--mixed' since it's the default
$ git diff
$ git diff --staged
$ git reset --hard HEAD
$ git diff
$ git diff --staged
$ cat index.html
```

### Lab 1.2.2 - git reflog
**Objective**: Each student: Use `git reflog` and `git reset` to restore the change committed in Lab 1.2.1.

**Evidence**: Screenshot of relevant terminal session, ending with `cat index.html`

Your terminal session might look something like this:
```
$ cat index.html
$ git reflog
# Use info in reflog to determine what to do with git reset
$ git reset --hard Some-SHA-from-reflog
$ cat index.html
```

<!-- ------------------------ -->
## Sprint 1.3 - merge conflicts
Duration: 30

### Instruction
Demonstrate creating and resolving a merge conflict (with local branches).

### LAB 1.3 - resolve merge conflicts
**Objective**: Each student create and resolve a merge conflict (from a remote branch).

**Evidence**: Screenshot of github.com commit history, showing successful push from each team member.

1. **Everyone**: `git pull`.
1. **Team Lead**: Edit `index.html` and put this text at the top; then git add/commit/push:
```
<head>
    <title>Anybody's Page</title>
</head>
```
1. **Everyone**: Edit index.html and add similar text at top, except use your name instead of 'Anybody': 
```
<head>
    <title>Jessey's Page</title>
</head>
```
Add/commit and __attempt__ to push.  Of course, it will fail.

Use the merge conflict resolution approach demonstrated in class to resolve the conflict (it's your choice as to how you do so).


<!-- ------------------------ -->
## 3 Objects, 3 Trees Exercise (can be homework or prework)
Duration: 60

Work through the entire Objects and Trees Exercise, poking around in the project repo you started in Session 1. We'll have already touched on these concepts, but this exercise is designed to test and expand your understanding.

<!-- ------------------------ -->
## Sprint 2.1 - project collaboration
Duration: 30

### Instruction
Walk the class through an example of a workflow involving creating a local branch, making changes, `git pull` on main, merging the local branch, and `git push`.

### LAB 2.1 - project collaboration
Practice delivering some changes to your website as a team.

For inspiration as to tasks to assign each team member, use the content and commit history of the [Sample Project Repo](https://github.com/walquis/git-basics-sample-project-repo/commits/main){:target="_blank"}.

<!-- ------------------------ -->
## Sprint 2.2 - `git rebase`
Duration: 30

### Instruction - Managing commits with 'git rebase'

### LAB 2.2.1 - `git rebase`
**Objective**: Use `git rebase` from the command line.

**Evidence**: Screenshot of `adog` output, showing successful rebase.

1. Create an empty git repo
Starting on branch `main` ...
```
$ mkdir rebase-practice
$ cd !$  #  Shell "bang-dollar" shortcut refers to last arg of previous cmd 
$ git init .
$ git checkout -b main
```
1. Make 3+ commits to the repo.  Your commit graph should look something like this:
```
$ adog
* 25a2e7a (HEAD -> main) add line 3 to afile
* b34daef add line 2 to afile
* ba2ca4d add line 1 to afile
* fcf6a66 empty file 'afile'
```
1. Checkout on a new branch, that **starts from the first commit in the repo**.
```
$ git checkout -b newbranch fcf6a66   # Your SHA will be different of course
```
1. Make 3+ commits on the new branch, to `anotherFile`, similar to what you did with `afile`.
1. Your commit graph should now look something like this.  Verify that your new `newbranch` **diverges** from `main`.
```
$ adog
* 0f37279 (HEAD -> newbranch) add line 3 to anotherFile
* 89aef26 add line 2 to anotherFile
* f31caf6 add line 1 to anotherFile
* d528c0d empty second file
| * 25a2e7a (main) add line 3 to afile
| * b34daef add line 2 to afile
| * ba2ca4d add line 1 to afile
|/
* fcf6a66 empty file
```
1. **Rebase the new branch onto main.**
```
$ git rebase main
```
1. Verify that `newbranch`'s commits now "sit on top of `main`".  You now have a **linear history** of these changes.
```
$ adog
* 1a9bc0d (HEAD -> newbranch) add line 3 to anotherFile
* 239980c add line 2 to anotherFile
* e5c9354 add line 1 to anotherFile
* b278a34 empty second file
* 25a2e7a (main) add line 3 to afile
* b34daef add line 2 to afile
* ba2ca4d add line 1 to afile
* fcf6a66 empty file
```

#### LAB 2.2.2 - `git rebase -i`
Demonstrate squashing the sample repo's last 3 commits. Discuss the caveats of altering already-pushed commits.

**Objective**: Use `git rebase -i` from the command line to squash all commits down to two.

**Evidence**: Screenshot of `adog`, `git show --oneline`, and `git show --oneline @^` output, showing successful squash.

Using the rebased `newbranch` from above...
1. Make sure your git client's core.editor is set appropriately (should have been done during setup).
1. Start the rebase...
```
$ git rebase -i fc6ca66  # First commit; your SHA will vary.
```
1. Squash all commits down to 2: one commit for `afile`, and the 2nd commit for `anotherFile`.

**Remind your instructor to discuss**:  Why is `main` now diverging from your branch again?  What happens if you've already pushed `main` when you locally rebase commits prior to `main`?

## Sprint 2.3 - `git cherry-pick`

### Instruction
Show cherry-picking a commit.

### LAB 2.3 - `git cherry-pick`

**Objective**: Use `git cherry-pick` from the command line to copy a commit from another branch to current branch.

**Evidence**: Screenshot of `adog`, showing a successful `git reset`, followed by a `git cherry-pick`.

1. Restore `newbranch` to where it was before any rebasing was done, i.e., to the commit with comment "add line 3 to anotherFile".  (Use `git reset --hard` to do this).
1. Cherry-pick the commit from `main` labeled "add line 1 to afile" onto your `newbranch`.

## Sprint 2.4 - Run some collaboration (if time)
Keep delivering changes to your website as a team.  For inspiration as to tasks to assign each team member, use the content and commit history of the [Sample Project Repo](https://github.com/walquis/git-basics-sample-project-repo/commits/main){:target="_blank"}.

### Wrap-up
- Final comments.
- Feedback survey.

<!-- ------------------------ -->
## References
Duration: 1

Most of these are from [Git-Scm.com](https://git-scm.com){:target="_blank"}.

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
