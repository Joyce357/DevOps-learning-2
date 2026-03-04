What is Git -- Git is what we call a `Version Control System`
Git helps us to colloborate , version control 
it helps to track changes in your code or files over time 

`What is a Version Control System ?`

It is a tool or software that records changes of a file or set of files over time so that you can recall a specific version later . This is very important in software development , content creation because it enbles individuals(users) or companies or teams to track changes to code or documents

Its important in software development because it helps to go back to previous versions (old versions) , see who made a change , and understand why the change was made

`Why is Version Control System Important in Software Development`

1. `Collaboration` : It allows multiple developers to work on the same project simultaneously without conflicts . They can merge their changes together and resolve any conflicts that may arise

2. Track Changes and Code History
3. It helps to rollback to previous versions
4. Backup and recovery .When you store changes , it makes it easy to recover them earlier or restore lost information .
5. It helps in accountability and auditing : Since every change is recorded, 
it's easy to audit the codebase and hold team members accountable for their contributions.
6. As DevOps version control systems helps us to rely on testing , automating ,deployments etc through CI/CD - Continous Integration and Continous delivery /deployment

`Types of Version Control Systems`

They are 3 main types / categories of version control systems

1. `Local Version Control Systems`

A Local Version Control System stores the repository and its version history entirely on the user's local computer. It tracks changes to files by maintaining a simple database of revisions, typically using delta encoding (storing differences between versions).

`Key benefits`

+ All version history is local — no server or internet required.
+ Simple and fast for solo developers or non-collaborative projects.

`Limitation`

+ No collaboration — changes can't be shared across machines or users.
+ High risk of data loss if the local machine fails (no backups on remote servers).

examples of local version control 

+ RCS (Revision Control System)
+ SCCS (Source Code Control System)
+ CVS (Concurrent Versions System) - can be used as local or centralized

2. `Centralized Version Control System` 

A Centralized Version Control System (CVCS) uses a central server to store all versions of the code. Developers check out files from the central repository, make changes, and then commit those changes back to the server.
Developers work on local copies of the code, but all changes must be synchronized with the central server to save revisions, collaborate, and share updates with others.

`Key Characteristics`

+ Single source of truth stored on a central server.
+ Developers checkout and commit code to/from the server.
+ Easier to manage and control access centrally
+ Common in enterprise teams before Git became dominant.

`Limitations`
+ Requires constant network access to the central server.
+ Single point of failure — if the server goes down, no one can commit changes or access the latest codebase.
+ Merging can be more difficult, especially with large teams, leading to conflicts.

`examples of a centralized version control system` 

+ Subversion (SVN)
+ Perforce
+ CVS (Concurrent Versions System) - can be used as local or centralized

3. `Distributed Version Control Systems (DVCS)`

A Distributed Version Control System (DVCS) allows developers to have a complete copy of the entire repository, including its history, on their local machines. Developers can work offline and commit (save) changes locally, then later push those changes to a central server or share them with other developers.

A good example is Git, the most widely used DVCS today. Unlike centralized systems, Git does not rely on a single server. Each developer works independently and can synchronize with a remote repository (like GitHub, GitLab, or Bitbucket) when needed.

`Key Benefits`

+ Full history and version control on each developer's machine.
+ Offline Access: You can commit (save), view history, and branch without internet.
+ Flexibility: Supports branching, merging, and rollbacks with ease.
+ Collaboration: Developers can share changes without needing a central server.
+ Fault Tolerance: Since each user has a full copy, there's no single point of failure.
+ Speed: Most operations are local, making them faster than centralized systems.

`Limitations`

+ Steeper learning curve for beginners due to more complex workflows.
+ Requires understanding of concepts like branching, merging, and rebasing.
+ Can be overkill for very small projects or teams that don't need distributed features.

`examples of distributed version control system`

+ Git
+ Mercurial
+ Bazaar



