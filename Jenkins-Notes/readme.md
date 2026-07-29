**What is Jenkins** 

Jenkins is an Open-Source `automation server` used for `continous integration and continous delivery (CI/CD)` in software development 
Jenkins plays a role in different parts of the software development lifecyle in relation , building , testing , deploying applications and facilitating continous intergration and continous delivery (CI/CD).

+ Build Our code 
+ Test Code 
+ Deploy our code (application)


**What is Continous Integration and Continous Delivery (CI/CD)**

1.  **Continous Integration (CI)** : This is a practise in software development where developers writing the application code frequently integrates their code changes into a shared repository , usually multiple times a day .Each integration is `automatically build or verified by building or running automation test to detect integration issues early and tools use for this can be` ; Jenkins , Circle CI , Github Action etc.

+ This approach aims to improve the software quality & reduces the time taken to deliver software by finding and address bugs , issues early in the development process . 


2. **Continous Deployment or Delivery (CD)** : This is a practise in software development that is an extension to continous intergations to ensure that the code changes are automatically prepared for a release in production without manual intervention . This process aims to make delivery or release ,deployments  reliable and faster by automating the process, so new code could be deployed in different environments like production with minimal manual intervention 


+ Automated deployment 
+ Frequent releases (new features ,patches)
+ Environmental consistency ( stage , dev and prod )




**What are  the benefits of CI/CD** 

+ It improves code quality . issues or bugs are detected in the early stage of the sdlc
+ It has lead to Faster Delivery or releases of new features or patches 
+ It has reduces the risk because it limits human intervention which avoids human errors
+ Its Easy (faster) to rollback when you setup automated rollbacks .
+ Cost efficient : Early bug detection will reduce downtime and lower operational costs.Automating repetitive tasks saves time and reduces the need for manual intervention.



TEST YOU CAN RUN

+ Unit testing 
+ Integration testing 
+ Functional Test 
+ Perfomance test 
+ Load test 
+ Security Test 
+ Penetration test 
+ UAT -user acceptance test 
+ Regression Testing 
+ Smoke Testing 
+ Sanity Test 


+ Static Code Analysis (sonarqube)
+ OWASP (Open Web Application Security Project)



`CI`  = Developers regularly push their code to a shared repository, and that code is automatically tested and built.In our Case Jenkins automatically:Pull the code , Builds it and Runs a test which helps to find issues very early in the development process

`Continous Integration` 

`CD ` 

`Continous Deployment` =  Code is automitcally deployed without any human approval 
Code → Build → Test → Deploy → Production

`Continous Delivery` = Code is automitcally deployed to staging or pre-production environment but requires human approval to deploy to production
Code → Build → Test → READY FOR DEPLOY → `(Manual approval)` 



**Jenkins Evolutions** 

Hudson ( 2004 - 2011)
+ Jenkins started as a project named `Hudson`, created by Kohsuke Kawaguchi while working at `Sun Microsystems` in 2004
+ As time went by, Hudson gained alot of popularity due to its simplicity , flexibility and extensibility using plugins

The Hudson project was forked and rename to Jenkins : 

in late 2010 they became a conflict between the `hudson open-source community` and Oracle (which had acquired the sun microsystem)
oracle wanted to take control and direction of the project .

The `open-source community` went to Forked the project ,2011 rename to JENKINS . This was aimed to ensure that the project is independent and maintaining the open-source goal .



`Benefits of Jenkins ( Reference Benefits of CI/CD )`

+ Automated builds
+ Automated Testing 
+ Version control integration 
+ improves code quality 
+ Faster deployments and releases
+ Increases collaboration 


**How to Manage Jenkins** 

+ Using UI (User Interface)
+ Code 




**Jenkins Home Directory**

This is where jenkins stores all its configurations, job files , plugins and other data
The jenkins home directory is : `/var/lib/jenkins`  
 

**some of the files or directory you can find in Jenkins home directory are :** 

**directories inside the Jenkins Home directory**

