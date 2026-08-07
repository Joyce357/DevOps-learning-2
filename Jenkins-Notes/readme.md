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



2. ## Under (Manage Jenkins)  and under System Configurations  we have   

`TOOLS` : 

This is where you configure how to install different tools (software) in your Jenkins server and intergrate them to your 
Jenkins jobs. tools are useful components that provide the necessary software environments and dependencies required to run builds and jobs. Configuring tools in Jenkins ensures that the correct versions of software packages are available to the build processes.

+ You can set Maven Configuration ( This is a build server) for Java Applications
+ You can also set Java 
+ You can also set Github installation 
+ Gradle installations
+ Ant installations
+ Maven installations



3. ## Under Manage Jenkins and Under System configurations we have `PLUGINS`: 

Plugins helps to extend the functionality of our jenkins jobs or server. 
+ On your Jenkins Plugins Dashoboard you can `update , install , see available plugins ,remove and set advanced settings` 
+ `updates` shows you the plugins on your jenkins server that needs updates  
+ `available plugins` : This shows you the plugins that are available for you to install which you have not already installed. if you have installed a plugin already you wont see in the available plugins instead you will see it in the installed plugins 
+ `installed plugins` : shows you the plugins you have installed 
+ `advance settings` : This is where you can upload your own custom plugin or a download plugin you have from the internet which is outside of Jenkins : for example you can see plugins to download on this url : https://updates.jenkins-ci.org/download/plugins/  


4. ## In the Manage Jenkins  we have Systems and under Systems we have `Nodes`: 
+ The nodes helps you to configure your jenkins built in node (master) and also the slave (agents) .
+ you can also add more agents /nodes /slave in the node dashboard
+ you can also remove a node by taking offline . you can mark a node as temporarily offline . this can be because you want to do some updates or maintenance .Once a node is offline no jobs are dispatched to the node (agent)





## Under Manage Jenkins --> System configuration we have 

`CLOUD`: 

This allows jenkins to interact with cloud providers for provisioning and managimng build environments .This helps in Scalability because Jenkins can add resources dynamically based on demand . You can allow jenkins to interact with cloud providers to add resources if needed by jenkins for example ; 

+ These are done through Plugins 



`Jenkins Cloud Configurations in Jenkins`

1. **Amazon EC2**

Meaning and Purpose: Allows Jenkins to dynamically provision Amazon EC2 instances as build agents.
Use Case: Automatically scale Jenkins build capacity by launching and terminating EC2 instances based on build load.
Kubernetes

2. **Kubernetes**

Meaning and Purpose: Integrates Jenkins with a Kubernetes cluster to run jobs in Kubernetes pods.
Use Case: Leverage Kubernetes for dynamic and scalable build environments, ideal for microservices and containerized applications.

3. **Google Kubernetes Engine (GKE)**

Meaning and Purpose: Similar to Kubernetes, but specifically integrates with Google Kubernetes Engine.
Use Case: Utilize GKE for running Jenkins jobs in a managed Kubernetes environment provided by Google Cloud Platform.

4. **Azure VM Agents**

Meaning and Purpose: Integrates Jenkins with Microsoft Azure to provision virtual machines as build agents.
Use Case: Scale Jenkins build infrastructure by adding Azure VMs dynamically based on the current build workload.

5. **OpenStack Cloud**

Meaning and Purpose: Integrates Jenkins with an OpenStack cloud for provisioning VMs as build agents.
Use Case: Use OpenStack to dynamically allocate and deallocate VMs for Jenkins jobs, providing a scalable build environment.

6. **VMware vSphere Cloud**

Meaning and Purpose: Allows Jenkins to use VMware vSphere to provision and manage virtual machines as build agents.
Use Case: Utilize vSphere infrastructure for scaling Jenkins build capacity with virtual machines.

7. **DigitalOcean**

Meaning and Purpose: Integrates Jenkins with DigitalOcean to provision droplets as build agents.
Use Case: Use DigitalOcean droplets to dynamically scale Jenkins build environments.

8. **Docker Cloud**

Meaning and Purpose: Integrates Jenkins with Docker Cloud to use Docker containers as build agents.
Use Case: Leverage Docker containers for isolated and reproducible build environments, scalable on demand.

9. **Mesos Cloud**

Meaning and Purpose: Integrates Jenkins with Apache Mesos to dynamically provision build agents.
Use Case: Use Mesos for orchestrating resources across multiple clusters, providing scalable build environments for Jenkins.




## Under Manage Jenkins / System Configuration --->  we have `Apperance`: 

This is how you can set up your jenkins Dasboard to look 




**HANDS TO SETUP JENKINS MASTER SLAVE ARCHITECTURE (ADDING AGENT NODES TO JENKINS)**


`Jenkins Master Slave Architecture`

