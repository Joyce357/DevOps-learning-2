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

`git checkout <new-branch-name>` This command will switch from one branch to another 

`git checkout -b <branch-name>`: This creates a new branch and automatically switch to the new branch 







mkdir <directory-name> e.g mkdir Class10-Git-Project
cd <directory-name> : This will change directory moves you into a directory or folder
ls : List 
clear : means making your workspace clean 
cat : allows you to read the content of a file 

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

11. `git push --set-upstream origin update-notes` 

This command is used to push the committed changes from your local repository to a remote (github) repository. The --set-upstream option is used to set the upstream branch for the current branch, which allows you to use git push without specifying the remote and branch name in future pushes. In this example, origin is the name of the remote repository, and update-notes is the name of the branch you want to push to.