`job/` : This directory contains sub directories for each jenkins job . in this sub directories they include configurations and build history of the jobs . 
`plugins/`: This directory stores plugins you have installed that extend the functionality of jenkins 
`secrets/` : This directory contains sensitive data such as credentials e.g admin credentials for setting up jenkins etc. 
`users/` : `This directory stores information about your Jenkins users (when you install jenkins it comes with a jenkins user)
`nodes/` : This directory contains configurations for your slave nodes or agents (you will see this when you setup a jenkins master slave architecture)
`workspace/` This is where jenkins will checkout the source code from github or bitbucket and this is where it performs builds . This directory will be present when you run your first build. you wont see this directory by default . 
`updates/`: This contain information or data related jenkins updates 
`usercontent/` : This is a directory you can place files that should be served by jenkins such as documentations or other resources for users . 


**Files inside the Jenkins Home directory**


| **File**                                               | **Description**                                                                                                                                            |
|--------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `config.xml`                                           | Contains the main configuration of Jenkins.                                                                                                                |
| `hudson.model.UpdateCenter.xml`                        | Contains information about available updates for Jenkins and its plugins.                                                                                   |
| `nodeMonitors.xml`                                     | Stores configuration and status information about node monitors, which track the status of various aspects of Jenkins nodes (e.g., disk space, response time). |
| `hudson.plugins.emailext.ExtendedEmailPublisher.xml`   | Configuration file for the Email Extension Plugin, which allows for more customizable email notifications.                                                  |
| `hudson.plugins.git.GitTool.xml`                       | Stores configuration for Git tools used by Jenkins.                                                                                                        |
| `secret.key` & `secret.key.not-so-secret`              | Keys used for encrypting Jenkins secrets.                                                                                                                  |
| `identity.key.enc`                                     | Encrypted identity key used by Jenkins.                                                                                                                    |
| `jenkins.install.InstallUtil.lastExecVersion`          | Tracks the last executed version of Jenkins during the installation process.                                                                                |
| `jenkins.install.UpgradeWizard.state`                  | Tracks the state of the Jenkins upgrade wizard.                                                                                                            |
| `jenkins.model.JenkinsLocationConfiguration.xml`       | Contains the configuration for Jenkins location settings, including URLs.                                                                                  |
| `jenkins.telemetry.Correlator.xml`                     | Used for Jenkins telemetry, collecting usage statistics to improve Jenkins.                             






`JENKINS ARCHITECTURE` 


## Jenkins Master` : 
The Jenkins master is the central control unit in a Jenkins installation. It is responsible for managing

+ Job scheduling 
+ Dispatch build to the nodes ( servers)
+ Monitors the nodes
+ It manages user request 
+ Configiuration of jenkins 

This is what provides UI (User interface) to create and configure jobs
`Jobs` : we refer to any project you create on jenkins


## Jenkins Nodes (Agents / Slaves)`:

Nodes are also known as (agents or slaves):These are machines that are configured to build projects for the master .These nodes or slaves build jobs that are disptached by the master 

## Jobs ( Projects)`: 

Jobs are projects that are the fundamental unit of works in jenkins. A jobs can represent various tasks e,g like building code , running test , deploying application  and a Job can be doing all 3 of them or broken down into parts 

Its simply any automation or task you create on jenkins 

**Types of Jobs or Projects you can create on Jenkins** 

+ `Freestyle projects` : These are simple job type configurations , it is beginner friendly 
+ `Pipeline Project` : These are jobs that are define with a jenskinfile and has multiple stages or steps its good for complex work flows (Most Important)
+ `Multi Branch Pipeline` : This type of pipeline automatically creates pipelines for each git branch .It detects Jenkinsfile in branches
+ `Multi Configuration Project` 
+ `Folder` 
+ `Organisational Holder`




**HOW TO INSTALL JENKINS** 

`How to install Jenkins on Linux` 

Reference :  https://www.jenkins.io/doc/book/installing/linux/

+ To install jenkins on Linux your server needs to meet the following requirements:

**Minimum hardware requirements:*

+ 256 MB of RAM
+ 1 GB of drive space (although 10 GB is a recommended minimum if running Jenkins as a Docker container)

+ Recommended hardware configuration for a small team:
4 GB+ of RAM
50 GB+ of drive space

**Note:** when you install jenkins it comes with a new user called the jenkins user. 