Jenkins uses a master-slave (or controller-agent) architecture to enable scalable, distributed builds and optimize resource utilization. This design divides the responsibilities of coordinating builds and executing tasks between the Jenkins Master (Controller) and one or more Jenkins Slaves (Agents).

`Benefits `

+ `Scalability`  :   In a large development environment, a single Jenkins server (master) may become a bottleneck if it tries to handle all builds, tests, and deployments simultaneously.

+ `Resource Management` : The slave or agent . Executes builds, allowing for specialized hardware or configurations (e.g., high-memory slaves for large builds, GPU-enabled slaves for machine learning tasks).This ensures efficient use of system resources and it prevents the master from becoming overburdened.

+ `This brings Flexibility` : Different slaves can be configured for specific tasks. A slave for Windows builds, another for Linux builds and even another for MacOs builds . Specialized environments for different programming languages or toolchains.Separate slaves for production-like environments to run integration or end-to-end tests.

+ `Fault Tolerance`: if a slave fails, the master can reassign tasks to other available slaves without impacting the system's overall operation. Isolating the master from resource-heavy builds ensures high availability and stability for managing jobs.






       ***SECURITY**


  # Manage Jenkins ---> SECURITY 
  This where you will manage the security on your jenkins server . Under security we have the following categories or features

  `Security`

  + Under security we have authentication and Authorization , Here you can set how jenkins is going to authenticate users and Authorized users to manage  jenkins 
  + Also you can set jenkins to disable the `keep me signed in` option to avoid instances where a user is going click and save their password for easy logins .
  + You can allow users to signup and have access to your jenkins server ( Note : this is not a good security practise)
  + You can choose which database to use when it comes to Jenkins Authenticating users . you can set this under `Security Realm` .You can choose to use 
  `Jenkins Database ` ,`dedicatet serverlet container`  `Ldap` , `unix-user/groups database` or `none` . This will help you to manage users and their passwords for authentication 

+ `Authorization` : When you setup a user and password for authentication with your jenkins server , you can also set up authorization.You can set permissions on what a user can do , see on your jenkins jobs or server . There are different Authorization Types 

_ **anyone can do anything* : avoid using this as its not secured as anyone can perform any action  
- **Login users can do anything* : This allows any authenticated user to perform any action .This perform basic level of security by allowing only authenticated users to perform actions on your jenkins jobs 
- **Legacy mode* : This is meant for older jenkins version with compactability issues
- **Matrix Based Security* : It provides fine grained control over permissions . Admins can assigned different permissions to different users or groups for the various parts of your jenkins .eg you can assign only read access or configure access 
**Use case** good for teams that require different level of access/
- **Project based matrix authorization strategy* : This is an extension of matrix based security but with the ability to specify permissions on a each project base or jobs . 


`Markup Formatter`

Markup Formatter determines how text in build descriptions, job descriptions, and other rich-text fields is processed and displayed. By default, Jenkins uses a plain text formatter, but you can configure it to use other formats such as HTML or Groovy.

+ Jenkins uses the `Plain Text` by default it treats all inputs as plain text .it does not support any formatting or html 
+ you can also use the `safe html` Allows a subset of HTML to be used in descriptions and other text fields. It strips out potentially dangerous HTML tags to prevent cross-site scripting (XSS) attacks

`CSRF Protection` : The full meaning of CSRF is `cross-site request Forgery` this is a feature in jenkins to prevent unauthorized commands being transmitted from users that jenkins trust. CSRF can trick users into executing unwanted actions on web applications in which they are currently authenticated.
+ Jenkins provides an in build protection by default to avoud this  


`How CSRF Protection Works`

*CSRF Token*: Jenkins generates a unique token for each user session. This token must be included in any request that changes the state on the server (e.g., creating jobs, running builds).

*Validation*: Jenkins validates the token for each incoming request that modifies data. If the token is missing or incorrect, Jenkins rejects the request.

`Git plugin notifyCommit access tokens`

This is a feature that gives added security when a build is being trigerred by your git repository.`notifyCommit` endpoint is used to trigger builds when changes are detected in a Git repository. For security reasons, especially when dealing with public repositories or repositories that allow anonymous access, you should secure this endpoint using access tokens.

`Git Hooks` : Git hooks are custom scripts that run automatically when certain events occur in a Git repository. They allow you to enforce policies, automate tasks, and integrate with other tools such as CI/CD pipelines.


`Api Tokens` 
In Jenkins, API tokens are used to authenticate and authorize API requests, allowing users and systems to interact with Jenkins in a secure manner without using passwords.

`Git Host Key Verification Configuration` This configuration helps to prevent man in the middle attack .This helps to identify the identity of the remote host .

What is a Man in a middle attack ? A Man-in-the-Middle (MitM) attack is a security breach where an attacker secretly intercepts and potentially alters the communication between two parties who believe they are directly communicating with each other. This type of attack can occur in various forms and can target different types of communication, such as internet connections, email exchanges, or any other type of data transmission




Sonarqube ---check coding bad practices 