| Feature | Local Version Control System (LVCS) | Centralized Version Control System (CVCS) | Distributed Version Control System (DVCS) |
|----------|--------------------------------------|-------------------------------------------|--------------------------------------------|
| Where Code is Stored | Stored only on your local machine | Stored on a central server | Stored on every developer’s machine |
| Internet Required | No | Yes (to commit or update) | No (only needed when pushing/pulling) |
| Collaboration | Very limited | Multiple developers connect to central server | Fully collaborative, peer-to-peer sharing possible |
| Backup Safety | Risky (if local machine fails, history lost) | Safer (central server keeps history) | Very safe (every developer has full copy) |
| Speed | Fast (local operations) | Slower (network dependent) | Very fast (local commits) |
| Offline Work | Fully supported | Not supported for commits | Fully supported |
| Example Tools | RCS | SVN (Subversion), CVS | Git, Mercurial |
| Failure Risk | Single machine failure | Server failure affects everyone | No single point of failure |
| Branching | Limited support | Difficult and heavy | Easy and lightweight |
| Best For | Individual work | Small teams with strict control | Modern DevOps and large teams |



Git 

`What is Git` : Git is a distributed version control system designed to handle everything from small to very large projects with speed and efficiency. It enables multiple developers ,DevOps engineers , Cloud engineers to work on the same project simultaneously, managing changes to source code and keeping track of every modification. It was created by `Linus Torvalds` in 2005 for development of the `Linux kernel`.


Hired by: Team4tech solutions Offer letter : start date send your `personal laptop` : Mac , Windows I.T department : configured to meet security standards

ORG

Customer service / Tech support Sales department Marketing department HR Dept Software Dept

setting up your local environment

Install git
Install terraform
Install CLI




`What is the difference Between Git and Githhub`

+ Git is a version control system that tracks and manages changes to code, while GitHub is a hosting service for Git repositories (storage) that provides a web interface and additional features for project collaboration

+ Git can be used locally on a computer to manage versions of a project's files, whereas GitHub is used to host a copy of those files on the internet, making it easier to share and collaborate with others.

+ Git focuses on version control and code sharing. GitHub builds on Git's functionality with added features like issue tracking, GitHub Actions for automation, pull requests for code review, and a graphical interface for easier management of repositories.


VS CODE : IDE - Integrated development environment 

two ways you can control your computer  ----> GUI or CLI 

CLI ---> command line interface



    `GIT INSTALLATION` 

There are several ways to install Git .
This can be through git official website or through the CLI (Command line interface ).




`How to install git on MacOs `

For the website ( Graphical user interface )