##############################
**Step 1**   
##############################

+ You need to install OpenJDK ( java development kit) by running the command 

latest version run the following command  `sudo apt install default-jre`

verify the installation by running `java --version`

`recommended to install the Long Term Support Release (LTR) for Jenkins` 

**STEP 2**

Run the following command :

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null'

`sudo apt-get update`
`sudo apt-get install jenkins`

Verify if jenkins is running by running the command  `sudo systemctl status jenkins` 

#Trouble shooting steps : if jenkins is not active try to check if you have installed a campactable java version if not install the latest java version by running the command `sudo apt install default-jre`

**Step 3**
+ Access jenkins on the url (browser) . Jenkins listen on port `8080` .so open port 8080 on your EC2 Instance security group inbound rules. 
+ use the public ip and port 8080 to access jenkins on the url : e.g 173.394.049:8080
  jenkins.team4techsolutions.com -----> load balancer ---> jenkins server

**Step 4**
+ install jenkins plugins , select the `install suggested plugins`


####################################
**HOW TO INSTALL JENKINS ON MAC**
####################################

To install the LTS ( Long term support) on MAC run the following commands 

Install the latest LTS version: `brew install jenkins-lts`
Start the Jenkins service: `brew services start jenkins-lts`
Restart the Jenkins service: `brew services restart jenkins-lts`
Update the Jenkins version: `brew upgrade jenkins-lts`

To access jenkins using your local machine or computer .open a browser and type `localhost:8080` 
and follow the steps to setup jenkins just like the linux setup 


**HOW TO INSTALL JENKINS ON WINDOWS**

Check the steps on the following link :  https://www.jenkins.io/doc/book/installing/windows/
and you can watch the youtube video on the documentation link 


Jenkins username : class6 


Error :  Target is in an Availability Zone that is not enabled for the load balancer

`occurs when the target (e.g., an EC2 instance or resource) is located in an availability zone (AZ) that the load balancer is not configured to use`








**FEATURES ON THE JENKINS UI**



# Managed Jenkins 

: This is where you will see all your jenkins configurations on the Jenkins UI . The configurations are classified into the following: 

**Managed Jenkins has 5 Important Configuration Sub Features**

+ `System Configuration` (system , tools , plugins, Nodes , Clouds,Appearances)
+ `Security` (Security,credentials, Credential providers , Users)
+ `Status Information` (System information , System log , Load Statistics ,About jenkins)
+ `Troubleshooting` (Manage Old Data)
+ `Tools and Actions` (Reload Configuration from disk , Jenkins CLI ,Script Console , Prepare for shutdown )


1. ## Manage Jenkins we have " `System configurations`"  and under systems configuration we have `systems` you will see the following configurations 

Under Managed Jenkins you will see SYSTEM CONFIGURATION you will see SYSTEMS under systems you will see the following

+ `home directory of Jenkins` ( /var/lib/jenkins)** 
+ `system message` : this is where you can setup system wide displayed messages on your jenkins server where other users can see 

+ `Computer Retention Check Interval` : Configure the check interval (in seconds) of computer retention strategies. Retention strategies are configured in the individual agent configuration under "Availability". Administrators can trade elevated CPU usage from frequent agent checks for responsiveness to capacity needs.
For example, if you run your build agents on short-lived VMs that boot fast, you may want to scale up new capacity as soon as builds queue up and scale VMs down as soon as no more work is available to cut delays for users and costs of keeping idle VMs alive. Be sure to adjust the delays in the respective retention strategies accordingly as well.

+ `Quiet Period`: This is the time Jenkins waits before it starts a build . The time is set in seconds .
`use case`: This setting can be useful in situations where multiple commits are made in quick succession. By setting a quiet period, Jenkins can wait a specified number of seconds before starting a build, allowing all changes to be consolidated into a single build


+ `SCM checkout retry count` : SCM stands for Source Code Management. This setting defines the number of retry attempts Jenkins will make if the checkout process fails.

Use: It ensures robustness in the face of transient SCM failures by retrying the checkout process a specified number of times before giving up.

+  `Jenkins URL` ; This is the url where you can access jenkins . Make sure this url matches the actual URL you are using to access jenkins.If the url is different it will cause a reverse proxy issue and cause your jenkins server to be slow . 