Master Node -----> create ssh ( public and private key ) -----> public key -------> added to agent (authorized_keys)
Jenkins UI ---> We added the master node .ssh private key as username and password ---->> it uses to authenticate with the public key in the agent node 


Under `security`  we have credentials 

` credentials` : 

This is where you store sensitive information such as passwords , api keys  etc which you intend to securely  use them in your jenkins jobs or pipelines for authentication with other tools or software which your jenkins job or pipelines needs to interact with.

+ You can also modify or change existing secrets ,passwords or api keys . 

There are different kind of credentials types you can setup and they are : 

+ Username and password 
+ Github App Credentials
+ ssh username with private keys
+ secret file
+ secret text 
+ Certificate

Note : you can also install more plugins from the system plugins and jenkins will add the credentials kinds if required 
e.g AWS Credential 

`Credential Providers`

These is a feature that helps you to set which credential provider you want jenkins to use to access secrets or passwords or api keys to interact with other services . 

`USERS` :

This is where you can manage users that is create , remove  users from your jenkins server and many more.




####################
# Status Information
######################

Under status information we have the following : 

`System information` : Here you will find information about your jenkins server .you can find information about ( system properties` ,  `Environmental variables` , `plugins`, `Memory` ,`Thread dumps`) and these can help in troubleshooting 

`System log` : This are the logs or events that are stored from your jenkins server . 
+ you can set a log recorder to be able to capture specific logs 

`Load Statistics` 

This simply shows you how your jenkin server is performing in regards to the load or jobs that are running .it gives you an insight or help you to monitor your nodes(agents) for resource utilization . 
Load statistics keep track of four key metrics of resource utilization:

`Number of online executors`:

For a computer: if the computer is online then this is the number of executors that the computer has; if the computer is offline then this is zero.
For a label: this is the sum of all executors across all online computers in this label.
For the entire Jenkins: this is the sum of all executors across all online computers in this Jenkins installation.
Other than configuration changes, this value can also change when agents go offline.

`Number of busy executors`

This line tracks the number of executors (among the executors counted above) that are carrying out builds. The ratio of this to the number of online executors gives you the resource utilization. If all your executors are busy for a prolonged period of time, consider adding more computers to your Jenkins cluster.

`Number of available executors`

This line tracks the number of executors (among the online executors counted above) that are available to carry out builds. The ratio of this to the total number of executors gives you the resource availability. If none of your executors are available for a prolonged period of time, consider adding more computers to your Jenkins cluster.

`Queue length`
This is the number of jobs that are in the build queue, waiting for an available executor (of this computer, of this label, or in this Jenkins, respectively). This doesn't include jobs that are in the quiet period, nor does it include jobs that are in the queue because earlier builds are still in progress. If this line ever goes above 0, that means your Jenkins will run more builds by adding more computers.

**Note**: The number of busy executors and the number of available executors need not necessarily be equal to the number of online executors as executors can be suspended from accepting builds and thus be neither busy nor available.


`About Jenkins `

This is shows you the version and license of jenkins server and other informations about your jenkins server 


########################################################
# Managed Jenkins--> Troubleshooting---> Managed Old data 
#######################################################

`Managing old data`:  in Jenkins is essential to maintain optimal performance, save storage space, and ensure that your Jenkins instance runs efficiently. Jenkins jobs, builds, and artifacts can accumulate over time, leading to increased disk usage and potentially degraded performance. Here's how to manage old data in Jenkins effectively:



######################################
# Managed Jenkins -> Tools and Actions
####################################


Under Tools and Actions we have the following 

+ `Reload configuration from disk `

+ `Jenkins CLI` : The Jenkins CLI allows you to interact with your Jenkins instance from the command line. It provides a wide range of commands to manage jobs, nodes, plugins, and more.

+ `script console` :  The Jenkins Script Console allows you to run Groovy scripts to interact with Jenkins programmatically. This can be useful for performing administrative tasks, automation, and debugging.

+ `prepare for shutdown` : Preparing Jenkins for shutdown ensures that no new builds are started, and ongoing builds are allowed to complete before shutting down.





SETTING UP OUR FIRST JENKINS JOB 



###############################
Jenkins Intergrations
##############################

1.  Jenkins and AWS Intergration ( Installed aws cli on jenkins server , Create IAM role and attached to Jenkins instance to give access to jenkins and add the permissions that is required by jenkins . You can also integrate jenkins with aws using jenkins credentials kind called `AWS Credentials ` ( you would need an access and secret access key )


2. Jenkins & Github integration ( We created a token , on managed jenkins we added othe token to credentials using Username & password ) and then on the jenkins job you can use the credentials 




HANDS ON PROJECT 

+ Build a Freestyle jenkins job that starts and stops our dev and stage ec2 instances for cost optimization 

+  On your jenkins make sure you install AWS CLI 
by running the following commands 
`curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"`
`unzip awscliv2.zip`
`sudo ./aws/install`

+ Attach an IAM ROLE  on your jenkins server which gives permission to Jenkins to manage EC2 INSTANCES on your behalf . avoid using Access Keys because they are static credentials 

+ Build Triggers :  This is what trigers or causes jenkins to start a build . In this project we will use a build trigger called `build periodically` 


**Explanation:**

0: Minute field (at the 0th minute)
12: Hour field (12 PM UTC, which is 7 AM EST)
*: Day of the month field (every day)
*: Month field (every month)
*: Day of the week field (every day of the week) or specific days monday to friday u can set it like 1-5 

**Steps to Set Up in Jenkins:** 

Open Jenkins: Go to your Jenkins dashboard.
Select the Job: Click on the job you want to schedule.
Configure the Job: Click on "Configure" on the left-hand menu.
Build Triggers: Scroll down to the "Build Triggers" section.
Schedule the Build: Check the "Build periodically" option.
Enter the Schedule: Enter the cron syntax 0 12 * * * in the schedule text box.
Save: Click the "Save" button.



#############################
**Jenkins Slack Integration**
#############################


Reference documentation :   https://plugins.jenkins.io/slack/ 

+ Install the `Slack Notification plugin` on Jenkins UI (Manage Jenkins-Systems Configuration-Plugins)
+ Go to your slack Channel and login to slack on the browser : https://api.slack.com when you have login to slack go to : https://api.slack.com

+ `Note`: If you install the app into your workspace and you go to your slack workspace and you dont see the app you just created , go back on the apps on web ui (`https://app.slack.com`) click on the specific app , click on app `details` it will open a new link and then click on `open in slack` this will redirect to your slack channel workspace   


############################
Jenkins Jira Intergration 
############################

This helps jenkins to interact with Jira and this is done through Jira webhook and jira API . WE Will look at this later .


1. **FREE STYLE PROJECT** : This is a General Purpose , built-automation project that supports simple configuration and its highly flexible. 

+ It allows you to define Build steps and Post Build Actions using the Jenkins UI (User interface) 

**build step*: is the action or task you actually want jenkins to carryout , you can setup more than 1 build steps 

**Post Build Action* : This steps tells jenkins what to do after the build is success or failed .'once the build is done what should i do next`?  you can set more than 1 post built action 

**Key Features of a Free Style Project**

+ Simple to setup : It has a user friendly interface 
+ Build Steps e.g executing shell scripts , you can run window batch commands, you can invoke maven , gradle etc
+ it has Buid in Post Build Actions setup

**USE CASE**  ( When should you pick a freestyle project over other project configuration) 

+ Small projects : This is good for small projects with simple setups and dont require any complex build process

+ Quick Prototyping : Its good to build quick build jobs to test basic functionalities for your application 







2. **PIPELINE PROJECTS** A Jenkins pipeline project is designed to handled complex Continous Delivery pipeline as code. 
+ It uses Groovy-Based DSL (Domain specific language), it uses this language to define your build processes or steps in a `Jenkinsfile` .
+ The default name to save the file is called Jenkinsfile


**What is a Jenkinsfile** . This is a file that contains steps of your jenkins build pipeline that helps to build , test and deploy your application . The jenkins pipeline can be written into two different types of syntax


Types of Jenkins Pipeline Syntax

1. `Declarative Pipeline` : It uuses High-level syntax designed for simplicity and readability.
  + Provides predefined structure and keywords, making it easier to write and maintain.
  + Enforces a more structured format.
  + Includes a pipeline block as the top-level structure.(It starts with `pipeline` )
  + it Supports post actions for better handling of success, failure, and cleanup steps.

  `example` 

  pipeline {
    agent any
    stages {
        stage('Build application') {
            steps {
                echo 'Building...'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
            }
        }
    }
    post {
        always {
            echo 'Pipeline completed.'
        }
    }
}


2. `Scripted Pipeline` :  Low-level syntax for more advanced control and flexibility.
+ Its Written entirely in Groovy, allowing for complex scripts and custom logic.
+ it Provides complete freedom but requires more Groovy knowledge.
+ it uses node blocks to define pipeline execution

`example`

node {
    stage('Build') {
        echo 'Building...'
    }
    stage('Test') {
        echo 'Testing...'
    }
    stage('Deploy') {
        echo 'Deploying...'
    }
}


**When should you use Declarative Vs Scripted Pipelines**

| **Feature**         | **Declarative Pipeline**             | **Scripted Pipeline**             |
|----------------------|---------------------------------------|------------------------------------|
| **Ease of Use**      | Beginner-friendly, easier syntax.    | Advanced users, complex logic.    |
| **Structure**        | Enforces a strict structure.         | Fully flexible, no strict rules.  |
| **Error Handling**   | Built-in error handling (`post`).    | Custom error handling required.   |
| **Use Case**         | Common CI/CD pipelines.              | Advanced or custom workflows.     |


**Key Features of a Pipeline Project**

+ *Pipeline as code* : The entire build process can be defined in a `jenkinsfile` which allows version control and easy updates
+ *it can handle complex workflows*: Pipelines gives you the freedom to extend builds capabilities.You can also setup multi-branch pipelines , parallel execution , stages with complex workflow .
+ **Extensibility* : Pipeline projects are easy for you to extend its functionalities because it offers options to use multiple plugins for continous integration and delivery 
+ Durable in the sense that , they can survive Jenkins Master Restart ,and the state of the pipeline is going to be reserved 


**USE CASE PIPELINE** 

+ Complex Workflows or projects 
+ Its good for Micro-services deployments because you can have coordinated builds and deployments 




#####################################
A CLOSER LOOK FOR A **JENKINSFILE** : 
#####################################

A Jenkinsfile is a text file that contains the definition of a Jenkins Pipeline and is checked into source control. There are two types of syntax that can be used in a Jenkinsfile: Declarative and Scripted.

1. **Declarative Syntax** : This syntax provides more structured and easier to read format for writing Jenkins pipelines

`example of a declarative pipeline syntax `

pipeline {
    agent agent1

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
        stage('clown repository') {
            steps {
              git clone 
            }
        }
    }
}

    