+ Download the latest Git for Mac installer.
+ Go to the Git website to download the installer. (https://git-scm.com/install/)
+ Follow the prompts to install Git.
+ Open the downloaded DMG file and follow the installation wizard to install Git.
+ Use the Terminal to verify the installation.
+ Open Terminal and type    `git --version`
to verify the current version or if git has been successfully downloaded

Alternatively, you can use Homebrew, a package manager for macOS:

If Homebrew is not installed, open Terminal and install Homebrew by running:

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

Then, install Git with Homebrew by running:

`brew install git`

To verify installation : `git --version`


**Installing Git on Windows**

+ Download the latest Git for Windows installer.
+ Go to the Git website to download the installer https://git-scm.com/downloads
Use the Terminal to verify the installation by running the command : git --version
Installing Git on Linux

The installation process on Linux depends on the distribution you are using. For the most common distributions:

Debian/Ubuntu-based distributions:

sudo apt update - Update your operating system packages sudo apt install git. - installs git git --version - verifies git installation

Fedora:

Use the following command:

sudo dnf install git

Check the installation with git --version.

CentOS/RHEL:

On CentOS 7 (or RHEL 7), you can use Yum:

sudo yum install git

For CentOS 8 (or RHEL 8) and later, use DNF:

Verify with git --version.

`AFTER INSTALLING GIT - Next step is to configure your email and full names` 


Configure your username and Email address 

<git config --global user.name "your-name">
<git config --global user.email "your-email-address>

example 

git config --global user.name "Calson Njinoh"
git config --global user.email "calson@team4techsolutions.com

Next step - After configuring your email and user name . you can verify if the setup is correct by running the following commands

<git config --list>

or 
<git config --get user.name>
<git config --get user.email>

or 

<git config user.name>
<git config user.email>

you should see your username or email address 

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




`Setting up Authentication with HTTPS `

To set up authentication with HTTPS for Git, you can follow these steps:

1. Generate a Personal Access Token (PAT) on GitHub:

   - Click on your github profile 
   - Go to your GitHub account settings click on 
   - Navigate to "Developer settings" click on it at the far left---> click "Personal access tokens".
   - Select Expiration recommended 90 days but for learning you can select never expired 
   - Click on "Generate new token" `classic`  and select the scopes you need (e.g., repo, read:org).
   - Generate the token and copy it to a secure location.
   
   Note : When you try to clone a repository or push to a repository for the first time it will request to authenticate you . you can either authenticate using device or token . if you select token you will be prompt to add a PAT . This will authenticate and grant access . 





`Setting up Authentication with Github using SSH Keypairs` 

To set up authentication with GitHub using SSH key pairs, you can follow these steps:

1. Generate an SSH key pair on your local machine:

   - Open a terminal and run the following command to generate a new SSH key pair:

     `ssh-keygen` or `ssh-keygen -t ed25519 -C calson@team4techsolutions.com`

`Note` : when you generate an ssh key it comes with two keys . a Private and Public key .
The public key ends with .pub while the private key has no extention e.g 

id_ed25519 = private key 
id_ed25519.pub = public key

`step 1` : 
   run the following command :  `eval "$(ssh-agent -s)"`

`step 2` :

   add your private key to the ssh agent  :  `ssh-add ~/.ssh/id_ed25519`
or you can move to where the key is located .when you generate a key it creates a folder (directory) and it is a hidden directory.the folder is called a .ssh .to move into the folder you need to run the following command `cd .ssh` and once you are in the folder you can run the following command `ls ` to check your key and then add the key to your ssh agent by running the following command     `ssh-add id_ed25519`

`step 3`

Copy your public key : 

`cat ~/.ssh/id_ed25519.pub` or if you are in the .ssh folder you can run `cat id_ed25519.pub` to copy the public key


Inn github go to :

+ GitHub →Profile -> Settings → SSH and GPG keys → New SSH key
+ Paste the public key → give it a name
+ Save.


step 4

5. Test the SSH connection:

   - Run the following command to test your SSH connection to GitHub:

     `ssh -T git@github.com`

if the configuration is setup correctly you should see the following :

`Hi <Your name>! You've successfully authenticated, but GitHub does not provide shell access.`

if you see congratulations you have successfully configured ssh authentication with github 



You have been hired 

+ Receive your laptop from your company 
+ You installed git 
+ You configured your username and email address
+ Your company invited into their github organisation
+ You set up authentication with GitHub using either HTTPS or SSH key pairs



+ Clone the current projects the company is working on 



**GIT WORKFLOW**

How to contribute in an existing project at your company 

**example** . You have been employed and your company have added you on your companies github repository . They ask you to make changes to the project files and push the changes. What are some of the steps you will take to achieve this ?




Step 1 

create a project directory ( folder) , clone the project inside that directory 

mkdir <directory-name> e.g mkdir Class10-Git-Project
cd <directory-name> :e.g cd Class10-Git-Project  This will change directory moves you into a directory or folder
ls : List 
clear : means making your workspace clean 
cat : allows you to read the content of a file 

**Git commands** 

`git clone <repository url> :` 

This command is used to create a local copy of a remote repository. It allows you to download the entire repository, including its history, branches, and files, to your local machine. 
e.g : git clone 

`git branch` :

This command is used to list, create, or delete branches in a Git repository. It allows you to manage different lines of development within your project.

`git branch <branch-name>` : This will create new branch with the name you want 

`git checkout <new-branch-name> or git switch <branch-name>` This command will switch from one branch to another 

`git checkout -b <branch-name>`: This creates a new branch and automatically switch to the new branch 




**Git commands** 

1. `git clone <repository url> :` 

This command is used to create a local copy of a remote repository. It allows you to download the entire repository, including its history, branches, and files, to your local machine. 

e.g `git clone git@github.com:Team4techsolutions-Class10/class10.git`

2. `git branch` :

This command is used to list, create, or delete branches in a Git repository. It allows you to manage different lines of development within your project.

3. `git branch <branch-name>` : This will create new branch with the name you want 

4. `git checkout <new-branch-name>` This command will switch from one branch to another 

5. `git checkout -b <branch-name>`: This creates a new branch and automatically switch to the new branch 

6. `git status` :

This command is used to display the current state of the working directory and staging area. It shows which changes have been staged, which haven't, and which files are untracked.

refer to files or directories created in a project as a working area


7. `git add .` : 

This command is used to add changes in the working directory to the staging area. The dot (.) indicates that all changes should be added. It prepares the changes for the next commit (save).

or 

8. `git add <filename>` :

This command is used to add specific files to the staging area. Replace <filename> with the name of the file you want to stage.

9. `git commit` ;

This command is used to save the staged changes to the local repository. It creates a new commit with a message describing the changes. You can use the -m option to provide a commit message directly in the command, like this: `git commit -m "Your commit message here"`. 

10. `git commit -m "commit message here"` This creates a commit (saves) files ready to push into the repository 

Note all commits have what we call a commit i.d .This commit id helps to track what changes where made , when , by who etc 

11. `git push --set-upstream origin <branch-name>` 
e.g `git push --set-upstream origin update-notes`

This command is used to push the committed changes from your local repository to a remote (github) repository. The --set-upstream option is used to set the upstream branch for the current branch, which allows you to use git push without specifying the remote and branch name in future pushes. In this example, origin is the name of the remote repository, and update-notes is the name of the branch you want to push to.


**How can work with Git on a NEW PROJECT** 

1. `First Approach` 


+ Create a project directory 
+ Once you are in the project directory Initialize a new Git repository
each project you will need to initialized git . you will need to generate a local repository 

`git init` :
This command is used to initialize a new Git repository in the current directory. It creates a .git subdirectory that contains all the necessary files and structures for version control. After running git init, you can start tracking changes, creating commits, and managing branches within that directory.  

`Note` : If you clone an existing project from a git repository you do not need to run git init again . This is so because the project has git init already 

`Note` : When you initialized a local repository using git init , it creates a master branch and when you create a github repository it creates a main branch 

git is called distributed version control systems 
local git repository = machine - your computer 
remote repository  = github ( centralized location ) , gitlab , Bitbucket 

+ `git remote -v` : 

This command is used to display the remote repositories that are associated with your local Git repository. It shows the names of the remotes and their corresponding URLs. This information is useful for understanding where your code will be pushed or pulled from when you use commands like git push or git pull. The -v option stands for "verbose" and provides more detailed information about the remote repositories.

+ setup your remote repository where you need to push your new project to 

`git remote add <alais> <repository-url>

`git remote add origin <repository-url>`

+ `git add . or git add <file-name>`

+ `git commit -m "commit message"` 

or you can add and commit at the same using the && command e.g

`git add . && git commit -m "first commit"` 

+ Push your new project into the repository 
`git push --set-upstream origin <branch-name>`


2. Second Approach ( This commands can be found on the new github repository you created)

`git init`
`git add README.md`
`git commit -m "first commit"`
`git branch -M main`
`git remote add origin <repository url>`
`git push -u origin main`





#############################################


Git branch :

Git has what is called a Repository which is like a storage . It comes with a default branch `main` / `master` This branch holds your code storage or code base and therefore it's like your main storage . To be able to edit this code a good practise will be too create a new branch . what then are branches ? .Git branches are essentially pointers to a snapshot of your changes. When you work on a new feature, fix a bug, or experiment, creating a new branch in Git allows you to work on different versions of your repository at the same time, without affecting the stable or main version. This isolation makes it easier to manage features, fixes, and experiments independently.

When you clone a repository it comes with existing branches . To make a change on a branch you must create a new branch from the existing branch . The branch you created will come with all existing code base for you to work on
You can now make changes to the branch you created . Once these changes  are done you will need to commit the changes
After commiting the changes you will need push the changes into a remote repository
You would need to create a Pull Request for the code to be merge into the main or master branch 



**Key Terminologies In Git**

1. `Repository (Repo)` : A repository is a like a Project folder (storage) that git tracks .This this folder contains all files and directories . The is a .git directory or folder where git stores history and configurations

Two Types of Git Repositories

`Local Repostory` --> on your local computer ( git init ) it comes with a local repository (.git )
`Remote repository` ---> These are repositories stored on github , gitlab , Bitbucket

`Git init` : This command will initialized or create a local git repository to start tracking your project . Take note: Git init should be ran only when you are are starting a project from scratch . But if you are cloning an existing project already from github then there is no need to run git init

For each project you are starting from scratch you will need to initialized git

`Commit` saving changes at a specific point in time of the project . A commit is a snapshot of your changes at a specific point in time.

Note : - Every commit comes with Unique Commit ID (Commit Hash)

- Comes with a commit message . you must give a commit message explaing what you have add , modified or change - It comes with Author information (User)who made the commit and timestamp

`Branch` : A git branch is a copy of your saved code (commit) which allows you to isolate the code or work in parellel when developing Git branch comes with a default branch call the main or master branch

`Merge` : This is means combining changes done one branch with another If both branches changed the same part of a file, Git will ask you to resolve a conflict before completing the merge

`Remote` : A remote is a reference to a repository hosted somewhere else (e.g., GitHub, Gitlab ). Note : You can push changes to the remote repository (upload) and pull (download) changes .

`Staging Area` : A middle step between editing files and committing (saving) them.This is just the step where you move files or directories from your working area to your staging area . Meaning the files or directories are ready to be commited (save)

You stage files with git add before committing.

`HEAD` : HEAD is a pointer to the current branch and commit you’re working on.
Usually points to the latest commit in your branch.
You can move HEAD to different commits to “go back in time.

`Working /Project Directory`

The folder on your computer where you edit files.
It Contains your project’s current files as you see them.
Can have untracked changes (files Git doesn’t know about yet).

**Git Commands**

`git init` - Initialize git local repository in your project directory 
`git status` - It Checks the state of working directory and shows you files that you are currently working on and files that ready to be committed . Files currently in the working area are in red while files that are ready to be save (commit) are in green 
`git add <filename or directory-name>` : This adds a specific file or directory to the staging area ready for commit 
`git add .` : This on the other hand adds all files or directories in your working area to the staging area 
`git commit -m "commit message" or git commit` :  Saves changes 
`git add . && git commit -m "commit message"` : Using && command helps you add and commit at the same time


`Branching and Merging Commands`

Why Branches Are Used in git 

+ `Feature Isolation`: Work on new features without affecting the main code.
+ `Bug Fixes`: Fix issues without risking other parts of the code.
+ `Experimentation`: Test ideas safely, revert easily if needed.
+ `Collaboration` : Multiple people can work on different parts of a project at the same time.
Default Branches ---comes with github or git

Default Branch (Master or Main Branch)

**Branch Merge Types** ;

How can you take changes from one branch and combine with another branch 

+ Fast-forward merge Happens when there’s no divergence between branches. Git just moves the branch pointer forward.

Example: main → feature is directly ahead of it.

+ Three-way merge

Happens when branches have diverged. Git creates a new merge commit combining changes from both.

+ Merge Conflicts

Occur when Git can’t automatically decide which change to keep because the same line of code was modified differently in each branch.

Merging branches you can merge them through two ways ( Fast-forward or Three way merge)
Try as much as possible to avoid merge conflicts


`git branch` : it list branches, Shows all local branches. The current branch is marked with * which simply means that is the branch you are on . 

`git branch -a` : it lists local branches plus remote branches (local on your computer  + remote branches in github) 

`git branch <branch-name>` : It creates a branch with what ever name you will specify

`git checkout <branch-name>` or `git switch <branch-name>` : This switches from one branch to another

`git checkout -b <branchname>` : This creates a branch and switch to the branch at the same time 
`git merge <branch-name>` : This will combine changes from one branch into another 
`git stash` : This will temporary store or save changes so you can work on a different branch safely 
`git stash pop` :This will retrieve the temporary save work (file or directories) that you stashed
`git diff <branch-name>` : This shows the difference between two branches e.g you can check stage branch vs master branch .
Note : The branch you are on ,any information in read - red is missing on the branch while anything in green (+) is on your current branch but missing in the other branch you are comparing with 

`git branch -D <branch-name>` : This will delete a branch in your local environment 
`git branch -m <old-branch-name> <new-branch-name>` : This changes a branch name from old to new name 

`git branch --show-current` : This will show you the current branch you are on 

`git push [remote repository] [branch]` : This is to push changes to a remote repository on a specific branch 

`git push` : This will push your changes to the current branch you are on .This branch must be in existence in the remote repository.

`git push -set-upstream origin <new-branch-name>` : This will push a new branch that was created on your local machine or environment but the branch doesnt exist in the remote (github) repository

`git push --delete [remote repository] [branch-name]`': Deletes a branch from the remote repository (like GitHub, GitLab, Bitbucket). 


`git checkout --track [remote/branch]` : Creates a new local branch that is set up to track a remote branch.“Tracking” means your local branch is linked to a remote branch so git pull and git push know the branch 


**Checking Status & History commands**

`git status` :

This command is used to display the current state of the working directory and staging area. It shows which changes have been staged, which haven't, and which files are untracked. It helps you understand what changes are ready to be committed and what changes still need to be added to the staging area.

`git log`:

This command is used to show the commit history of the repository. It displays a list of commits, including the commit hash, author, date, and commit message. You can use various options with git log to customize the output, such as --oneline for a condensed view or --graph to visualize the branch structure.

Commit hash (SHA-1 ID)
Author name & email
Date
Full commit message
e.g

commit df3c10ca37241e5e7f2527baa631c4e6c3ed06c3 Author: Calson Njinoh castorprince619@gmail.com Date: Thu Aug 7 22:11:23 2025 -0400

git log --oneline --graph --decorate; This gives more details about the commit in lines

git rebase  : It moves or reapplies commits from one branch on top of another branch. Instead of merging (which creates a merge commit), it rewrites commit history so it looks like your work started from the latest base branch state.

git cherry-pick "commit id" :

GitHub Basics (Remote Repositories)

git remote -v : Lists the remote repositories linked to your local repo. when do you use this command ? you can use this when you need to confirm which remote repository is connected to your local repo especially when you want to push your code changes or new project

git push origin <branch> : Uploads commits from your local branch to the remote branch. e.g git push origin dev

git clone <repository name> : It creates a local copy of your existing remote repository (github repo) and brings to your local . it clones it with the following

A working directory (project)
The full commit history
A link to the remote repository
git pull This brings changes from your remote repository(github) that are not present in your local repository (github) git fetch : Shows your the changes on your remote repository that are not in your local but do not update your local

git remote add <alias-name> repository name : This helps to sync your local repository and your remote repository making it easier for you to push code changes

Summarize Git

Git is what you will install on your local computer ( Windows or MacOS)

Starting a new Project on your local computer (Bash shell scripting , Terraform , Ansible , Jenkinsfile etc )

Set your git local environment (username and email address ) --> git config --global user.name "username" git config --global user.email "email address" Init --> git add ---> git commit -m "commit msg" --->git remote -v ----> copy github repository --> git push git remote add repository name ---->

Contributing to an existing project ----> git clone or git pull ----> default branch is main ---> create branch ---> push the branch (git push --set-upstream origin )-----> create a pull request ---select review & approved ---merge

Main , Dev , Staging ----> branch off

9:25 PM EST

GITHUB

Github is a web based or web application platform version control and collaboration that is built around git .Git is the most popular version control system .

Github is a Version Control with git: GitHub hosts repositories (folders containing code, documents, and history) where every change is tracked. This allows you to see who changed what, when, and why, and revert to earlier versions if needed.

Collaboration – Multiple people can work on the same project at the same time, using features like branches, pull requests, and code reviews to manage and merge changes safely.

Cloud Hosting for Git Repositories – Instead of storing your Git repositories only on your computer, GitHub stores them online so you can access them from anywhere.

Integration & Automation – GitHub connects with CI/CD tools, project boards, and security scanners, letting you automate builds, tests, deployments, and even security checks.

In github we are going to create repositories

What is a Github Repository ?  : A repository (often called a repo) in GitHub is basically a storage space where your project lives. It contains all the files, folders (directories), and the complete history of changes for your project. It’s managed by Git, and GitHub provides an online interface to view, collaborate, and manage it.

What are the different types of github repositories 

GitHub repositories are mainly categorized by visibility and purpose:

Public Repository :
Visible to everyone on the internet
U might one to use a Public Repository for Opensource projects or sharing code publicly
Accessing public repositories , anyone on the internet can view , clone the code , but only users with write access can make changes
Private Repositories :
Visible only to you and the collaborators you choose (teams or organisation members).
Purpose: Used for private projects, sensitive code, or company-owned software .
Accessing private repositories : Only invited collaborators can view or contribute to the projects
Internal Repository (For Github Enterprize Only )
Visible only to members of the same organization.
Purpose : Used for organization-wide projects that should not be public but can be accessed by all members in the organization
Accesing internal repository : All org members can see it, but only those with permissions can contribute.
use case : A shared codebase for internal tools in a large company.
GitHub Repository Size Limits

Individual File Size
Limit: 100 MB per file (hard limit).
If you try to push a file larger than 100 MB, GitHub will reject it.
For files over 50 MB, you’ll get a warning when pushing, but it will still upload (until it hits 100 MB).
Total Repository Size Limit ?
Soft limit: Around 1 GB recommended for optimal performance.
GitHub doesn’t block you at exactly 1 GB, but large repos can become slow to clone or work with.
Hard practical limit: Around 5 GB — beyond that, GitHub may flag the repo and ask you to reduce the size.
GitHub Storage for Large Files (LFS)
If you need to store large binary files (like videos, datasets, images), use Git LFS (Large File Storage).
Free tier: 1 GB storage and 1 GB/month bandwidth included.
You can purchase more storage/bandwidth if needed.
GitHub Packages & Artifacts
If you store container images or build artifacts in GitHub Packages, the storage limit depends on your plan.
Free plan: 500 MB storage & 1 GB/month data transfer.
Paid tiers offer more.
What is a Github Organisation What are teams in github other features of github

A Readme.md is a very important file in your github projects.It serves for different purposes .Its a source of truth for anyone who is new to the project and needs more information.

Primary Use of a Readme.md

Project introduction :

It gives or provides a summary of what a project is , its purpose , and its primary features it explains why the project was created and what problem it solves Installation Instructions : :

It list dependencies or tools required before installing the project it gives you Installations Steps and how to execute the project on your computer Use Guide

readme files can give you instructions on how to use the project after installation e.g with example Contribution Guidelines :

Contribution Rules like how to contribute to the project , including how your code standards , branching strateg and commit messages Project Structure:

For example it can contain information on how directory and files are structured Also how the code is organised Contact information:

it can have contact details like emails for code maintainers or authors including their contact details ############################################### June 18 2024 ################################################

Github Organisation

Organizations on GitHub are shared accounts that allow multiple users to collaborate on many projects. They are ideal for open-source projects, companies, and any groups needing collective management of repositories. Each organization can have multiple repositories and be managed by multiple administrators.

Key Features of Github Organisation

Teams & Permissions : Organisations can allow you to create teams with different access permissions , making it easier to manage who can view or edit a repositories Teams within your organisation can be structured in a hierachy order , which allows granular or fine grained access control and roles. e.g developers can have read access while devops team can have write access. Organisations helps with Repository Management: An organisation can own unlimited public and private repositories An organisation provides a central location to manage policies ,including merging , branching and more policies Security and compliance : Github organisations probide advanced security features like two factor authentication Helps in Third Party Access controls: Allows admins to manage third party application access ,ensuring only trusted applications can access your data Best Practices for Using GitHub Organizations

Use Teams for Role-Based Access Control (RBAC): Define teams based on roles and responsibilities within your projects to manage permissions effectively.

Regularly Audit Access and Permissions:

Periodically review who has access to your organization and their permissions to ensure that they are still relevant and secure.

Enable Security Features:

Use GitHub’s security features to protect your code and infrastructure from potential vulnerabilities.

Use Webhooks and Integrations Wisely:

Connect your development workflows with other tools and services using webhooks and third-party integrations, but make sure to manage and monitor these connections carefully.

GitHub Teams

Within an organization, Teams are groups of members with specific permissions and roles. Teams can help manage access to repositories and facilitate communication and collaboration among members.

**Key Features of Github Teams or Importance of Teams in Github Account

Role-Based Access Control (RBAC): Teams within your github organisations allows you to assign specific repository access permissions to groups users .This is helps in managing what each team member can do or cannot do within your organisation repositories .

Permissions can be set at different levels as Read , Write , Maintain , and admin or Triage

Nested Teams: Teams can have mutiple sub-teams , making it easier to reflect your companys prohects structure within your github organisation Team Discussions; Team discussions are possible because each team has its own page within ur github organisation,where u can see your team members , repositories and any ongoing discussions.. Mentioning Teams: Teams can be mentioned in discussions , pull request , and issues using the @teamname format.This helps to simplify communication within and across your teams .