+ `System Admin e-mail address`: This is the email address of the system administrator i.e the person that manages the jenkins server. 


+ `Resource Root URL`: 

Jenkins serves many files that are potentially created by untrusted users, such as files in project workspaces or archived artifacts. When no resource root URL is defined, Jenkins will serve these files with the HTTP header Content-Security-Policy ("CSP"). By default it is set to a value that disables many modern web features to prevent cross-site scripting (XSS) and other attacks on Jenkins users accessing these files. While the specific value for the CSP header is user configurable (and can even be disabled), doing so is a trade-off between security and functionality.

If the resource root URL is defined, Jenkins will instead redirect requests for user-created resource files to URLs starting with the URL configured here. These URLs will not set the CSP header, allowing JavaScript and similar features to work. For this option to work as expected, the following constraints and considerations apply:

Without a resource root URL, resources will be served from the Jenkins URL with Content-Security-Policy set.


+ `Global properties` ; These are properties that are applied across all jenkins jobs and nodes within the Jenkins environment :These properties includes Disk Space Monitoring Threshold,Disable deferred wipeout on this node,Environment variables,Tool Locations ,credentials  

+ *disable deferred wipeout on this node* 

 : Disabling deferred wipeout on a Jenkins node involves configuring the node's settings to ensure that workspace cleanup happens immediately rather than being deferred. Deferred wipeout is a strategy used by Jenkins to delay the deletion of workspaces to improve performance, but in some cases, you might want to disable this behavior to free up space more quickly.

+ **Disk Space Monitoring Thresholds* : disk space monitoring thresholds can be set to ensure that your nodes do not run out of disk space, which can cause builds to fail and other operational issues. By setting these thresholds, Jenkins can automatically take actions such as disabling builds on nodes that are running low on disk space

+ **Environment variables* : Variables will help in controlling the behavior of your builds. These variables can be set globally, at the node level, or within individual jobs

+ **Tool Locations* : Setting up tool locations allows Jenkins to know where these tools are installed on your nodes, which is crucial for build and deployment processes.This ensures that your jobs can locate and use the necessary tools. you can set tools like git , maven ,jdk , ant . 

+ `Pipeline Speed / Durability*`: These feature gives you the opportunity to choose how fast and durable you want your jenkins build to run 

This setting allows users to change the default durability mode for running Pipelines. In most cases this is a trade-off between performance and the ability for running pipelines to resume after unplanned Jenkins outages.

What does this do?

Previously, running pipelines wrote data constantly, so that they could resume even if Jenkins fails. This setting gives the user the ability to adjust this write behavior.
Higher-performance/lower-durability modes write data to disk much less often for running pipelines.
Writing data less often can massively reduce build times for Pipelines with many steps or complex logic. For pipelines which spend most of their time waiting for a shell/batch script to run, the difference will be less visible.
Running pipelines with lower durability settings may lose data if they do not finish and Jenkins is not shut down gracefully:
A "graceful" shutdown where Jenkins goes through a full shutdown process, such as visiting http://[jenkins-server]/exit
A "dirty" shutdown, such as using kill -9 to terminate the Jenkins process, may prevent incomplete pipelines from persisting data
Pipelines that cannot persist data may not be able to resume or displayed in Blue Ocean/Stage View/etc.
Pipelines will generally write log data regardless of durability settings.
Some modes use an "atomic write" option - this helps ensure that pipeline build files aren't overwritten or left partially written if something fails.
Atomic writes may place more stress on filesystems, so especially with networked storage it may be faster not to use them.
Note: this only sets a global default. Individual Pipelines and MultiBranch projects may override the global default.

+ **Usage Statistics** : This sends information to the open source community on issues with jenkins Usage statistics in Jenkins help administrators and users understand how the Jenkins instance is being utilized. These statistics can include job execution times, node usage, plugin usage, and build success/failure rates. By monitoring these metrics, you can identify performance bottlenecks (issues), optimize resource allocation, and improve the overall efficiency of your CI/CD pipelines.

+ **Metrics** (access keys)