+ *Pipeline* : All jenkins pipelines written in declarative syntax starts with the word `pipeline`
+ *agent any* : This is where you specify where the pipeline will run e.g master , agent , or specific nodes or agents.  agent any means the pipeline will run on any agent (node or server)
+ *Stages* : Contains a sequence of stages , each has its own set of steps
+ *Stage* : Stage are nested or they are under stages where stage means each task the pipeline will execute and the actual commands for the piple to execute are under steps  
+ *Steps* : Steps is where you defined the tasks or action you want the particular step in your pipeline to execute e.g will echo the word ` hello world`  , the second step on the pipeline example will clone a git repository



2. **Scripted Pipeline** 

 A scripted pipeline syntax offers more flexibility and is based on groovy code. This syntax is less structured than declarative syntax but it allows for complex logic. 

`Example of a Scripted Pipeline Syntax`

node {
    def mvnHome
    stage('Preparation') { // for display purposes
        // Get some code from a GitHub repository
        git 'https://github.com/jglick/simple-maven-project-with-tests.git'
        // Get the Maven tool.
        // ** NOTE: This 'M3' Maven tool must be configured
        // **       in the global configuration.
        mvnHome = tool 'M3'
    }
    stage('Build') {
        // Run the maven build
        withEnv(["MVN_HOME=$mvnHome"]) {
            if (isUnix()) {
                sh '"$MVN_HOME/bin/mvn" -Dmaven.test.failure.ignore clean package'
            } else {
                bat(/"%MVN_HOME%\bin\mvn" -Dmaven.test.failure.ignore clean package/)
            }
        }
    }
    stage('Results') {
        junit '**/target/surefire-reports/TEST-*.xml'
        archiveArtifacts 'target/*.jar'
    }
}