+ **HTTP Proxy Configuration** : 
+ **Global Build Time Out** 
+ **Develocity Build Scans**
+ **Develocity integration**
+ **Timestamper** : 
+ **Fingerprints** : 
+ **Administrative monitors configuration**: 
+ **Global Build Discarders** : 
+ **Default notification URL** 
+ **GitHub** 
+ **GitHub API usage** 
+ **GitHub Enterprise Servers** ;
+ **Global Trusted Pipeline Libraries** : 
+ **Global Untrusted Pipeline Libraries**
+ **Build-timeout Plugin > BuildStep Action** 
+ **Git plugin** 
+ **Shell** : 
+ **Extended E-mail Notification** :
+ **E-mail Notification** : 



| Configuration                            | Meaning                                                                                                                                                  |
|------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| **HTTP Proxy Configuration**             | Settings for configuring an HTTP proxy that Jenkins will use for outbound connections.                                                                    |
| **Global Build Time Out**                | Configuration for setting a global timeout for builds to prevent them from running indefinitely.                                                          |
| **Develocity Build Scans**               | Configuration for integrating Develocity build scans to analyze build performance and failures.                                                           |
| **Develocity integration**               | Settings for integrating Develocity services to enhance build analysis and insights.                                                                      |
| **Timestamper**                          | Plugin configuration to add timestamps to the console output of builds, which helps in tracking the duration of each build step.                         |
| **Fingerprints**                         | Configuration for tracking and recording file fingerprints to identify and trace files used and produced by builds across jobs.                           |
| **Administrative monitors configuration**| Settings for configuring administrative monitors to oversee various aspects of Jenkins health and performance.                                            |
| **Global Build Discarders**              | Configuration for setting global rules to automatically discard old builds to save disk space and maintain system performance.                           |
| **Default notification URL**             | Setting for specifying a default URL to which build notifications will be sent.                                                                           |
| **GitHub**                               | Configuration for integrating GitHub repositories with Jenkins, including repository URLs and credentials.                                                |
| **GitHub API usage**                     | Settings for configuring the usage of the GitHub API within Jenkins for various operations like status checks and repository management.                  |
| **GitHub Enterprise Servers**            | Configuration for integrating GitHub Enterprise servers, allowing Jenkins to connect to and interact with self-hosted GitHub instances.                   |
| **Global Trusted Pipeline Libraries**    | Configuration for defining global pipeline libraries that are trusted and can be used across all Jenkins pipelines without additional approval.           |
| **Global Untrusted Pipeline Libraries**  | Configuration for defining global pipeline libraries that are not trusted and require approval before being used in Jenkins pipelines.                    |
| **Build-timeout Plugin > BuildStep Action** | Configuration for the Build-timeout plugin to define actions to take when a build exceeds the specified timeout, such as aborting the build.              |
| **Git plugin**                           | Configuration settings for the Git plugin, which provides support for using Git repositories in Jenkins jobs.                                             |
| **Shell**                                | Settings for configuring shell script execution in Jenkins jobs, including the shell executable path and default options.                                |
| **Extended E-mail Notification**         | Configuration for the Extended E-mail Notification plugin, which provides advanced email notification options for build results.                         |
| **E-mail Notification**                  | Basic configuration for sending email notifications about build results to specified recipients.        




`Note` : When you download some plugins they might add their own global configurations under `systems` 



+ **you can also set the number of executors** : (An executor are computational threads that jenkins uses to run build jobs . The purpose for an executor is to helps your jenkins server to be able to run multiple jenkins builds at the same time e,g if you set an executor as 2 , this means your jenkins server can run two builds at the same time) when you install jenkins the default executor is 2 
+ **labels (also known as node label or tags)** : These are tags assigned to Jenkins nodes be it master node or slave nodes. Labels provide a way to control where jobs are executed , this helps when you want to run a job on a particular server and this can be because the server has alot more resources or meets different requirements
+ **Usage** : This settings helps you to define which nodes jenkins is going to use to run its jobs : You can set it as `use this node as much as possible`: This means jenkins will be running all its jobs on the nodes . if you select `only builds jobs with the label expression matching this node` This means jenkins will only build any job on the node if you use the label in your jenkins job . 