+ *node*: This block defines node (agent or server) where the pipeline is going to run 
+ *stage* : Stage is where you defined the tasks or action you want the particular stage in your pipeline to execute e.g you can have preparation stage , build stage , result stage , notification stage 

Java Web Application 
NodeJs Application 


First Pipeline Job 



- How install and configure jenkins 
- Jenkins configurations features (Manage Jenkins)
- Jenkins AWS integration (IAM roles or aws access keys)
- How integrate jenkins with git and github (Freestyle project , Pipelines) 
- How to integrate jenkins with slack 






Team4tech Solutions 
Java web applications ( was written java) ---> mvn build 

Node js application ( Nodejs) --> Yarn install , Node install 




**MAVEN** 

Build automation tool 
At team4tech solutions `Java web application and a Nodejs application`


**What is Maven ? :* 

This is a  build automated tool used for `Java Projects`.  It simplifies the build process, dependency management, and project documentation through a `project object model (POM)`. Maven is designed to address various aspects of the software development lifecycle, including compiling code, packaging binaries, running tests, generating documentation, and deploying artifacts.

+ Maven is used to build `Java projects` .a java project is simply a Java application 

**Key features of Maven Include**

+ `Dependency Management` : Automatically downloads and manages the libraries and plugins required by your project.
+ `Project configurations` : Maven uses a single configuration file called ( `pom.xml` ) its uses this file to manage project dependencies, build configurations and plugins 
+ `Build Automation` : Provides consistent and repeatable builds by standardizing the build process.
+ `Project Documentation`: Generates comprehensive documentation from the project's source code.

Project file for maven is called `POM.XML`



**History of Maven** 

+ Maven was developed by the Apache Software Foundation, and its first release was in `July 2004`. The need for Maven arose from the limitations and complexities encountered with Apache Ant, the predecessor build tool. The name "Maven" means "accumulator of knowledge," reflecting the tool's goal to bring best practices and patterns to the development process.

**Purpose of Maven**

+ To simplify the build process: Providing a uniform build system across projects.
+ To simplify dependency management : Handling external libraries and project dependencies automatically.
+ Project consistency:  Enforcing conventions to ensure consistent project structures.

**What are the names of other build servers or build tools** 

+ Gradle 
+ Ant 

| Feature                     | Maven                                               | Ant                                                 | Gradle                                               |
|-----------------------------|-----------------------------------------------------|-----------------------------------------------------|------------------------------------------------------|
| **Build Configuration**     | Declarative (`pom.xml`)                             | Procedural (`build.xml`)                            | Declarative (Groovy/Kotlin DSL)                      |
| **Dependency Management**   | Built-in                                            | Requires additional tools (e.g., Ivy)               | Built-in                                             |
| **Project Structure**       | Enforces standard conventions                       | Flexible, user-defined                              | Flexible, user-defined                               |
| **Build Lifecycle**         | Predefined build lifecycle                          | Customizable tasks and targets                      | Customizable lifecycle with incremental build support|
| **Flexibility**             | Opinionated, less flexible                          | Highly flexible, user-defined tasks                 | Highly flexible with rich API                        |
| **Performance**             | Moderate                                            | Moderate                                            | Generally faster with incremental build support      |
| **Scripting Language**      | XML                                                 | XML                                                 | Groovy or Kotlin                                     |
| **Ease of Use**             | Easier for standard Java projects                   | Requires more configuration, more complex           | Easier for complex builds, more intuitive DSL        |
| **Community & Ecosystem**   | Large, mature ecosystem with many plugins           | Mature but smaller ecosystem compared to Maven      | Growing ecosystem with increasing adoption           |
| **Documentation**           | Comprehensive and well-documented                   | Good documentation, but less standardized           | Good documentation, continuously improving           |
| **Incremental Builds**      | Not supported                                       | Not supported                                       | Supported                                            |
| **IDE Integration**         | Well-supported in most IDEs                         | Well-supported in most IDEs                         | Well-supported in most IDEs                          |
| **Use Cases**               | Standardized Java projects                          | Custom build processes, older projects              | Complex builds, multi-language projects              |



**Maven Architecture Overview** 

1. Core components 

+ `Project Object Model (POM )` . The pom.xml its fundamental unit of maven . Inside this file `pom.xml` it describes all mavens projects , dependencies and plugins and other configurations.

source code : This main code used in building a software or application 

**Key elements inside the pom.xml** 

<modelVersion>: Specifies the POM model version.
<groupId>: Unique identifier for the group or organization.
<artifactId>: Unique identifier for the project or module.
<version>: Version of the project.
<packaging>: Type of artifact (e.g., jar, war).
<dependencies>: List of dependencies required by the project.
<build>: Configuration for the build process, including plugins.
<profiles>: Define sets of configuration values for different environments.


2. **Repositories**

Definition: Repositories store all of Maven’s artifacts (libraries, plugins, etc.). Maven uses repositories to download and upload artifacts.

**What are the different Types of Maven Repositories**  

+ **Local Repository:**  Located on the developer's machine (e.g., ~/.m2/repository). Stores downloaded artifacts and local builds.

+ **Central Repository:**  Maven Central is a public repository containing a vast number of libraries and components.

**Remote Repository:**  Can be any repository accessible over the internet or intranet. Organizations often set up their own remote repositories using tools like Nexus or Artifactory.


3. **Plugins** : Plugins provide the capability to perform tasks within Maven's build process. They are responsible for executing specific goals such as `compiling code, running tests, or packaging artifacts`

**Common Plugins:**

**Compiler Plugin*: Compiles source code (maven-compiler-plugin).
**Surefire Plugin*: Runs unit tests (maven-surefire-plugin). Unit Test Cases 
**Jar Plugin*: Creates JAR files (maven-jar-plugin).
**War Plugin*: Creates WAR files (maven-war-plugin).
**Ear Plugin* : Creates EAR files 



4. **Maven Lifecycle** : Maven’s build lifecycle is a well-defined sequence of phases that Maven executes in order to build and deploy a project. The build process is divided into three main lifecycles: default, clean, and site.


1.1 : **Default Lifecyle** ; This lifecycle is responsible for building and deploying the project.

**The steps or phases this mavens uses when buiding with the Default Life Cycle* 

+ **validate** : Checks if the project is correct and all necessary information (dependecies) is available.
+ **compile**: Compiles the source code.
+ **test** : Runs unit tests.( when developers write the code they write unit test cases)
+ **package**: Packages the compiled code into a distributable format (e.g., JAR, WAR, EAR ).
+ **verify** : Runs any checks to ensure the package is valid and meets quality criteria.
+ **install** : Installs the package into the local repository for use as a dependency in other projects.
+ **deploy**: Copies the package to a remote repository for sharing with other developers and projects.


1.2 . **Clean Lifecyle** : This lifecycle is used to clean up files created during the build process.

*Phases:*

+ pre-clean: Performs actions required before the actual cleaning.
+ clean: Deletes the `target` directory where Maven stores its build artifacts.
+ post-clean: Performs actions required after cleaning.

1.3 . **Site LifeCycle** : This lifecycle is used to generate project documentation.
 
*Phases:*

+ pre-site: Performs actions required before generating the site.
+ site: Generates the project site documentation.
+ post-site: Performs actions required after generating the site.
+ site-deploy: Deploys the generated site to a web server.

`In a nutshell a maven lifecyle is just a series of steps maven takes to build , test , deploy and document a maven project` . 





## Maven Installation 

Reference Documentation : https://maven.apache.org/download.cgi
To install maven you need some prequesites : 
+ if installing Maven version 3.9+ and above you will requires JDK (Java development kit) 8 or above to execute 
+ You can install Maven on different operating systems such as `linux , Mac , Windows etc`
+ You can install Maven using the CLI or GUI by downloading the Files 

*Step 1*

**Installation on MAC** 

+ Use mac package manager using brew `brew install maven` 

**Linux Operating System**

sudo apt update 
sudo apt install maven 


**Installation Manually (windows )**

go on this website : https://maven.apache.org/download.cgi
Download the latest binary tar.gz archive. e,g apache-maven-3.9.8-bin.zip or apache-maven-3.9.8-src.tar.gz
you can extract the file using the fowllow commands : unzip or tar 



**step2 after downloading you need to configure Environmental Variables*

vi or nano ~/.bashrc 
vi or nano ~/.bash_profile 

**Step3 Add the following lines*

`export MAVEN_HOME=/opt/apache-maven-<version>`
`export PATH=$MAVEN_HOME/bin:$PATH`

**Step4* : Apply the chanes and run the following command below 

`source ~/.bashrc` or `~/.bash_profile `


+ Next Install the `Maven Intergation Plugin` you should be fine 
+ automated installation of Maven you can install maven by going to Managed Jenkins ----> System configurations , go to tools and from tools ---select Maven Installation and the version you want.Select installer type 

+ After installing Maven plugin you will be able to Build Jobs using a Maven project 
+ When you run the maven build it comes with a target directory . 

+ to confirm if maven has been installed run the following command 
`mvn -v` . you should see the information like this 

example

Apache Maven 3.8.7
Maven home: /usr/share/maven
Java version: 21.0.5, vendor: Ubuntu, runtime: /usr/lib/jvm/java-21-openjdk-amd64
Default locale: en, platform encoding: UTF-8
OS name: "linux", version: "6.8.0-1021-aws", arch: "amd64", family: "unix"

`Troubleshooting errors`

 : if you see `Command 'mvn' not found` then maven has not been installed but if you truly think you installed then you might be missing enviromtal variables setup . so ahead and set the following environtal varianbles 


vi or nano ~/.bashrc 
vi or nano ~/.bash_profile 

**Step3 Add the following lines*

`export MAVEN_HOME=/opt/apache-maven-<version>`
`export PATH=$MAVEN_HOME/bin:$PATH`

**Step4* : Apply the chanes and run the following command below 

`source ~/.bashrc` or `~/.bash_profile `




**Building and Running Maven Projects** 

1. **Basic Maven Commands* : 
Maven provides different commands to perform various task in relation to the build and management of projects. 
These commands can be executed inside the project directory this is where the pom.xml file is found. 

`mvn compile` : This command compiles the source code of your project 
This command processes the source code in the src/main/java directory and places the compiled bytecode in the target/classes directory.

`mvn test` : 
Purpose: Runs unit tests using the maven-surefire-plugin.
Executes tests located in the src/test/java directory and places the test results in the target/test-classes and target/surefire-reports directories.

`mvn package` : 
Packages the compiled code into a distributable format (e.g., JAR, WAR).
Creates the final artifact (e.g., target/WebApplication-1.0-SNAPSHOT.jar or target/WebApplication-1.0-SNAPSHOT.war) based on the packaging type defined in the pom.xml.

`mvn install` : 
Purpose: Installs the packaged artifact into the local repository.
After packaging, this command places the artifact into the local Maven repository (~/.m2/repository). This allows other projects on the same machine to use the artifact as a dependency.

`mvn deploy` : 
Deploys the artifact to a remote repository.
Uploads the artifact to a remote repository (e.g., Nexus, Artifactory). This is typically done for sharing artifacts with other developers or projects.


## What is Jar , War & Ear ?

In the context of `Java applications`, WAR, JAR, and EAR are types of archive files used to package and distribute applications.Each of them are used for different types of java applications. 

1. **JAR (Java Archive)** :

JAR files are used to package Java class files, associated metadata, and resources (like images and configuration files) into a single archive. They are mainly used for distributing Java libraries or standalone applications.

+ The file extension is `.jar`

*What is a standalone application ? :* 

A Standalone applications, also known as desktop applications or desktop software, these are programs that run directly on a user's computer without requiring a web server or internet connection to function. They are self-contained and typically have a graphical user interface (GUI) that interacts directly with the operating system. 

**Examples of Standalone Applications*

+ Productivity software; (Word ,Excel ,Powerpoint )
+ Utilities softwares ; ( Antivirus programs like , Norton , McAfee etc)
+ Media players (Windows Media Player, VLC media player)
+ Development Tools ( VS Code )


2. **WAR (Web Application Archive)** : 

WAR files are used to package web applications. They include all the necessary components to deploy a web application to a web server or servlet container.
+ The file extension is `.war`


**Usage**  
Web Applications: Deployed to web servers like Apache Tomcat, Jetty, or application servers like JBoss, WebLogic.
Example: myapp.war

*What is a Web application ? :* 

+ A web application is a software application that runs on a web server and is accessed through a web browser over a network (typically the internet). Unlike standalone desktop applications that run on a user's local machine, web applications are designed to be accessed and used via web browsers, providing users with a wide range of functionality through the web.

**Types of Web Applications**

+ . **Static Web Applications:*

Definition: Serve fixed content that does not change unless manually updated.
Example: Simple websites with static HTML pages. (web applications we have been deploying in class using Apache (index.html))

+ . *Dynamic Web Applications:*

*Definition:* Generate content on-the-fly based on user input or other factors.
*Example:* Online stores e.g Amazon, social media platforms like facebook, instagram, twitter , and content management systems (CMS).

+ . *Single Page Applications (SPAs):*

*Definition*: Load a single HTML page and dynamically update content as users interact with the app, providing a more fluid user experience.
*Example*: Google Maps, Gmail.


+ . *Progressive Web Applications (PWAs):*

*Definition*: Web applications that use modern web capabilities to deliver an app-like experience. They can work offline and be installed on a user’s device.

*Example:* Twitter Lite, Starbucks.


3. **EAR (Enterprize Archive)**

EAR files are used to package and deploy Java EE (Enterprise Edition) applications, which may include multiple modules such as JARs and WARs. They are used for large-scale, enterprise-level applications.
+ file extension is `.ear`

**What is an ENTERPRIZE APPLICATION** 

Enterprise applications are large-scale software systems designed to support and automate the core functions and processes of an organization. They are built to handle a significant volume of data, a large number of users, and complex business requirements. These applications are typically integrated into an organization's infrastructure to streamline operations, improve efficiency, and support decision-making.

**Types of Enterprise Applications** 

+ *Enterprise Resource Planning (ERP):*

Purpose: Integrates core business processes across various departments (e.g., finance, HR, manufacturing, supply chain).
Examples: SAP ERP, Oracle ERP Cloud, Microsoft Dynamics 365.

+ **Customer Relationship Management (CRM):*

**Purpose: Manages interactions with customers and potential customers, helping to improve relationships, sales, and customer service.
Examples: Salesforce, HubSpot CRM, Zoho CRM.


+ **Business Intelligence (BI):*

Purpose: Analyzes business data to provide insights and support decision-making through reporting, dashboards, and data visualization.
Examples: Tableau, Power BI, QlikView.

+ **Supply Chain Management (SCM):*

Purpose: Manages and optimizes the supply chain processes, including procurement, production, inventory management, and logistics.
Examples: SAP SCM, Oracle SCM Cloud, JDA Software.

+ **Human Resource Management Systems (HRMS):*

Purpose: Manages employee data, payroll, recruitment, performance evaluations, and other HR-related functions.
Examples: Workday, ADP, BambooHR.

+ **Content Management Systems (CMS):*

Purpose: Manages and organizes digital content, including documents, web content, and media.
Examples: SharePoint, Drupal, Sitecore.

+ **Enterprise Asset Management (EAM):*

Purpose: Manages the lifecycle of physical assets, including maintenance, procurement, and replacement.
Examples: IBM Maximo, Infor EAM, Oracle EAM.


Maven Application is located in this repository 

`https://github.com/CalsonNjinoh/DevOps`



pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Cloning GitHub repository ....'
                git branch: 'main', credentialsId: 'GitHub-jenkins-auth2', url: 'https://github.com/CalsonNjinoh/DevOps.git'
            }
        }
        stage('Maven Build') {
            steps {
                dir('WebApplication-2') {
                    sh 'mvn test'
                    sh 'mvn package'
                }
            }
        }
        stage('Send message to Slack') {
            steps {
                echo 'Sending message to Slack channel'

                slackSend(
                    channel: '#jenkins-notifications',
                    message: 'Hi class6 and 7, your application deployment is now successful',
                    color: '#36a64f' // Optional: specify a color for the message
                )
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution is now completed'
        }
    }
}



