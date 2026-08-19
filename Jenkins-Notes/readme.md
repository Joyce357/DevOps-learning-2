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






# SONAQUBE 

`What is sonarqube`

Sonarqube is an open-source platform that performs continuous inspection of code quality. It supports static code analysis to detect bugs, code smells, and security vulnerabilities.


+ Note Sonarqube runs a static code analysis :`What is static code analysis` - Static Code Analysis is a method of checking code without running it to find errors, security issues, and bad coding practices. It helps developers catch problems early before the software is tested or deployed.


**Key Features of Sonarqube** 

1. `Static Code Analysis` : Analyzes source code without executing it, identifying potential issues early in development.
2. `Security vunerability detections`: Identifies security flaws using OWASP, SANS Top 25, and CWE standards.
3. `Code Quality Metrics` : Measures code duplication, complexity, maintainability, and technical debt.
4. `It supports Multiple Programing Languages` : Supports Java, JavaScript, Python, C, C++, Go, Kotlin, PHP, TypeScript, and more.
5. `Intergration with CI/CD Pipelines` : its Works with Jenkins, GitLab CI/CD, GitHub Actions, Azure DevOps, Bitbucket Pipelines, etc.
6. `Quality Gates & Rules Enforcement` : Defines pass/fail criteria based on code quality thresholds.
7. `Code coverage Analysis` : Supports integration with JUnit, Jacoco, Clover, Istanbul, etc.
8. `Developer & Management Dashboards` : Provides graphical reports for developers and managers to track technical debt and improvements.



## OVERVIEW OF STATIC CODE ANALYSIS 

**What are some of the Key Aspects of Static Code Analysis using tools like Sonarqube** 

+ `Code Smells`: Patterns in code that indicate potential problems.A Code Smell is a sign of poor code quality that makes the code harder to understand, maintain, or extend
+ `Bugs`: A bug is an error, flaw, or unexpected behavior in a software program that prevents it from functioning correctly. Bugs can occur due to coding mistakes, logical errors, missing requirements, or system failures
+ `Vulnerabilities`: What are some of the Security issues OR Concerns that could be exploited.
+ `Code Coverage`: The percentage of code executed during tests, indicating the thoroughness of testing.



**Benefits of using Sonarqube or Code Quality Analysis in your CI/CD Pipeline or Project** 

+ **It Improves Code Quality*: It Detects issues early in the SDLC, and helps in maintaining high code standards.
+ **Enhanced Security*: Identifies security vulnerabilities and promotes secure coding practices.
+ **Maintainability*: Provides insights into code smells and potential refactoring needs.
+ **Continuous Feedback*: Integrates with CI/CD pipelines to provide real-time feedback on code quality.
+ **Customizable*: Offers flexibility through customizable rules and quality profiles.


`Other tools for static code analysis apart from sonarqube are`: 

+ Checkmarx : Security-focused static analysis
+ Coverity : Enterprise-grade security and defect detection
+ Fority static code analyzer : Large enterprises and compliance-heavy environments
+ DeepSource :  AI-powered static analysis , AI-driven insights for improving code quality
+ OWASP Dependency-Check : Dependency security scanning. Detects vulnerable third-party libraries ,supports Java, JavaScript, Python, and .NET



##########################
## SONARQUBE INSTALLATION 
##########################

**STEP 1 :** 

 Create a new EC2 instance for your Sonarqube Server ( recommend `T2 medium` )

**STEP 2 (follow the installation Guide )**

## INSTALLATION AND CONFIGURATION OF SONARQUBE 


Here is the installation Guide :  `https://github.com/jae1choi/sonaqueue-installation-guide` follow this guide step by step 
and you will successfully installed Sonarqube 


+ Default sonarqube port : 9000
+ Defaule sonarqube UI username & Password : `admin` 


1. Prepare your Ubuntu server.

SSH to your Ubuntu server as a non-root user with sudo access.
Update your server.
sudo apt update
sudo apt upgrade -y

2. Install OpenJDK 11

Install OpenJDK 11.
sudo apt install -y openjdk-21-jdk 

3. InstalL Postgress

sudo apt install -y postgresql postgresql-contrib
sudo systemctl enable --now postgresql
sudo systemctl status postgresql

4. Change the default PostgreSQL password.

sudo -u postgres psql

5. Switch to Postgress user 

sudo -u postgres psql

6. Create a Sonar

createuser sonar

7. Log into PostgreSQL.
psql

8. Set a password for the sonar user. Use a strong password in place of my_strong_password.

ALTER USER sonar WITH ENCRYPTED password 'my_strong_password';

9. Create SonarQube database and set its owner to sonar.

CREATE DATABASE sonarqube OWNER sonar;


10. Grant all privileges on SonarQube database to the user sonar.
GRANT ALL PRIVILEGES ON DATABASE sonarqube to sonar;

11. Exit PostgreSQL.

\q

12. Return to your non-root sudo user account.

exit


13.  Download and Install SonarQube

Install the zip utility, which is needed to unzip the SonarQube files.

`sudo apt install -y zip`

`wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-26.8.0.126808.zip`

`unzip sonarqube-26.8.0.126808.zip`

`sudo mv sonarqube-26.8.0.126808 /opt/sonarqube`

`Note` : If you want to install the latest version of sonarqube you will need the following binaries below . 

Sonarqube Latest Version URL : wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-10.6.0.92116.zip

Note : You will require java version 11 if you are using sonarqube version 10 and below 

#mysonarqube password welcome1

Add SonarQube Group and User
 sudo useradd -d /opt/sonarqube -g sonar sonar
  sudo chown sonar:sonar /opt/sonarqube -R


####################################
## JENKINS - SONARQUBE INTERGRATION 
####################################

STEP-1 

Jenkins 

+ Install SonarQube Plugin on your jenkins UI : `SonarQube Scanner` plugin
 (Manage Jenkins ---> System configurations----> Plugins---->Available plugins search for SonarQube Scanner plugin )


STEP-2
Sonarqube 

+ Go to Sonarqube UI and click on Administration ----> Click Security---> select users and you will see a default sonarqube user called administrator , at top right under tokens select the 4 doted lines to generate a token for the user . 

+ Give the token a name and click on generate token 
+ Copy the token and add the token under jenkins 


`STEP 3`

Jenkins 

+ The token you created in sonarqube add the token under Jenkins credentials and the credential kind is `secret text` . paste the secret where it says secret and give it any i.d of your choice and save . 

+ Go to Manage Jenkins ---> System configuration ---> systems and look for sonarqube 
+ When you locate sonarqube select environmental variables , give a label to the environmental variables e.g Team4techsolutions and paste the url of your sonarqube server in the server url e.g `http://3.96.168.175:9000`  

+ Then next add `Server authentication token` by selecting the token you added in step2 . 

username : admin 
password : welcome1 


`Step 4` 

Add sonarqube steps to your ci/cd pipeline 

pipeline {
    agent any
    tools {
        maven 'Maven3.9.9'
    }

    stages {
        stage('Hello') {
            steps {
                echo 'Cloning GitHub repository ....'
                sh 'mvn -v'
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
        stage('Running static code analysis with Sonarqube'){
            steps {
                dir('WebApplication-2') {
                    withSonarQubeEnv(installationName: 'team4techsolutions') {
                        sh 'mvn sonar:sonar -Dsonar.java.binaries=target/classes'
                    }
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





Class10@sonarqube
9:30 pm est 
letmein@619







**SONARQUBE INSIGTS or FEATURES ** 

+ Sonarqube is used for Static Code Analysis 
+ You can access Sonarqube on the UI
+ Sonarqube Default Port is 9000
+ Sonarqube comes with default quality profile 
+ You can intergrate sonarqube with jenkins using plugins


1. ## ISSUES IN SONARQUBE 

+ Sonarqube issues are problems that have been detected in your codebase during a sonarqube analysis.They represent deviations from coding standards, potential bugs, security vulnerabilities, or code smells.

**DIFFERENT TYPES OF ISSUES** 

+ **Code smells** : Suboptimal code practices that affect readability, maintainability, or performance but don't necessarily cause functional issues.

+ **Bugs** : This is an issue or defect that can lead to incorrect behaviour or system failure. 

+ **Vunerabilities**: This are security flaws that can lead to bad actors to compromise the application 



**SEVERITY LEVEL** :  With the various types of issues that sonarqube is going to scan for . it will classify the issues in different severity levels . This means it classifies into levels of how critical or important the issues can impact your application . 


`OLD SONAQUBBE SEVERITY CLASSIFICATIONS`

+ **Critical* : These are high impact issues that needs immediate attention 
+ **Major* : These significant issues that affects code quality but they are less severe than critical issues 
+ *Minor* : These are issues that have minor impact and should be addressed to maintained a good practise. 
+ **info* : Informational issues that provides recommendations for improvement. 
+ **Blocker* : This is the most severe type of issue which prevents code from functioning correctly or compromises the application's stability. 


`NEW VERSION OF SONARQUBE SEVERITY CLASSIFICATION`


+ **High* : These are high impact issues that needs immediate attention 
+ **Medium* : These significant issues that affects code quality but they are less severe than High issues 
+ *Low* : These are issues that have minor impact and should be addressed to maintained a good practise. 
+ **info* : Informational issues that provides recommendations for improvement. 
+ **Blocker* : This is the most severe type of issue which prevents code from functioning correctly or compromises the application's stability. 




2. ## RULES

These are predefined guidelines or custom guidelines used by Sonarqube to anlyze code and detect issues. Rules define what constitutes a problem and how it should be reported.

**TYPES OF RULES** 

+ **Built-in Rules* : Default rules provided by SonarQube, which cover various programming languages and common coding issues.

+ **Custom Rules* : User-defined rules that can be created to address specific coding standards or practices within an organization.

Sonarqube comes with different languages with in built rules and some of the languages sonarqube supports are : 

+ Java
+ typescript 
+ c#
+ python
+ PHP
+ VB.NET
+ XML


Project : Java   :  Quality profile 
Project : Python  Typescript :  Quality profile 

**Rules Categories**

+ Bugs : Theses rules will detect potential bugs in your code
+ Vunerability : Rules that will identify security vunerabilities
+ Code smell : Rules that will flag code smells
+ Security hotspot : Rules that identify areas of code that may be security risk but require manual review. 



3. ## QUALITY PROFILES 

These are a  collections of rules that are applied to analyze a project. They define which rules are enforced and their severity levels

+ Quality profiles help standardize code quality practices across projects and teams by applying a consistent set of rules.
+  Each project can be assigned a specific quality profile, which dictates the rules applied during analysis.
+ Customizable: Users can create and modify quality profiles to align with specific coding standards or requirements.
+ Language-Specific: Different profiles can be used for different programming languages


4. ## QUALITY GATE 

Quality gates are sets of criteria or thresholds that a project must meet to pass code analysis. They help enforce code quality standards by defining acceptable levels for various metrics.

+ Quality gates ensure that projects meet predefined quality standards before they are promoted to the next stage of the development process (e.g., deployment).

+ We have built in Quality Gate and you can customize your own quality gate.
+ Criteria: Quality gates can include criteria such as the number of new issues, code coverage percentage, duplications, and more.
+ Customizable: Users can define and configure quality gates based on specific requirements or standards.
+ Impact: Projects failing to meet the criteria of a quality gate are typically blocked from proceeding to the next stage, ensuring that only high-quality code is released.


Setup your jenkins pipeline to check on the quality gate and if the quality gate results is passed then the pipeline build would proceed to the next stage and if the build is failed it will abort meaning it wont proceed to deploy the application 

steps 

+ Go on Sonarqube UI ---Click on Administration ---Under administration click on --> Configurations and select webhook 

+ Create a webhook and give the webhook any name and URL go to your jenkins server and copy the url e.g `http://jenkins-336613335.us-east-1.elb.amazonaws.com` and add the following to `sonarqube-webhook` at the end .here is the full example of how the url should look like 

`http://jenkins-336613335.us-east-1.elb.amazonaws.com/sonarqube-webhook`


step 2

add the following step on your jenkins pipeline 

 stage('Quality Gate') {
            steps {
                timeout(time: 2, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }


5. Administration 



## SONATYPE NEXUS (Artifactory Repository)

What is Nexus : Its an artifact repository manager used to store, manage, and distribute software components or artifacts across a DevOps pipeline in case we will be storing our Jar ,War or Ear packages.It is commonly used in modern software development workflows to manage binaries, libraries, dependencies, and Docker images. Nexus supports various package formats, such as `Maven`, `npm`, `Docker`, `NuGet`, `RubyGems`, and many more . 



1. `Artifacts Management`:

+ Stores and manages various types of software artifacts (e.g., Java libraries (war , ear ,jar), Docker images, Node.js packages).
+ Supports both open-source and commercial software components, enabling teams to share and reuse code efficiently.

2. `Repository Types`: 

+ Hosted Respositories: These respositories you can store your own artifacts e.g in our case WAR 
+ Proxy Repositories : These acts as a cache for remote repositoes like Maven Central , enabling faster builds by avoiding repeated downloads
+ Group Repositories : Combine of Multiple repositories into one , simplifying artifacts access 

3. `Integration with Build Tools:` 

+ Integrates seamlessly with popular build tools such as Maven, Gradle, Jenkins, and other CI/CD platforms, making it easy to manage dependencies and deploy artifacts as part of your build pipelines.

4.`Security and Access Control`

+ Offers fine-grained access control to repositories through user roles, permissions, and integration with LDAP and other identity management systems.
+ Supports authentication mechanisms like Single Sign-On (SSO).

5. `Artifact Lifecycle` 

+ Manages the lifecycle of artifacts from development through testing, staging, and production.
+ Allows users to promote artifacts between stages, making it easier to manage the release pipeline.


Other Artifactory repositories other than Nexus are : 

+ `Jfrog` : its supports maven , gradle , npm ,docker etc 
+ `AWS CodeArtifact` : owned by aws and it supports Maven, npm, NuGet, Python (pip).AWS CodeArtifact is fully managed and integrates directly with AWS services, making it a natural choice for teams heavily invested in the AWS ecosystem.



**STEPS TO INSTALL NEXUS** 

Follow this documenation : `https://www.fosstechnix.com/install-nexus-repository-manager-on-ubuntu-24/#google_vignette`

After the installation is completed make sure you open port 8081 in your inbound rules to be able access Nexus on the browswer because nexus listens on port 8081 

Default username for Nexus is :  `admin` 
password can be found at :     `/opt/sonatype-work/nexus3/admin.password`

Nexus password : welcome1 


**JENKINS - NEXUS INTERGRATION**

Once your nexus server is up and running and you able to login 

+ On your nexus Repository manager , create a private repository and the repository type is `snapshots` 
+ On jenkins UI , go to Managed Jenkins --->System ----> Plugins and install the plugin called `Nexus Artifact Uploader` 
+ Add the nexus credentials in Jenkins under Managed Jenkins ---> Credentials ---> credential kind should be `username and password` in our case we will use the admin username and password but is strongly recommended to create a new user and their own password rather than using the admin user . 
+ Add step in your jenkinsfile to upload aritfacts in your repositoru 




pipeline {
    agent any
    tools {
        maven 'Maven3.9.9'
    }

    stages {
        stage('clone private repository') {
            steps {
                echo 'Cloning GitHub repository ....'
                sh 'mvn -v'
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
        stage('Running static code analysis with SonarQube'){
            steps {
                dir('WebApplication-2') {
                    withSonarQubeEnv(installationName: 'team4techsolutions') {
                        sh 'mvn sonar:sonar -Dsonar.java.binaries=target/classes'
                    }
                }
            }
        }
        stage('Quality Gate') {
            steps {
                timeout(time: 2, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
        stage('Upload Artifacts to Nexus') {
            steps {
                script {
                    dir('WebApplication-2') {
                        // Retrieve version from Maven
                        def version = sh(script: 'mvn help:evaluate -Dexpression=project.version -q -DforceStdout', returnStdout: true).trim()
                        echo "Version: ${version}"

                        // Construct the artifact path based on the version
                        def projectName = 'WebApplication'
                        def artifactPath = "target/${projectName}-${version}.war"
                        echo "Artifact Path: ${artifactPath}"

                        // Check if the artifact path exists
                        sh "if [ -f ${artifactPath} ]; then echo 'Artifact found'; else echo 'Artifact not found'; fi"

                        // Upload artifact to Nexus
                        nexusArtifactUploader(
                            nexusVersion: 'nexus3',
                            protocol: 'http',
                            nexusUrl: 'nexus.team4techsolutionsinc.com',
                            groupId: 'com.example',
                            version: version,
                            repository: 'class5jenkins-snapshot',
                            credentialsId: 'Jenkins-nexus-auth-cred',
                            artifacts: [
                                [artifactId: 'WebApplication',
                                 classifier: '',
                                 file: artifactPath,
                                 type: 'war'],
                                [artifactId: 'WebApplication',
                                 classifier: '',
                                 file: 'pom.xml',
                                 type: 'pom']
                            ]
                        )
                    }
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




9:20 pm est 



**HOW TO SETUP  BUILD TRIGGER FOR** 
`GitHub hook trigger for GITScm polling`

**STEP 1** 

+ Go to the github project repository and click on settings 
+ After clicking settings on the left hand side you will find webhooks click on it and click `add webhook` 
+ Add your jenkins url for example  `http://jenkins-336613335.us-east-1.elb.amazonaws.com` and `github-webhook` after the url so you should have a full url like this 


`http://jenkins-336613335.us-east-1.elb.amazonaws.com/github-webhook/`

If this has been setup correctly then you will see a delivery on the github under recent deliveries as okay 


**STEP 2**

+ Go on jenkins on the project e.g pipeline project or freestyle project select the `GitHub hook trigger for GITScm polling`








**CONTAINERIZATION** 

**What is Containerization** :

This is a type of virtulaziation at the OS level where you packaged your application and its depencicies such (libraries , configurations files , binaries etc) into lightweight , portable containers .These containers can run consistently across different computing environments, such as development, testing, and production, without being affected by the underlying infrastructure or operating system

 It's like putting your app and everything it needs into a virtual box that can run anywhere, from your laptop to the cloud, without worrying about differences in the underlying system. This makes applications easier to deploy, manage, and scale.


**DOCKER** 

`What is Dockers` ? : Docker is an opensource platform and a tool  used to `automate the deployment and management of containerized applications`. 


**Two types of Application Architecture**

`Micro-service Architecture` :Most micro service architecture applications uses containerization

`monolithic application`: A monolithic application is a traditional software architecture where the entire application is built as a single, unified unit. All components of the application (e.g., database, user interface, business logic) are tightly integrated and operate as one entity. 


**Steps to Install Docker**

**Installing Docker on Ubuntu**

reference documentation : https://docs.docker.com/engine/install/ubuntu/

for docker desktop install using this link for windows or mac : https://docs.docker.com/desktop/setup/install/windows-install/

`sudo apt-get update`
`sudo apt-get install ca-certificates curl`
`sudo install -m 0755 -d /etc/apt/keyrings`
`sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc`
`sudo chmod a+r /etc/apt/keyrings/docker.asc`

# Add the repository to Apt sources:

`echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`

`sudo apt-get update`

To install the latest version, run:

` sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin`

Verify that the Docker Engine installation is successful by running the hello-world image

`sudo docker run hello-world`  or run `docker --version` 


1.  Introduction to containers 
+ What is docker
+ What is a container or containerization 
+ Difference between containerization and Virtualization
+ What is Virtualization 

2. Docker installation and setup 

+ How to install docker ( windows ,MacOs & Linux)
+ Verify Version (docker --version) after installation 

3. Docker Architecture or Features of Docker 
+ docker daemond , client and engine
+ docker image , docker containers ,docker registries and dockerfile
+ dockerhub quick review



**ARCHITECTURE OF DOCKER** 



1. **Docker Engine (dockerd)** : This is the core platform of docker which helps in managing containers on the host Machine . The docker engine has 3 very important  components  (`Docker client , Docker Daemon , Docker Rest Api`)

+ **It has a Docker Daemon (dockerd)* : This is a background service running on the host machine that manages docker objects like e.g images , containers , networks and volumes(storage). It listens to the docker api request and performs actions to manage containers . 

+ **Docker Client* : This is a command line interface (CLI) tool that allows users to interact with the docker daemon . it can send commands such as `docker run` , `docker build` ,`docker pull` etc 

+ **Docker Rest API :  This is the interface used by docker client and other tools to communicate with the docker Daemon .This Api allows integration with other systems and automation of docker operations.


Api rest (command) ----> docker client -----> docker daemon (background service) manages docker images , docker containers . network etc 



2. **Docker Images** : A docker image is a lightweight ,standalone and executable package or its a read-only template used to create containers , that includes everything needed to run a part of your software or application. it can include the application code , runtime , libraries , enviromental variables and configurations etc . Images are immutable (which means once a docker image is built, it cannot be changed or modified) and can be versioned using tags . 

`Docker images have layers` 

+ Docker images have Layers and each layer is an instruction in the dockerfile e.g RUN , COPY , ADD etc 
+ Layers are stacked ontop each other in a specific order .The final image is the combination of all these layers 
+ Layers are cached and resused to optimized buiding process , making it faster and more efficient 

Docker images are Immutable 

+ Docker images are immutable ,meaning they cannot be changed once they are created 
+ if you really need to make a change you will need to create a new version of the existing image and add the new layer on the existing one 

+ Docker images are ,portable as they can run on any OS(operating system) that supports docker 
+ Docker images are resuable and can be resused in different projects e.g prod , staging and dev 
+ Docker images can be versioned
+ To create a docker image you need a `dockerfile` 



**DOCKERFILE** 

A dockerfile  is simply a text file  that contains a list of instructions that docker uses to build a Docker Image . In the dockerfile you will need to specify a base image , environment variables , commands to run , files to copy and more . 

**example of a dockerfile** 

FROM tomcat:9.0
RUN rm -rf /usr/local/tomcat/webapps/ROOT \
    && rm -rf /usr/local/tomcat/webapps/docs \
    && rm -rf /usr/local/tomcat/webapps/examples \
    && rm -rf /usr/local/tomcat/webapps/host-manager \
    && rm -rf /usr/local/tomcat/webapps/manager
COPY WebApplication-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]



**DOCKER CONTAINERS** : A docker container is running instance of a docker image . This is when your application or software have been deployed and running . While docker images are immutable and static , docker containers on the other hand are dynamic and can be started , stopped , moved or deleted . 


**Difference between a docker container and Docker Image**

| Feature                    | Docker Image                                              | Docker Container                                         |
|----------------------------|-----------------------------------------------------------|----------------------------------------------------------|
| **Definition**             | A blueprint or template for creating containers.          | A runnable instance of a Docker image.                   |
| **State**                  | Immutable, cannot be changed after creation.              | Mutable, changes during runtime but changes do not persist unless committed. |
| **Purpose**                | To define the environment and application dependencies.   | To run applications in isolated environments.            |
| **Storage**                | Stored in registries like Docker Hub , ECR                | Exists on the host system's storage as long as it's running or not removed. |
| **Creation**               | Built using a Dockerfile or pulled from a registry.       | Created from a Docker image using `docker run`.          |
| **Lifecycle**              | Static, does not change over time.                        | Dynamic, can be started, stopped, restarted, and removed.|
| **Isolation**              | Not directly executed; serves as the basis for containers.| Runs in an isolated environment with its own filesystem, network, etc. |
| **Example Command**        | `docker build`, `docker pull`                             | `docker run`, `docker stop`, `docker exec`               |


**Docker Registry** : 

A docker registry is a distributed system where you can save  or store docker  images .
It acts as a centralized location where you can save your docker images , managed them and retrieve them for your projects .
Docker registries are good for team collaboraion and automating deployments using CI/CD tools . 

Different Types of Docker Registries

1. *Public Registry* : These are registries where anyone can push and pull docker images. e.g Docker Hub 
dockerhub is the default and widely used registry .It hosts millions images 
apart from Docker hub other public registries are : ECR in AWS (Elastic container registry),GCR (Google container registry) , Quay.io.

2. *Private Registry* : These are restricted registries can only be accessed if you have the right permissions and authorization.Organizations or companies often use private registries to store proprietary or sensitive docker images.
Dockerhub , ECR , GCR etc provides private repositories .




+ BUILD OUR FIRST DOCKER IMAGE ( TEAM4TECH SOLUTION )
+ DEPLOY MANUALLY 
+ docker commands ( images and Containers )
+ Docker hub 
+ Integrate Docker with Jenkins 



Developers can write application code in different languages ( Nodejs react , Java , Jago , Python , c++ ETC ): 

+ Monolitheque Architecture  (All application code is package together to come out with an application )
+ Micro-service Architecture ( each service within the application is segregated or separated from each other but communicate with each other )


**HOW TO CREATE A DOCKERFILE**

In other for us to deploy our application we need to create a docker image . To create a docker image we need to use a dockerfile .

**Dockerfile** A dockerfile is simply a text file or document that contains a series of instructions for docker to follow in order
to create a docker image 



**What can be inside a dockerfile or Key components of a dockerfile**

example of our own dockerfile at Team4techsolutions 

FROM tomcat:9.0
RUN rm -rf /usr/local/tomcat/webapps/ROOT \
    && rm -rf /usr/local/tomcat/webapps/docs \
    && rm -rf /usr/local/tomcat/webapps/examples \
    && rm -rf /usr/local/tomcat/webapps/host-manager \
    && rm -rf /usr/local/tomcat/webapps/manager
COPY WebApplication-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
MAINTAINER team4tech solutions inc info@teamtechsolutions.com
VOLUMES

**COMPONENTS OF A DOCKERFILE**

1. **Base Image** : This is the image that your container will be built on , typically a lightweight operating system or a specific platform like ubuntu , alpine or node , tomcat etc 
+ example: FROM tomcat:9.0 , FROM ubuntu:22.04

2. **Maintainer (optional)** : This is the person or organization maintaining the image for example MAINTAINER team4tech solutions info@team4techsolutions.com or Nsoh Divine 

3. **RUN** : This executes a command or commands  in the container (it can be used to install software packages or setup configurations ) 
+ example `RUN rm -rf /usr/local/tomcat/webapps/ROOT \` OR `RUN apt-get update && apt-get install -y python3` 

4. **COPY** ; Copy command copies files from the host machine (local computer) to the container .you will specify the path in the container where you want the files to be copied to 

+ example `COPY WebApplication-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war` or `COPY . /app`

5. **WORKDIR** : This sets a working directory inside a container 
+ example : `WORKDIR /app`

6. **EXPOSE** : This informs docker that the conatiner listens on a specific network port at runtime . 
example : `EXPOSE 8081`

7. **CMD/ENTRYPOINT** : This specifies the command or program that should run when a container is started from the image. 
CMD : is overridden while ENTRYPOINT is not 

example : `CMD ["catalina.sh", "run"]`
example : `ENTRYPOINT ["./catalina.sh]

8. **ENV** : This sets environmental variables 
example `ENV APP_ENV=Production

9. **VOLUMES** : This will create a mount point with the specified path and marks it as holding externally mounted volumes 
for example : VOLUME /var/lib/mysql 

10. **ADD vs COPY** : Both commands are used to copy files from the host to the container. The difference is that ADD can handle URLs (Uniform Resource Locators) and tar files , while COPY  only works with local files. 



**difference between CMD and ENTRYPOINT** 

+ CMD defines the default command or argumentts that will run when a container starts . It will be overriden that is if you specify a command when running the container , it will replace the CMD command specify in your dockerfile Whereas 

+ ENTRYPOINT ;sets the main command that always runs when the container starts . You can pass additional arguments but Entrypoint will not be overriden . This is good when you want the container to always runs on a specific command 



`9:25 pm est `




**DOCKER IMAGE COMMANDS** 

`docker build -t "image name" .` or `docker build -t "image name" "path-to-dockerfile` :This will build a docker image from your dockerfile .This command will work if you are in the location of the dockerfile . -t image name = tag ,.This means you are tagging the name with a name e.g `docker build -t myapp1 .`
. :The dot specifies the build context in this case it means the `current directory`

`docker images` : This shows you all docker images in your local environments or system

`docker run -d -p 8000:8000 `docker image`` : This will start a docker container from your docker image (deploying your application)

`docker tag <image-id> <repository-name>:<tag>` e.g docker tag myapp1 myrepo/myapp:latest 

`docker rmi <image-id>` : This will remove docker image and note an image that is used by a stop container can't be removed using this command you will need to force remove 

`docker rmi -f <image-id>`: This will force remove a docker image that is in used by a container 

` docker push <repository-name>:<tag>` e.g docker push myrepo/myapp1:latest 

`docker pull <repository-name>:<tag>` This will pull a docker image from a registry 

`docker inspect <image-id>` : This gives you more information about a docker image and its good for troubleshooting image issues

`docker history <image-id>` : This will show you the image history including its layers 


**TABLE FOR DOCKER IMAGE COMMANDS*** 

# Docker Image Commands Summary

| **Command**                                 | **Description**                             |
|---------------------------------------------|---------------------------------------------|
| `docker images`                             | List all Docker images on the system        |
| `docker build -t <name> <path>`             | Build an image from a Dockerfile            |
| `docker tag <image-id> <repo>:<tag>`        | Tag an image with a new name                |
| `docker rmi <image-id>`                     | Remove an image                             |
| `docker rmi -f <image-id>`                  | Force remove an image                       |
| `docker push <repo>:<tag>`                  | Push an image to a Docker registry          |
| `docker pull <repo>:<tag>`                  | Pull an image from a Docker registry        |
| `docker inspect <image-id>`                 | Inspect an image (detailed information)     |
| `docker history <image-id>`                 | Show the history of an image (layers)       |
| `docker save -o <file>.tar <image-id>`      | Save an image to a `.tar` file              |
| `docker load -i <file>.tar`                 | Load an image from a `.tar` file            |
| `docker search <image>`                     | Search for an image on Docker Hub           |
| `docker image prune`                        | Remove unused images (dangling images)      |
| `docker image prune -a`                     | Remove all unused images                    |
| `docker images -f dangling=true`            | List dangling (untagged) images             |
| `docker tag <old-image> <new-image>`        | Tag an image with a new name                |
| `docker rmi <old-image>`                    | Remove an old image after tagging           |





**COMMANDS FOR DOCKER CONTAINERS** 

1.  `docker run -d -p <host-port:container-port> <docker-image>` : This command starts a docker container from a docker image (deploying your application)

-d : Means run the container in detached mode (in the background)
-p : map to <host-port:container-port>
- it : Run the container interactively  (this good when you are testing)
--name <container-name> : This will give 

`example 1`: `docker run -d -p 8080:8080 myapp2`
`example 2`: `docker run -d --name <containername> -p 8080:8080 myapp`

2. `docker ps` : This list all running containers 
3. `docker ps -a` : This will list all containers including running and stopped containers 
4. `docker stop <container-id or container-name>`: This will stop a running docker container 
5. `docker start <container-id or container-name>` : This will start a stopped container 
6. `docker rm <container-id or container-name>` : This will remove a container . Note the container needs to be stopped first before you can remove it . 
7. `docker rm -f <container-id or container-name>`: This will force remove a running container. 
8. `docker logs <container-id or container-name>`: This will help you to view logs of a docker container (This is good for trouble shooting issues)
+ `docker logs -f <container-id or container-name>` : This will show you live updates of your docker logs
9. `docker exec <options> <container-id or container-name> <command>` ; This will allow you to run commands inside your running  container 
example `docker exec -it e94bcc35746b /bin/bash`
10. `docker inspect <container-id or container-name>` : This will show you detailed information about your container . 

11. `docker cp <host-path> <container-id> or <container-name>:<container-path>
example `docker cp text.txt e94bcc35746b:/tmp/`

12. `docker stats` : This will help you to view your container usage statistics for example ( CPU , Memory etc)

13. `docker stop $(docker ps -q)` : This will stop all running containers .Run this with caution 

14. `docker rm $(docker ps -a -q)`: This will remove all stopped containers 



| **Command**                                    | **Description**                                                              |
|------------------------------------------------|------------------------------------------------------------------------------|
| `docker run <options> <image-name>`            | Start a new container from an image.                                         |
| `docker ps`                                    | List all running containers.                                                 |
| `docker ps -a`                                 | List all containers (running and stopped).                                   |
| `docker stop <container-id or container-name>` | Stop a running container.                                                    |
| `docker rm <container-id or container-name>`   | Remove a stopped container.                                                  |
| `docker rm -f <container-id or container-name>`| Force remove a running container.                                            |
| `docker start <container-id or container-name>`| Restart a stopped container.                                                 |
| `docker logs <container-id or container-name>` | View logs of a container.                                                    |
| `docker logs -f <container-id or container-name>`| Follow live log updates from a container.                                    |
| `docker exec -it <container-id or container-name> <command>` | Execute a command inside a running container (interactive). |
| `docker inspect <container-id or container-name>` | View detailed information about a container.                                |
| `docker cp <host-path> <container-id or container-name>:<container-path>` | Copy files from host to container.                                          |
| `docker cp <container-id or container-name>:<container-path> <host-path>` | Copy files from container to host.                                          |
| `docker stats`                                 | View resource usage (CPU, memory, etc.) of running containers.               |
| `docker stop $(docker ps -q)`                  | Stop all running containers.                                                 |
| `docker rm $(docker ps -a -q)`                 | Remove all stopped containers.                                               |
| `docker pause <container-id or container-name>`| Pause all processes in a running container.                                  |
| `docker unpause <container-id or container-name>`| Unpause a paused container.                                                 |
| `docker restart <container-id or container-name>`| Restart a container (stop and start again).                                  |
| `docker kill <container-id or container-name>` | Forcefully stop a container immediately.                                     |
| `docker top <container-id or container-name>`  | Display running processes inside a container.                                |
| `docker attach <container-id or container-name>`| Attach to a running container (interact with it).                            |
| `docker rename <old-name> <new-name>`          | Rename a container.                                                         |
| `docker port <container-id or container-name>` | List port mappings for a container.                                          |
| `docker commit <container-id> <new-image-name>`| Create a new image from a container’s changes.                               |
| `docker events`                                | Get real-time events from the Docker daemon.                                 |
| `docker diff <container-id or container-name>` | Inspect changes to files or directories on a container’s filesystem.         |
| `docker update <options> <container-id or container-name>` | Update resource limits on a running container.                               |
| `docker wait <container-id or container-name>` | Block until a container stops and then print the exit code.                  |
| `docker history <image-id>`                    | Show history of an image.                                                    |
| `docker export <container-id or container-name>` | Export a container’s filesystem as a tar archive.                           |
| `docker import <tarball-file> <repository-name>`| Import a tarball to create a filesystem image.                               |
| `docker ps --filter <filter>`                  | Filter containers based on conditions (e.g., status, name, etc.).            |
| `docker volume ls`                             | List volumes.                                                               |
| `docker volume rm <volume-name>`               | Remove a volume.                                                            |
| `docker network ls`                            | List networks.                                                              |
| `docker network create <network-name>`         | Create a network.                                                           |
| `docker network rm <network-name>`             | Remove a network.                                                           |




**DOCKER HUB** 

Docker hub is basically Github for docker images 
github --> store code 
docker --> stores container images 
+ Docker hub is what we call a registry we can create repositories ---> Private or Public repositories 
+ Public repositories : Public images --> Anyone can pull the images without needing any credentials or require authentication 
+ Private repositories : Only you or your organisation or company can access it . Its used for , Internal app images , proprietary code and enterprise workloads
+ To access dockerhub : https://hub.docker.com 
+ You will need to create account 


**PUSHING IMAGES TO A REGISTERY ( DOCKER HUB AND ECR)**


`HOW TO PUSH A DOCKER IMAGE INTO DOCKER HUB`

Docker hub is a registry that helps you to save and manage your docker images .apart from docker hub they are other registries you can use for example ECR (elastic container registery) . 


+ Create a dockerhub account using the url : https://hub.docker.com 
+ Once account has been created , create a repository ( public or private)
+ on your command line (CLI) run the following command  `docker login` : 

It will provide you with a Browser url and a one time device confirmation code
open url on the browser it will ask for the confirmation code , copy it from the terminal and add it to the browser for authentication . see below 

Your one-time device confirmation code is: `SRLR-NLGW`
Press ENTER to open your browser or submit your device code here: `https://login.docker.com/activate`


`Waiting for authentication in the browser`…
`Login Succeeded`


+ Tag the image you want to push by running this command 

`docker tag <docker-image-name>:<latest> <dockerhub-username>/<dockerhub-repository>:<docker-image-name>

example : `docker tag myapp2:latest team4techsolutions/team4techsolutions:myapp2`

+ After tagging push the image to dockerhub using the following command 

`docker push <dockerhub-username>/<dockerhub-repository-name>:<docker-image-name>`

example : `docker push team4techsolutions/team4techsolutions:myapp2`



**HOW TO PUSH A DOCKER IMAGE INTO AMAZON ECR (ELASTIC CONTAINER REGISTRY)** 

+ Make sure to authenticate with AWS using iam roles and attached the following permissions (EC2InstanceProfileForImageBuilderECRContainerBuilds) or CLI (keys)
+ Open ECR on your aws account and click on create Repository . Select if you want to create a public or private repository 
+ Once repository has been created , click on the repository and at the top right you will see `View Push Commands` in yellow , click on it and follow the steps on how to push the docker image into ECR. 




**HOW TO INTERGRATE --> DOCKER WITH JENKINS

+ Download the following docker plugins ( docker , docker pipeline and  docker build steps) or you can install docker directly on the host server and it will work . 
+ add jenkins user to Docker group e.g `sudo usermod -aG docker jenkins` : this is for the jenkins user to be able to interact with the docker daemon by running docker commands .
+ Modify your jenkinsfile to have steps on how to build a docker image and step to push the docker image into a registry (ECR -Elastic container Registry)





**DOCKER COMPOSE ?**  

This is a tool you can use to define multi-container docker applications . It allows you to define services , networks , volumes required for your application in a single docker-compose.yml file .It can be used to start , or manage multiple containers at once 

starting 1 container (1 application (Monoliqthe Application))
micro-service architecture : each container will represent service 


**KEY COMPONENTS OF DOCKER COMPOSE**

**Service** : A service represents a container that is part of your application.Each service is defined in the compose file and can be started , stopped , and managed independently or as part of the entire application

**YAML FILE** (docker-cpmpose.yml) : This is the configuration file where you will define your applications services , networks , and volumes .This will be your blueprint for docker-compose 

**Project** : A collection of services define by a docker-compose.yml file .All containers are part of the same project by default.



Micro-service 

dockerfile :  docker image , 
dockerfile :  docker image 
dockerfile :  docker image 




**DOCKERFILE VS DOCKER-COMPOSE** 

+ A dockerfile is a txt file that helps you to define instructions to build a specific docker image .you define step by step instructions to create a container image . 

+ A docker-compose : when an image has been created already using a dockerfile , docker-compose helps to orchestrates multiple containers based on pre-built image or images built from dockerfile 


NOTE: To use docker-compose you need to install it . 

**Setting up Docker Compose** 

Installation follow this guide : https://docs.docker.com/compose/install/standalone/

`example of a docker-compose file `

version: '3'
services:
  service_name:
    image: myapp2
    build: .  # Use this to build from a Dockerfile
    ports:
      - "8080:8080"
    environment:
      - ENV_VAR=value
    volumes:
      - host-path:container-path
    networks:
      - network_name
networks:
  network_name:
    driver: bridge
volumes:
  volume_name:
    driver: local


`another example` 

version: "3.9"

services:
  web:
    image: calson1/team4tech-webapp:latest
    ports:
      - "8080:8080"
    depends_on:
      - db

  db:
    image: mysql:8
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: appdb
    volumes:
      - db_data:/var/lib/mysql

volumes:
  db_data:



when you have defined the various services in the docker-compose file and you want to build the services you will need to run the following command 

+ `docker-compose build` : This will build the services from the compose file you have specified 
+ `docker-compose up` : This will start all the services defined in he compose file .  you can use -d to run them in the background 
+ `docker-compose down` : This stops and remove containers , networks , volumes associated with the project 
+ `docker-compose ps`: This list all running containers 
+ `docker-compose up --scale <service-name>=<number>` This will scale your containers 




**DOCKER SWARM** 

This is a container Orchestration tool built into docker that enales you to manage a cluster of docker engines (hosts) as a single , unified entity called a Swarm. Docker Swarm allows you to deploy , manage and scale applications across multiple docker nodes (computers) ensuring high availability , load balancing , automated service discovery.

**KEY CONCEPTS OF DOCKER SWARM**

1. **Nodes**: is an instance of the docker engine participating in the swarm cluster .There are two types of nodes 

+ **Manager Node** : The manager node is responsible for managing the swarm , maintaining the cluster state , and scheduling services . Manager nodes handles orchestration and dispatch tasks to worker nodes 

+ **Worker Node**: Worker nodes executes the task (containerized workloads)  assigned to them by the manager nodes but does not participate in cluster management . 


2. **Services** : A service is a definition of the task that needs to be executed, including the Docker image, the number of replicas, network, and storage requirements. A service in Docker Swarm is like a running container that can be replicated across multiple nodes.

**There are two types of services:**

**Replicated Services:** You specify the number of container instances (replicas) you want to run.

**Global Services**: A global service runs one instance of the task on every node in the Swarm.


3. **Task:** : In the context of Docker Swarm, a task represents the smallest unit of work that can be assigned to a node in the Swarm. Tasks are typically Docker containers running specific services or applications. Docker Swarm manages tasks to ensure they are running on appropriate nodes based on the desired state defined by the user. 

4. **Raft Consensus**:Raft is a consensus algorithm used by Docker Swarm to manage cluster membership and state. It ensures that all Swarm manager nodes agree on the current state of the cluster and coordinate actions such as scheduling tasks and maintaining high availability. Raft ensures fault tolerance and reliability in Swarm clusters by maintaining a consistent and agreed-upon cluster state.

6. **Load Balancing:** : Docker Swarm provides built-in load balancing for services deployed across the cluster. When a service is exposed, Swarm automatically distributes incoming requests across all healthy containers that are running the service. This ensures that the workload is evenly distributed and that services remain accessible even if containers or nodes fail or are added/removed from the cluster.

7. **Overlay Network** : Overlay networks in Docker Swarm enable communication between containers running on different nodes in the Swarm cluster. They abstract away the underlying network infrastructure, allowing containers to communicate as if they are on the same network segment. Overlay networks support multi-host networking and are essential for connecting services and enabling seamless container-to-container communication across the Swarm cluster.



**Advantages of Docker Swarm**

1. + Docker swarm enables High Availability .Swarm ensures high availability by distributing tasks across multiple nodes and maintaining desired state. If a node fails, Swarm can reschedule tasks on other nodes to maintain service continuity.

2. + Docker Swarm supports Horizontal Scaling : Docker Swarm allows you to easily scale services up or down by adjusting the number of replicas. This can be done using simple CLI commands or through Docker Compose files.

3. + Docker Swarm is relatively easy to set up and configure. It integrates seamlessly with Docker, making it straightforward for users already familiar with Docker commands and concepts.

4. + Docker Swarm has an inbuilt Automatic load balancing . Swarm provides built-in load balancing for services. It automatically distributes traffic across available service instances, ensuring even distribution of requests and high availability.

5. + Docker swarm supports rolling Updates:  Swarm supports rolling updates, which allow you to update services gradually. This helps in minimizing downtime and allows for rollback in case of issues during deployment.

6. + It supports Service Discovery : Internal DNS: Swarm provides internal DNS for service discovery. Services within the Swarm cluster can easily locate and communicate with each other using service names.

7. + Docker Swarm is secured . 
+ It has Encryption: Docker Swarm provides built-in support for TLS encryption for securing communication between nodes and services.
+ Authentication and Authorization: Swarm mode includes role-based access control (RBAC) to manage access and permissions.




**Limitations of Docker Swarm** Vs Kubernetes 

+ Docker swarm has limited features when compared to kubernetes. Docker Swarm has fewer built-in features and integrations compared to Kubernetes. It may lack some of the advanced capabilities found in Kubernetes, such as complex scheduling policies and extensive customization options.

+ It has scaling concerns or Limits : While Docker Swarm can handle many nodes and services, it may not scale as effectively as Kubernetes in very large clusters. Kubernetes is generally preferred for extremely large or complex deployments due to its robust scalability features.

+ Docker Swarm lacks advanced scheduling and management. Swarm's scheduling capabilities are more basic compared to Kubernetes. It lacks advanced scheduling features such as `affinity, anti-affinity, and custom resource scheduling`.

+ . Fewer Third-Party Integrations
Ecosystem and Tools: Docker Swarm has fewer third-party integrations and ecosystem tools compared to Kubernetes. This can limit the flexibility and extensibility of your container management environment.

+ . Less Mature Community and Support
Community and Documentation: While Docker Swarm has a supportive community, Kubernetes benefits from a larger and more active community, extensive documentation, and a broader range of enterprise support options.

+ . Limited Support for Stateful Applications
Stateful Applications: Docker Swarm's support for stateful applications and persistent storage is more limited compared to Kubernetes. Kubernetes offers more advanced options for managing stateful applications through StatefulSets and dynamic volume provisioning.

+ . Network and Service Discovery Limitations
Network Complexity: Docker Swarm's networking capabilities are less advanced than Kubernetes. Kubernetes offers more sophisticated networking and service discovery features through its CNI (Container Network Interface) plugins and service mesh integrations.

+ . No Native Support for Custom Resource Definitions (CRDs)
Custom Resources: Docker Swarm does not support custom resource definitions (CRDs), which are used in Kubernetes to extend the API and manage custom resource types.

+ . Limited Native Monitoring and Logging
Monitoring and Logging: Docker Swarm does not include native monitoring and logging solutions. While you can integrate third-party tools, Kubernetes has built-in support for monitoring and logging through tools like `Prometheus and Grafana`.

+ . Less Granular Control
Granularity: Kubernetes provides more granular control over the orchestration and management of containerized applications. Docker Swarm offers a simpler, less granular approach, which may not meet the needs of complex applications.

+. Lack of Built-In Service Mesh Support
Service Mesh: Docker Swarm does not have built-in service mesh capabilities like Kubernetes, which can limit its ability to manage service-to-service communication, observability, and security features.




Opensource - Master Node ( Control Plane ) ----> EKS 

**KUBERNETES ( ELASTIC KUBERNETES SERVICE )**




# KUBERNESTES 

**What is Kubernetes ?** Kubernetes is an opensource platform design to automate deployment, scaling and management of containerized applications. Its used for container orchestration.It provides efficient and flexible ways for orchestrating containers in a distributed system .

## KEY CONCEPTS OF KUBERNETES  or ARCHITECTURE 

1. **Cluster** : 

This is simply a set of nodes (computers , machines , ec2 instances) that run your containerized applications.The cluster is managed by a control plane (Master Node) manages the orchestration and management of the containers in the nodes (ec2,computers)

2. **Master Node** : 

The master node ( or control plane) its the node (ec2 or computer) responsible for managing the kubernetes cluster. It includes components like ( API server , Controller Manager , Scheduler , and etcd [a distributed key-value store for cluster state])

3. **Worker Nodes** : 

This is a node or ec2 instance where your containers are actually running . Each worker node runs a container runtime (e.g docker or containerd) and each of this worker nodes also have a set of kubernetes components like kubelet (which communicates with the master) and kube-proxy ( which handles networking)




4. **Pod** :  

This is the smallest deployable unit in kubernetes, its a group of one or more containers that share the same network , the same namespace and storage. Pods are used to run applications and services 

5. **Service** : 

A service is simply a stable network endpoint that is used to expose pods .Pods are temporary while services are stable  . A service simply helps route traffic to your pods that is it provides a stable endpoint for accessing the pods and load balances traffic across the pods . 

6. **Deployment** : 

A deployment manages pods for you - you will manage your pods through deployment 
This is a way on how we want our pods to be deployed which manages the set of replica pods .it provides declarative updates of pods and ensures that the desired number of replicas setup by the user is running at all times.
A deployment = Pod + Scaling + Self-heal + Updates 

`What does a deployment does` 

+ Create pods
+ Restart pods 
+ Scale pods up and down 
+ Perform  updates ( e.g rolling updates , recreate , blue green deployment , Canary deployments )
+ Roll Back 


7. **ReplicaSets**  : 

A ReplicaSet ensures that a specified number of `pod replicas are running at any given time`. It is often used by deployments to maintain the desired number of pod replicas.
e.g when you deploy an application in a pod you can choose to have 3 pods running the same application . You can use a replicaset to enforce that at all times 3 pods should be running , If a pod dies , the replicaset creates a new pod to make sure we have at times 3 pods 


8. **StatefulSets** : 

StatefulSet is used to manage stateful applications that require persistent storage and stable network identities. It provides features like stable hostnames and ordered deployment.
These is a way to deploy and manage stateful applications that needs the following 

+ Stable pod names 
+ Stable network identity 
+ Persistent storage that sticks to each pod 
+ Ordered start up and shutdown 

e.g Its good to deploy databases and stateful systems 

9. **ConfigMaps and Secrets** 

ConfigMaps and Secrets are used to manage configuration data and sensitive information e.g passwords , api keys , access keys etc, respectively. They provide a way to inject configuration data into containers.
+ Config maps are good to store plain configuration data for example ( URLS , ports , feature flags , environment names , config files ) but not good to store `Password or keys` 

10. ***Persistent Volume (PV) or Persistent Volume Cliam (PVC)**

 . These are used to manage storage in Kubernetes . Persistent Volume (PV) represents the storage resources . Persistent Volume Claim (PVC) this is the request pods are going to make to resources (volume).

+ Pods are Ephemeral in nature -- which means pods die easily --> when a pod dies it file system is gone so this means any data or databases , uploads ,logs etc must survive restarts 

This is where Persistent Volume Comes in 


- Persistent Volume (PV): This ensures that if our pod dies we will have our data (`EBS- Volume 50 MBS`)----> 5MBS 
- Persistent Volume Claim (PVC): This is the request made by pods to get storage resources from Persistent Volume (PV) 


11.  **Namespace**; *

Names spaces are used in Kubernetes to isolate or divide cluster resources between multiple users , teams , projects .They provide a way to organise and manage your resources within a cluster

Note a cluster comes with a default names space and you can create different names spaces ,
look at a namespace as 

Cluster = Office Building 
Namespace = seperate offices / floors
Teams or apps = work inside their office 




12. **Ingress** : 

Ingress manages external access to services within the cluster typically `http or https traffic`. It provides ways to configure load balancing and routing of incoming traffic to your services in the kubernetes cluster

Why is Ingress important 

+ Without ingress , every service needs its own load balancer and this can become so expensive 
+ Ingress helps to consolidate multiple services behind a single load balancer
+ it has clean and simple URLs but without ingress there is No URL-based routing 
+ It has centralized TLS management but without Ingress it makes it harder to manage 


13. **Network Policies** : 

Network policies define how pods communicate with each other and with external resources. They provide security controls for network traffic within the cluster.

Look at network policies in kubernetes as 

`NetworkPolicies = Firewall rules for pods`  : just like we have seen in ec2 instances 

14. **Helm** : 

Helm is a `package manager` for Kubernetes that allows you to define, install, and manage applications using `Helm charts`. It simplifies the deployment and management of complex applications.

Just like other package managers we have already seen in the course 

Helm = like other package manages like apt / yum / npm / brew / nugget , chocolatey etc

Helm Charts = Templates that we can use to deploy or manage resources in our kubernetes cluster 



## Benefits of Kubernetes

+ `Automatic Scaling` : Its easy to scale . it can scale up and down based on traffic or demand . It supports horizontal (application level) and virtal scaling (container)

+ `Highly available` by making your application fault tolerant. Ensures that applications remain available and operational even in the event of hardware or software failures by redistributing workloads and rescheduling failed pods.It supports loadbalancing which helps to distribute traffic across multiple services making your application reliable and performing well

+ `Kubernetes has a self healing capability.` Your control plane( Master node) will reschedule or replaced failed containers to healthy nodes to always ensure it has your desired state .The control plane uses  health checks to continously monitor the health of containers and restarts or replace unhealthy ones.It can restart crashed containers , it replaces failed pods , if a node (computer) dies it can reschedule the workload to another node 

+ `It supports Declarative Configuration`. It Uses `YAML or JSON` files to define the desired state of applications, making it easier to version control, review, and manage configurations.

+ `It enhances security`. It supports Role-Based Access Control (RBAC) which Provides fine-grained access control to resources based on user roles and permissions.

+ `It has Zero Downtme Deployments` : You can deploy new versions of your application without outages 
kubernetes has different deployment strategist such as `Rolling Updates` , `Canary Deployment` , `Blue - Green Deployment strategies` and with these strategies its easy to roll back . 

+ `Kubernetes is Portable` : It can run the same application 
across different environments (on-premises, cloud providers, hybrid setups) without modification.
and there is no Vendor lock-in 


**USE CASE OF KUBERNETES** 

+ **Kubernetes is good for MICRO-SERVICE ARCHITECTURE**  .It provides good service management. it is ideal for managing microservices, allowing developers to deploy, scale, and manage individual services independently.It also supports and manages Service Discovery and Loadbalancing. 

+ **Continous Integration and Continous Deployment (CI/CD)** : We can Integrates with CI/CD tools to automate the build, test, and deployment processes, ensuring faster and more reliable software delivery.

+ **Hybrid and Multi-Cloud Deployments** : Enables deployment across multiple cloud providers and on-premises environments, supporting hybrid and multi-cloud strategies and it also supports or Provides high availability and fault tolerance across different regions and cloud providers.



Cluster -----> Control Plane (Master Node) ( Api server ) , Controller Manager ( kube controller manager) , Scheduler (kube scheduler) , etcd (distributed key value store) -----> worker node (kubelet , kube-proxy , container runtime - docker or containerD )




END NEXT CLASS MONDAY 


# KUBERNETES ARCHITECTURE 


## MASTER NODE 

Node in is simply a computer (EC2)
A master node is one of the nodes in your kubernetes cluster. A master node is also known as a control plane.Its responsible for managing the kubernetes cluster. It handles the overall cluster management , including scheduling , scaling , and maintaining the desired state of the application . The master node has very important components to help it in the management of the cluster . 

**Components of the Master Node (Control Plane)** : 

1. Api server :

This is the central management of the kubernetes cluster. The Api server exposes the kubernetes API , Which is the main entry point or which helps users or other applications to interact with the kubernetes cluster . 

*Responsibilities of the API SERVER* 

+ The api server Handles RESTful API requests for creating, updating, retrieving, and deleting Kubernetes resources (pods, services, deployments, etc.).
+ it Acts as the gateway between users, external applications, and the control plane.
+ It Validates and processes API requests and updates the etcd store with the latest state.
+ It communicates with other components of the control plane and worker nodes.(kube proxy)

2. Scheduler :

The scheduler is responsible for assigning pods to worker nodes based on certain factors like resource availability and constraints .The scheduler gets this information from the cluster state which is stored in etcd . It ennsures that pods are placed on nodes that meet their resource and configuration requirements.

*Responsibilities of the Scheduler*

+ Pod scheduling :  Evaluates pod requirements (CPU, memory, etc.) and schedules them on suitable nodes.
+ Scheduling Policies : Considers factors like node affinity, taints/tolerations, and resource requests/limits when making scheduling decisions.


3. etcd : 

etcd is a distributed key-value store that serves as the source of truth for the cluster’s state and configuration.It Ensures that the state of the cluster is accurately maintained and accessible.

*Responsibilities of ETCD* 

+ iT Stores all Kubernetes configuration data, such as the state of pods, services, deployments, and other resources
+ it Provides consistency and durability of data across the cluster.

4. Controller Manager (Kube-controller-manager)

 The controller manager runs a set of controllers that ensure that your kubernetes cluster always has the desired state maintained .If the controller manager discovers a change in the cluster it tries to remediate (fix) the change to match your desired state . 

**There are different types of controller managers*

+ Replication controller : This ensures that the number of pods replica are always available and running 
+ Deployment controller ; This manages deployment updates and rollbacks 
+ Node Controller : This manages the status of your NODES (computers , ec2) and handles any node failures
+ Job controller  : This manages the execution of batch jobs 
+ Service Controller : This controls the services in your cluster 
+ Cronjob Controller : This is responsible for running scheduled task , creating jobs ,managing job executions etc for your kubernetes clustern
+ Statefulset Controller : This manages statefulset resources(applications). a stateful application is an application that requires storage(database) that requires steable and persistent storage 
+ Endpoint controller : It manages endpoint objects in your kubernetes cluster , which tracks the network of pods associated with a particular service .In other words it ensures that the service has up-to-date information about which pods (IP addresses) should receive traffic for that service.
+ Namespace controller : Its responsible for managing namespaces such deleting name spaces , graceful cleanup (delete) , create a namespace .




## WORKER NODE : 
This is where kubernetes runs it workloads , and this work loads runs in containers and the containers runs in a pod and the pods runs on a node (ec2) and all these are managed by the master node . The worker node has components that helps it to manage this workload . 
+ A kubernetes cluster can have multiple worker nodes can be managed by one or more control planes (master node)

**KEY COMPONENTS OF A WOKER NODE** 

A worker node in Kubernetes runs three key components that are responsible for the functioning of the containers within the cluster:


1. Kube Proxy (networking)
2. Kubelet (primary node agent )
3. Container Runtime (Docker and ContainerD) : Container Management


1.  *Kubelet*: 
This is the core (main) agent that runs on every worker node on your kubenetes cluster
It is responsible for ensuring that the containers in Pods (the smallest deployable unit in Kubernetes) are running as expected. Kubelet interacts with the control plane (Master Node) (usually the API Server) and takes care of managing and maintaining the desired state of the node.

**Responsibilities or Functions of the Kubelet**

+ It helps in pod lifecyle management.Kubelet makes sure that the containers inside the pods are running as per the pod specifications (YAML manifests). If a pod is created or scheduled by the control plane (master node), the Kubelet ensures that the pod is running on the node.

+ Its also responsible for Health Monitoring. Kubelet regularly checks the health of pods running on the node. If a pod or container crashes or fails, Kubelet reports this back to the control plane (master node), which can then reschedule the pod to another node.

+ It helps in communication with the Master Node. Kubelet continuously communicates with the control plane’s API Server to receive the desired state for pods (e.g., scheduling information, configuration updates). It sends periodic status updates about the pods and node back to the control plane.

+ Pod Specifications Handling: Kubelet reads the pod specifications (YAML files) to know what needs to be deployed and how. It can also pull the necessary container images, set up volumes, and configure networking for the pods.

+ Container Runtime Management: Kubelet works with the container runtime to manage the lifecycle of containers. This includes starting, stopping, and restarting containers based on the state defined by Kubernetes.


Lifecyle of Kubelet (agent)

 Api server (control plane) sends instructions to the kubelet on the worker node ------> Kubelet takes the request checks the specifications and ensures that the requirements for example the number containers you want to run are actually running.-----> It communicates with the container runtime to start the containers and if you want to it stops the containers .-------> The kubelet after executing the request continues to monitor the health of the containers and reports back to the control plane . 


2. Kube-Proxy 

This is the network proxy running on each node in the Kubenetes cluster .It is responsible for ensuring that networking rules are properly set up so that the communication between services and pods happens correctly. It also implements various forms of load balancing for network traffic targeting a service.

**Key Responsibilities or Functions of a Kube Proxy* 

+ It helps in service discovery and routing. Kube-Proxy helps direct traffic to the appropriate pods based on services. When a service is created, Kube-Proxy ensures that network rules are set up to route incoming traffic to the appropriate backend pods.

+ Load Balancing: Kube-Proxy implements load balancing at the network layer. It distributes traffic across all available pods that match the service's selector. For example, if there are multiple pods behind a service, Kube-Proxy ensures the traffic is balanced across them.

+ Network Rule Management: Kube-Proxy maintains network rules using iptables, ipvs, or other methods (depending on the configuration). These rules ensure that the traffic intended for a Kubernetes service is correctly forwarded to one of the service’s pods.

+ Cross-Node Communication: Kube-Proxy is responsible for ensuring that traffic between different nodes is properly routed so that any pod can communicate with any other pod in the cluster, regardless of their physical location.


3. Container Runtime : 

The container runtime is the software that runs and manages the lifecycle of containers on a worker node. Kubernetes does not directly manage containers; instead, it uses the container runtime to handle container operations such as pulling images, starting containers, stopping containers, and restarting them if needed.
Kubernetes supports many runtime with DOCKER and CONTAINER D as the most common . 

*Some Responsibilities or Function of container run time ( docker or containerd)*

+ Container Lifecycle Management: The container runtime is responsible for creating, running, and managing containers on the node. It ensures that containers run with the right resources (CPU, memory, network, etc.).

+ Image Management: The container runtime pulls container images from container registries (such as DockerHub or a private registry) and stores them locally on the worker node.

+ Container Execution: Once the image is pulled, the runtime creates and runs containers according to the instructions provided by the Kubelet.

+ Resource Isolation: Container runtimes manage the resource isolation between containers using Linux kernel features like cgroups and namespaces. This ensures that containers have the necessary CPU, memory, and network resources without conflicting with each other.

+ Monitoring and Reporting: The container runtime reports the status of the running containers to the Kubelet, allowing Kubernetes to maintain an updated view of the container's health and state.



## PODS # 

This is the smallest deployable unit in kubernetes, its a group of one or more containers that share the same network , the same namespace and storage. Pods are used to run applications and services .
A pod can run a single container and its considered a `single container pod` and it can run multiple containers known as `multi-container pod` . Containers in a pod shares the same namespace , network , volume and resources . 

**In Kubernetes WHY PODS instead of Containers ?** 

Kubernetes uses pods to abstract(run) away the complexity of managing individual containers. Pods group together closely related containers to simplify their networking, storage, and lifecycle management. Pods provide an extra layer of abstraction over containers and allow Kubernetes to schedule and manage applications efficiently.

**Pod Characteristics** 

1. Single or Multiple Containers:

*Single-container Pod* : Most pods run a single container and are the most common type. The pod wraps the container, which simplifies networking and storage concerns.

*Multi-container Pod*: Sometimes, a pod may contain more than one container, often in cases where you need tightly coupled containers that must share the same resources (e.g., logging or proxy sidecar containers).

2. Pod Lifecycle: 

Pods goes through a life cycle phase. 

+ Pending : The pod has been accepted by the Kubernetes system, but one or more of the containers has not yet been created.
+ Running : The pod has been bound to a node, and all containers have been created. At least one container is running
+ Succeeded : All containers in the pod have successfully completed execution (exited).
+ Failed : All containers in the pod have terminated, and at least one container has terminated in failure.
+ Unkown : The pod's state cannot be obtained, likely due to an issue with communication with the node.

3. Pod Networking:

Each pod gets its own unique IP address in the cluster, allowing containers within the pod to communicate with each other using localhost. Pods can communicate with other pods or services in the cluster by using their internal IP addresses or DNS names.

4. Pod Storage: 

Pods can have volumes (storage) attached to them. These volumes are used for persistent or shared storage between the containers in the pod. They can be local to the node or backed by cloud storage systems (like Amazon EBS or Google Persistent Disk).



**POD components** (what makes up a pod )

+ Container or containers : These are the actual application or services running in the pod . 
+ Storage (Volume)
+ Networking 
+ Pod specifications : You can define pod specification using YAML /JSON files for the desired state such as which containers to run , how many replicas to create , and what resources the containers need . 

`example of  YAML file to define the creation of a pod`

 apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  containers:
    - name: nginx-container
      image: nginx:1.19
      ports:
        - containerPort: 80


` apiVersion` : This is the version of the kubernetes api to use (v1 is for basic core (important) resources like pods)
`kind` : This specifies the kind of object you want to create in this case a POD 
`metadata` : These are labels or annotations you want to give your pod for example , name and other labels. 
`spec` : This is specification and it defines the desired state of the pod , including its containers and their configurations 


**POD USE CASE** 

1. Single container pods : This is the most common use case , where a pod contains a single container which this container represents a micro-service e.g webserver , database 

2. Multi Container pod : Useful when you need tightly coupled containers that work together. An example is a primary container running a web server and a secondary container acting as a logging sidecar.


**Pod Lifecycle and Restart Policies:**

Pods have a fixed lifecycle and are considered ephemeral. Once a pod is terminated, it cannot be resurrected. Kubernetes provides different restart policies to manage pod failures:

*Restart Policies:**

+ *Always*: Containers in the pod are restarted automatically if they fail. This is the default policy for most pods
+ *OnFailure*: The pod's containers are restarted only if they exit with a failure.
+ *Never*: Containers in the pod are never restarted, even if they fail.

**What controllers helps to Manage or Deploy Kubernetes PODS** 

*Controllers & Pod Management*

Pods are typically managed by controllers 

1. `Deployment (controller manager)` : This Manages the desired number of pod replicas, ensuring pods are replaced when they fail or need updates.

`example of deploying a pod using deployment controller manager `

apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment  # The name of the deployment
  labels:
    app: nginx
spec:
  replicas: 3  # Specifies the number of pod replicas to be maintained
 
    
2. `Replicaset` : It Ensures that a specific number of identical pods are running at all times. 
3. `StatefulSet`: Manages stateful applications with unique pod identities and persistent storage.
4. `DaemonSet`: Ensures that a specific pod runs on all (or a subset of) nodes.
5. `job/CronJob`: Manages pods that perform specific tasks (e.g., batch jobs or scheduled jobs)


**POD Scaling** 

Scaling in Kubernetes usually happens through `ReplicaSets` Or `Deployment`
The type of scaling used in Kubernetes is called 

+ **Horizontal Pod scaling or autoscaling** :  

Increases or decreases the number of pod replicas to handle varying workloads. For example, you can run more pod instances of a web application during peak traffic times.The command to increase or scale pods in a cluster is 

`kubectl scale deployment <name-of-deployment> --replicas=5`


+ **Vertical Pod Scaling** : 
Vertical pod scaling handles the scaling of your resources in the pod ( CPU , MEMORY)


**Pod Health Checks (Probes)** 

Kubernetes supports health checks (also known as probes) to ensure the proper functioning of pods:

1. *Liveness probes* : Kubernetes uses this to Determine if the pod is alive. If the probe fails, Kubernetes kills the pod, and it may be restarted based on the restart policy.

2. Readiness Probes : Determine if the pod is ready to receive traffic. If the probe fails, the pod will not be added to the service's pool (group) of endpoints.

`You can define this probes in a YAML`

livenessProbe:
  httpGet:
    path: /
    port: 8080
  initialDelaySeconds: 3
  periodSeconds: 5

readinessProbe:
  httpGet:
    path: /ready
    port: 8080
  initialDelaySeconds: 3
  periodSeconds: 5



**Pod Limitations or Disadvantages** 

1. *Pods are Ephemeral in Nature* : 

 Pods die quickly , which means pods are designed to be temporary , if a pod dies , Kubernetes may creat a new pod , but the old pod can not be resurrected . 

2. *Pods have Single IP address* :Though this simplifies networking where multiple containers in a pod can share the same network and namespace it limits security  

3. **Pods have limitation in scaling* : Pods themselves cannot be scaled directly. Instead, higher-level controllers like Deployments and ReplicaSets are used to manage pod replication.


**Advanced Concept of Pods or Pod Management**

1. **Pod affinity and Anti Affinity**:

 This controls where pods are scheduled in relation to other pods. For example, you can ensure that pods are placed on the same or different nodes for availability or performance reasons.

2. **Taints and Tolerations** : 

*`Taints`*  : A taint is applied to a node and marks that node as unsuitable for general-purpose pods unless they can tolerate the taint. Taints effectively repel pods from being scheduled on the node, unless the pod has the appropriate toleration.

`Use Case`: Reserving certain nodes for specific workloads (e.g., GPU-intensive applications, high-memory tasks, or production workloads).

`Syntax:` A taint is defined by three fields: key, value, and effect.

Effect: There are three possible effects of taints:

+ NoSchedule: Pods that don’t tolerate the taint won’t be scheduled on the node.
+ PreferNoSchedule: Kubernetes will try to avoid placing pods on the node, but it's not guaranteed.
+ NoExecute: Existing pods that can’t tolerate the taint are evicted from the node, and new pods won’t be scheduled on it.

Command to apply a taint : `kubectl taint nodes <node-name> key=value:NoSchedule`



`Tolerations` : A toleration is applied to a pod, allowing it to be scheduled on a node that has a matching taint. Tolerations work hand-in-hand with taints: while taints repel (deny) pods from nodes, tolerations allow pods to be scheduled on those nodes by declaring that the pod can "tolerate" the taint.

`example of a toleration template`:

apiVersion: v1
kind: Pod
metadata:
  name: my-pod
spec:
  containers:
  - name: nginx
    image: nginx
  tolerations:
  - key: "key"
    operator: "Equal"
    value: "value"
    effect: "NoSchedule"

3.**Pod Disruption Budget** : 

PDBs ensure that certain minimum numbers of pods remain available during disruptions (e.g., during node upgrades or scaling events).

4.**Sidecar Containers** : 
A pattern where a secondary container in a pod performs a complementary task, such as logging or proxying, to support the main container.
example : Webapplication running as a container and another container running for logging or for proxying (HA-proxy)




 # SERVICE  OR SERVICE DISCOVERY 

A service is a abstraction that defines logical set pods and policies for accessing . A service simply helps route traffic to your pods that is it provides a stable endpoint for accessing the pods and load balances traffic across the pods . 

# What is a Service in Kubernetes ? 
+ A service provides a way to expose an application running on a set of pods as a network service 
+ Services are going to automatically load balance access across the set of pods matching the service selector 


# Why Do we need a service in Kubernetes ? 

+ Pods are empheral in nature (dies quickly) and can be re-created, rescheduled , or pods can also scale at anytime which means their ip addresses can change
+ A service provides a stable interface (IP and or DNS) to ensure that clients or other services can always reach the correct set of pods 



**KEY CONCEPTS OF A SERVICE** 

1. Selector : 

A services uses a selector to define which pods it will route traffic to .The selector matches labels applied to the pods
+ `example` : A service with a `selector App=nginx` will forward traffic to all pods with the `label  


**SERVICE TYPES** 

These are the different methods on how we can configure our service to expose our application or services running on a pod 

1. **ClusterIp (Default)** 

+ This is the default service type in Kubernetes 
+ The clusterip expose the service on an internal ip address in the cluster
+ This will help to the service accessible only within or inside the cluster. This is good for internal communications between your pods 


2. **NodePort**
+ This will expose the service on each node's ip address at a static port (the-nodport)
+ This will make the service accessible from outside the cluster by requesting the node ip address on that port : 938.489.3853:8080
+ USE CASE : You want to expose the application externally but dont need a loadbalancer  .good for testing in dev environments 

3.**Loadbalancer** 
+ This will expose a service externally using cloud providers load balancers (app or network loadbalancers) .
+ This makes the service available outside the cluster with an external ip address 

4. **External-name service**
+ It maps an external DNS name , allowing us to expose the external services inside our kubernetes cluster . 
+ Use case : You can use this to make an external service e.g database hosted outside your cluster to be available within your cluster . 



**Servce without Selector** 
You can create a service without specifying a selector , you can define backend pods or external services manually . 


apiVersion:v1
kind: Service
metadata:
 name backend-service
spec
 ports 
  -port 80 
externalIps 
 - 123.456.4960


# Deployment 

This is one of the most common objects used that provides a declarative approach in updating applications and  managing the lifecycle replicated pods 
ensurin there is always the right number of pods running at all times . Maintining the desired state of pods .  

+ it offers declarative updates , you can declare the desire state of your application (number of replicas , image , port etc ) in the deployment YAML (Manifest file) now since we are using deployment , it will ensure that at all time the cluster matches the state of our deployment 

+ You can easily scale your application up and down when demand needs arises .You are simply increasing or reducing the pod replicas 
+ Rolling updates by default is used in deployment to ensure there is zero downtime when by gradually updating your application or replacing old pods with new ones  
+ With deployment its easy to rollback to previous versions since it uses rolling updates 
+ Deployment is self healing which means it can automatically replace pods that have issues or become of unresponsive making your application highly available


**DEPLOYMENT STRATEGY** 

These are the various options you can use to Deploy ,Update , Manage your applications in Kubernetes .
When using a deployment strategy there are many factors you can keep in mind ( down time , roll back , Testing )



1. **Rolling Updates** : 

+ This is when you Gradually replaces the old version of the application with the new version.
+ rolling updates in kubernetes ensures that the specific number of pods (desired replicas) are always available during the update
+ This is the default strategy in kubernetes and minimizes downtime.
+ Its easy to roll back 

2. **Recreate:**

+ Terminates all instances of the old version before starting the new version.
+ This can cause downtime, but it's suitable for applications that cannot run multiple versions simultaneously.

3. **Blue/Green Deployment:**

+ Involves running two identical environments: one (blue) for the current version and one (green) for the new version.
+ After the new version is tested and ready, traffic is switched from blue to green.
+ This allows for easy rollback by directing traffic back to the blue environment if needed.
+ While testing the new version end-users will be accessing the old version and once testing is done and okay you can now route traffic to the new version which will be accessible by end-users . You can keep the old version for roll back or you can decompose it .( Selector & Labels)

4. **Canary Deployment:**

+ Gradually rolls out or deploy the new version to a small subset of users before a full rollout (Geographical region). 
+ Allows for monitoring and feedback on the new version's performance, reducing risk.
+ A canary deployment requires using two almost identical ReplicaSets (PODS) – one for all active users and another rolling out new features to a small subset of users. Once confidence increases in the new version, you can gradually roll it out to the entire infrastructure. This process ends with all live traffic going to canaries until the canary version becomes the new production version.
+

**Implementation Tips:**

+ Use Deployments for managing the rollout process.
+ Configure readiness probes to ensure traffic is only sent to pods that are ready to serve.
+ Set resource limits to avoid overloading nodes during deployments.
+ Monitor deployments using Kubernetes metrics and logging tools for quick feedback ( Prometheus and Grafana)


**HOW TO CREATE EKS :**

Cluster service role:  Allow the Kubernetes control plane to manage AWS resources on your behalf. 

See how to create an EKS cluster using Terraform + Using the console 

When creating an EKS Cluster you require the following 

+ *Cluster Role* : 

a ClusterRole is a set of permissions that can be applied to resources across an entire Kubernetes cluster. It is part of Kubernetes Role-Based Access Control (RBAC) and allows you to define what actions (like get, list, watch, create, update, delete) can be performed on various resources (such as pods, deployments, services, etc.) within the cluster.

+ Node-group settings 


**HOW CAN WE CONNECT TO YOUR EKS CLUSTER** 

`aws eks --region <your-region> update-kubeconfig --name <your-cluster-name>`

`aws eks` : This specifies you are using aws commandline interface (eks - is the service name just like an s3)
`--region <your-eks-cluster-region>`: This is the region where the cluster is located or was created. 
`update-kubeconfig` : This updates the local kube-config file ,Kubectl is used to manage the cluster by sending api calls to the kubernetes cluster. The kube-config file cluster information or details , it has authentication information and also other settings for your kubernetes cluster 

`--name <your cluster name> : This specifies the name of your eks cluster 

**To authenticate with your EKS cluster you need to run the following command on the CLI**

`aws eks --region <your-region> update-kubeconfig --name <your-cluster-name>`

EXAMPLE `aws eks --region ca-central-1 update-kubeconfig --name development-cluster`


**Commands in Kubernetes**

Basic Commands 

`kubectl get nodes` :  This will show you all your worker nodes in the cluster 
`kubectl cluster-info`: This will give you information about your cluster (control plane endpoint and CoreDns Endpoints)
`kubectl get po or pods` : This will show you all your pods in the default namespace 
`kubectl get services or kubectl get svc ` : This will show us all our services in the default namespace 
`kubectl get deployments` : This will show you all your deployments in the default namespace
`kubectl get namespaces or kubectl get ns` : This will show you all the name spaces in your EKS cluster 
`kubectl get namespace <namespace-name>` : This will show you just that name space 

**Creating Resources**

`kubectl apply -f <filename>.yaml` : This will create your kubernetes resources in the yaml file ( these resources can be pods , services)
`kubectl run <pod-name> --image=<image-name>` : This creates a pod 
`kubectl create deployment <deployment-name> --image=<image-name>`: This will create a deployment 
`kubectl expose deployment <deployment-name> --type=loadbalancer --name=<service-name>` : This will create a service 

**Updating Resources** 

`kubectl apply -f <updated.file>.yml` : after updating the manifest file you can still run this command it will apply changes or update resources . it will only apply the changes from the manifest
`kubectl scale deployment <deployment-name> --replicas=<number>` : This command can scale up and down by adding or removing pods  e.g kubectl scale deployment nginx-deployment --replicas=3
`kubectl set env deployment/<deployment-name> <VAR-name>=<value>` : This will set environtal variables for your deployment example 
kubectl set env deployment/nginx-deployment environment=prod


**Delete Resources** 

`kubectl delete <resource-type> resource-name` : This will delete a resource
`kubectl delete pod <pod-name>` This will delete the pod 
`kubectl delete pods` : This will delete all pods in the default namespace
`kubectl delete pods --all -n <namespace>` This will delete all the pods in a specific namespace 

**Describing Resources**  : 
This decribing command is good for trouble shooting 

`kubectl describe pod <podname>` : This will show us more information about the pod and its good for trouble shooting 
`kubectl describe deployment <deployment-name> `: This will give you more information about the deployment 
`kubectl describe service <service-name>:`  This will give you more information about the service 

**Logs & Monitoring** 

`kubectl logs <pod-name>`
`kubectl logs -f <pod-name>`
`kubectl get events`

**Accessing the Kubernetes Shell**

`kubectl exec -it <pod-name> -- /bin/bash`
`kubectl exec -it <pod-name> -- /bin/sh`

**Configuration and Context Management**

`kubectl config current-context`
`kubectl config use-context <context-name>`
`kubectl config view`
`kubectl config view`


**Kubernetes Commands in Table format :**

**Pods Commands**

| Command                                           | Description                                                        |
|---------------------------------------------------|--------------------------------------------------------------------|
| `kubectl get pods`                                | List all pods in the current namespace.                            |
| `kubectl get pod <pod_name>`                      | Get details of a specific pod.                                     |
| `kubectl describe pod <pod_name>`                 | Describe details about a specific pod.                             |
| `kubectl delete pod <pod_name>`                   | Delete a pod.                                                      |
| `kubectl exec -it <pod_name> -- <command>`        | Execute a command in a running pod.                                |
| `kubectl logs <pod_name>`                         | Print the logs for a pod.                                          |
| `kubectl port-forward <pod_name> <local_port>:<remote_port>` | Forward local port to a pod.                             |
| `kubectl cp <pod_name>:<path_in_pod> <path_on_local_machine>` | Copy files from a pod to your local machine.                      |
| `kubectl attach <pod_name> -c <container_name>`   | Attach to a running container in a pod.                            |



**Nodes Commands**

| Command                                           | Description                                                        |
|---------------------------------------------------|--------------------------------------------------------------------|
| `kubectl get nodes`                               | List all nodes in the cluster.                                     |
| `kubectl describe node <node_name>`               | Describe details about a specific node.                            |
| `kubectl cordon <node_name>`                      | Mark a node as unschedulable.                                      |
| `kubectl uncordon <node_name>`                    | Mark a node as schedulable.                                        |
| `kubectl drain <node_name>`                       | Drain a node for maintenance.                                      |
| `kubectl top nodes`                               | Show resource usage (CPU/Memory) for all nodes.                    |


**Deployment Commands**

| Command                                           | Description                                                        |
|---------------------------------------------------|--------------------------------------------------------------------|
| `kubectl get deployments`                         | List all deployments in the current namespace.                     |
| `kubectl describe deployment <deployment_name>`   | Describe details about a specific deployment.                      |
| `kubectl create deployment <deployment_name> --image=<image_name>` | Create a new deployment.                                    |
| `kubectl delete deployment <deployment_name>`     | Delete a deployment.                                               |
| `kubectl scale deployment/<deployment_name> --replicas=<replica_count>` | Scale a deployment to a specified number of replicas.         |
| `kubectl rollout status deployment/<deployment_name>` | Monitor the status of a deployment rollout.                    |
| `kubectl rollout undo deployment/<deployment_name>` | Rollback a deployment to the previous version.                 |
| `kubectl autoscale deployment <deployment_name> --cpu-percent=<percentage> --min=<min_replicas> --max=<max_replicas>` | Autoscale a deployment based on CPU usage.                |
| `kubectl set image deployment/<deployment_name> <container_name>=<image_name>` | Update the image for a deployment container.                |


**Service & Networking Commands**

| Command                                           | Description                                                        |
|---------------------------------------------------|--------------------------------------------------------------------|
| `kubectl get services`                            | List all services in the current namespace.                        |
| `kubectl describe service <service_name>`         | Describe details about a specific service.                         |
| `kubectl expose deployment <deployment_name> --type=LoadBalancer --port=<port>` | Expose a deployment as a service.                            |
| `kubectl get endpoints`                           | List all endpoints in the current namespace.                       |
| `kubectl get ingress`                             | List all ingress resources in the current namespace.               |
| `kubectl port-forward <pod_name> <local_port>:<remote_port>` | Forward local port to a pod.                             |
| `kubectl create service clusterip <service_name> --tcp=<port>:<target_port>` | Create a ClusterIP service.                                |
| `kubectl create service nodeport <service_name> --tcp=<port>:<target_port>` | Create a NodePort service.                                 |
| `kubectl create service loadbalancer <service_name> --tcp=<port>:<target_port>` | Create a LoadBalancer service.                            |


**Namespace commands**

| Command                                           | Description                                                        |
|---------------------------------------------------|--------------------------------------------------------------------|
| `kubectl get namespaces`                          | List all namespaces in the cluster.                                |
| `kubectl create namespace <namespace_name>`       | Create a new namespace.                                            |
| `kubectl delete namespace <namespace_name>`       | Delete a namespace.                                                |
| `kubectl config set-context --current --namespace=<namespace>` | Set a default namespace for the current context.            |


**Api & Resource Discovery Commands**

| Command                                           | Description                                                        |
|---------------------------------------------------|--------------------------------------------------------------------|
| `kubectl api-resources`                           | List all API resources available on the cluster.                   |
| `kubectl api-versions`                            | List all API versions available on the cluster.                    |
| `kubectl explain <resource_type>`                 | Get detailed documentation for a resource type.                    |


**Trouble shooting commands**

| Command                                           | Description                                                        |
|---------------------------------------------------|--------------------------------------------------------------------|
| `kubectl describe <resource_type> <resource_name>` | Describe details about a specific resource for troubleshooting.     |
| `kubectl logs <pod_name>`                         | View logs of a specific pod.                                        |
| `kubectl logs <pod_name> -c <container_name>`     | View logs of a specific container in a pod.                        |
| `kubectl exec -it <pod_name> -- /bin/sh`          | Open an interactive shell inside a running pod.                    |
| `kubectl get events`                              | List events in the current namespace to debug issues.               |
| `kubectl top pods`                                | Show resource usage (CPU/Memory) for pods.                          |
| `kubectl get pod <pod_name> -o yaml`              | Get detailed YAML output of a pod's configuration.                  |
| `kubectl cp <pod_name>:<path_in_pod> <path_on_local_machine>` | Copy files from a pod to your local machine.                      |


****Role-Based Access Control Commands (RBAC)**

| Command                                           | Description                                                        |
|---------------------------------------------------|--------------------------------------------------------------------|
| `kubectl create role <role_name> --verb=<verb> --resource=<resource>` | Create a new role.                                               |
| `kubectl create rolebinding <rolebinding_name> --role=<role_name> --user=<username>` | Bind a role to a user.                                    |
| `kubectl get roles`                               | List all roles in the current namespace.                           |
| `kubectl get rolebindings`                        | List all role bindings in the current namespace.                   |
| `kubectl auth can-i <verb> <resource>`            | Check if the current user can perform a specific action.           |



**GENERAL COMMANDS**

| Command                                       | Description                                                        |
|-----------------------------------------------|--------------------------------------------------------------------|
| `kubectl get pods`                            | List all pods in the current namespace.                            |
| `kubectl get nodes`                           | List all nodes in the cluster.                                     |
| `kubectl get deployments`                     | List all deployments in the current namespace.                     |
| `kubectl get services`                        | List all services in the current namespace.                        |
| `kubectl get namespaces`                      | List all namespaces in the cluster.                                |
| `kubectl get all`                             | List all resources in the current namespace.                       |
| `kubectl get events`                          | List all events in the current namespace.                          |
| `kubectl get endpoints`                       | List all endpoints in the current namespace.                       |
| `kubectl get networkpolicies`                 | List all network policies in the current namespace.                |
| `kubectl create -f <yaml_file>`               | Create a resource from a YAML file.                                |
| `kubectl apply -f <directory_or_file>`        | Apply changes to a resource in a directory or file.                |
| `kubectl delete <resource_type> <resource_name>` | Delete a specific resource by name.                               |
| `kubectl delete namespace <namespace_name>`   | Delete a namespace.                                                |
| `kubectl describe <resource_type> <resource_name>` | Describe details about a specific resource.                     |
| `kubectl logs <pod_name>`                     | Print the logs for a pod.                                          |
| `kubectl exec -it <pod_name> -- <command>`    | Execute a command in a running pod.                                |
| `kubectl port-forward <pod_name> <local_port>:<remote_port>` | Forward one or more local ports to a pod.                    |
| `kubectl scale deployment/<deployment_name> --replicas=<replica_count>` | Scale a deployment to a specified number of replicas.         |
| `kubectl rollout status deployment/<deployment_name>` | Monitor the status of a rollout.                               |
| `kubectl rollout undo deployment/<deployment_name>` | Rollback a deployment to the previous version.                 |
| `kubectl get pv`                              | List all persistent volumes in the cluster.                        |
| `kubectl get pvc`                             | List all persistent volume claims in the cluster.                  |
| `kubectl create secret generic <secret_name> --from-literal=<key>=<value>` | Create a generic secret from literal values.                |
| `kubectl get configmaps`                      | List all config maps in the current namespace.                     |
| `kubectl get ingress`                         | List all ingresses in the current namespace.                       |
| `kubectl create namespace <namespace_name>`   | Create a new namespace.                                            |
| `kubectl create configmap <configmap_name> --from-file=<file_path>` | Create a config map from a file.                             |
| `kubectl patch <resource_type> <resource_name> --patch <json_patch>` | Update a resource with a patch.                               |
| `kubectl edit <resource_type> <resource_name>` | Edit a resource using the default editor.                         |
| `kubectl label <resource_type> <resource_name> <key>=<value>` | Add a label to a resource.                                     |
| `kubectl top nodes`                           | Show metrics for all nodes.                                        |
| `kubectl top pods`                            | Show metrics for all pods in the current namespace.                |
| `kubectl api-resources`                       | List all API resources supported by the server.                    |
| `kubectl explain <resource_type>`             | Get documentation of a specific resource type.                     |
| `kubectl cluster-info`                        | Display cluster information.                                       |
| `kubectl config view`                         | View kubeconfig settings.                                          |
| `kubectl drain <node_name>`                   | Drain a node in preparation for maintenance.                       |
| `kubectl cordon <node_name>`                  | Mark a node as unschedulable.                                      |
| `kubectl uncordon <node_name>`                | Mark a node as schedulable.                                        |
| `kubectl create role <role_name> --verb=<verb> --resource=<resource>` | Create a role.                                                  |
| `kubectl create rolebinding <rolebinding_name> --role=<role_name> --user=<username>` | Create a role binding.                                   |
| `kubectl get crd`                             | List all custom resource definitions (CRDs).                       |
| `kubectl create -f <crd_file>`                | Create a custom resource definition (CRD).                         |
| `kubectl cp <pod_name>:<path_in_pod> <path_on_local_machine>` | Copy files from a pod to your local machine.                 |
| `kubectl taint nodes <node_name> <key>=<value>:<effect>` | Taint a node to prevent scheduling.                           |
| `kubectl create service clusterip <service_name> --tcp=<port>:<target_port>` | Create a ClusterIP service.                                  |
| `kubectl create service nodeport <service_name> --tcp=<port>:<target_port>` | Create a NodePort service.                                  |
| `kubectl create service loadbalancer <service_name> --tcp=<port>:<target_port>` | Create a LoadBalancer service.                             |
| `kubectl create deployment <deployment_name> --image=<image_name>` | Create a new deployment.                                    |
| `kubectl autoscale deployment <deployment_name> --cpu-percent=<percentage> --min=<min_replicas> --max=<max_replicas>` | Autoscale a deployment.                                     |
| `kubectl get statefulsets`                    | List all StatefulSets in the current namespace.                    |
| `kubectl get daemonsets`                      | List all DaemonSets in the current namespace.                      |
| `kubectl auth can-i <verb> <resource>`        | Check if you have permission to perform a specific action.         |
| `kubectl get quota`                           | List resource quotas in the current namespace.                     |
| `kubectl apply -k <directory>`                | Apply a directory containing kustomization.yaml file.              |
| `kubectl diff -f <directory_or_file>`         | View differences between resources in a file and the live cluster. |
| `kubectl rollout history deployment/<deployment_name>` | View the rollout history of a deployment.                      |
| `kubectl wait --for=condition=available deployment/<deployment_name>` | Wait for a condition to be met (e.g., availability).        |
| `kubectl expose deployment <deployment_name> --type=LoadBalancer --port=<port>` | Expose a deployment as a service.                             |
| `kubectl run <pod_name> --image=<image> --restart=Never --port=<port>` | Run a pod with a specified image.                             |
| `kubectl attach <pod_name> -c <container_name>` | Attach to a running container in a pod.                          |
| `kubectl get roles`                           | List roles in the current namespace.                               |
| `kubectl get rolebindings`                    | List role bindings in the current namespace.                       |
| `kubectl get serviceaccounts`                 | List service accounts in the current namespace.                    |
| `kubectl get hpa`                             | List horizontal pod autoscalers.                                   |
| `kubectl rollout pause deployment/<deployment_name>` | Pause a rollout.                                                |
| `kubectl rollout resume deployment/<deployment_name>` | Resume a paused rollout.                                        |
| `kubectl auth reconcile -f <role_binding_file>` | Reconcile a role binding configuration to the current state.      |
| `kubectl annotate <resource_type> <resource_name> <key>=<value>` | Add an annotation to a resource.                                |



##################
September 27
##################

**What is a Manifest File in Kubernetes** 

In Kubernetes, a manifest file is a configuration file that defines the desired state of resources within a Kubernetes cluster. Manifest files are typically written in YAML or JSON and describe how a resource should behave and be configured, such as Pods, Services, Deployments, Ingresses, and more.

These files are used to declare the specification of a resource, and Kubernetes will work to ensure that the actual state of the cluster matches the desired state described in the manifest.


desired state : This is the configuration that you want 
actual state : This is the current state 


**What are some of the Key Elements in a Kubernetes Manifest File**

apiVersion: apps/v1 ------>  //This is apiversion being used 
kind: Deployment ----------> specifies or Defines the type of Kubernetes resource you want to create e.g Pod ,Deployment Service
metadata:------------------->specific tags or attributes you are giving your configurations ) for resources such as name ,namespace , labels 
  name: nginx-deployment
  labels:
    app: nginx
spec: ------------------>This specifies the desired state of the resources you want to create & its for the pod 
  replicas: 5 ------> Number of pods that should be running at all times 
  selector:--------> helps in service discovery 
    matchLabels:-----> This is how the service is going to discover the pod and route traffic to it ;need to match with selector in service
      app: nginx-v1  # Ensure this matches the labels in the template
  template: ------> This define the pod template .This will be used by controllers e.g deployment, replicasets to create new pods 
    metadata:
      labels:
        app: nginx-v1  # Correct the spacing
    spec: ------------> This is specifies the container resources you want to create 
      containers:
      - name: nginx-------> container name 
        image: nginx:latest----> image you will use 
        ports: -----------------> ports 
        - containerPort: 80------> this is the port the container listen on 
---
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  type: NodePort  # Capitalized the type
  ports:
  - port: 80
    targetPort: 80
    nodePort: 30000  # Optional: specify a nodePort if you want a specific port
  selector:
    app: nginx-v1  

1. *Apiversion:* it Specifies the API version for the resource you're defining e.g apps/v1
2. *Kind* : This is specifies or Defines the type of Kubernetes resource you want to create e.g Pod , Deployment , Service , Configmap etc 
3. *metadata* : This contains the metadata(specific tags or attributes you are giving your configurations ) for resources such as names , namespace , labels 
4. *Spec* : This specifies the desired state of the resources you want to create . This can vary depending on the kind of resource being created 



**Troubleshooting errors in Kuberenetes** 

CrashLoopBackOff : This indicates that the container is crashing repeatedly after being started and the common issues can be 

+ *Image pull issues*  : if the image is in a private repository then our node agent (kubelet) can have authentication issues to pull the image 
+ Application inside the container is crashing 
+ Missing Dependencies : The container might be missing env variables or database authentication etc 






Creat ec2 instance : 
setup security groups 
Create load balancer 
DNS--> team4techsolutions.com 


index.html deploy static web applications ( Apache webserver )

sudo apt install apache2 
html</> welcomehome to team



**HELM**  : This are simply package manager for kubernetes 

Helm is a package manager for Kubernetes that simplifies the deployment and management of applications on Kubernetes clusters. It allows you to define, install, and upgrade complex Kubernetes applications using pre-configured packages called Helm charts.

**Key Concepts of Helm**

**Charts**  

+ A Helm chart is a package that contains all the necessary Kubernetes resource definitions (YAML files like Deployments, Services, ConfigMaps, etc.) to deploy an application in a Kubernetes cluster.

+ Charts can be used to deploy anything from simple applications (like a web app) to complex systems (like databases or multi-component microservices).

**Releases** 

+ When you install a chart in a Kubernetes cluster, Helm creates a release. A release is an instance of a chart running in the cluster.
+ Multiple releases of the same chart can be created, each configured differently (for example, deploying the same app in different environments).

**Repositories** 

+ Helm charts are stored in chart repositories. A repository is a place where charts can be collected and shared, like DockerHub for Docker images.
+ You can use public repositories like Artifact Hub or create your own private repository.


**Helm Directory Structure**

my-chart/
  Chart.yaml          # Metadata about the chart (name, version, etc.)
  values.yaml         # Default configuration values for the chart
  templates/          # Kubernetes manifest files (e.g., deployment.yaml, service.yaml)
    deployment.yaml   # Kubernetes deployment template
    service.yaml      # Kubernetes service template

**Helm Commands**
| **Command**                                | **Description**                                                                                   |
|--------------------------------------------|---------------------------------------------------------------------------------------------------|
| `helm install <release-name> <chart-name>` | Installs a Helm chart in the Kubernetes cluster, creating a release.                              |
| `helm list`                                | Lists all Helm releases in the Kubernetes cluster.                                                |
| `helm upgrade <release-name> <chart-name>` | Upgrades an existing Helm release to a new version or configuration.                              |
| `helm uninstall <release-name>`            | Uninstalls a Helm release and deletes associated Kubernetes resources.                            |
| `helm rollback <release-name> <revision>`  | Rolls back a release to a previous revision.                                                      |
| `helm search repo <chart-name>`            | Searches for Helm charts in repositories.                                                         |
| `helm package <chart-directory>`           | Packages a local Helm chart into a `.tgz` archive.                                                |
| `helm lint <chart-directory>`              | Lints (validates) a Helm chart for potential issues.                                               |
| `helm install <release-name> <chart-name> --dry-run --debug` | Simulates a Helm installation/upgrade without applying changes.                  |
| `helm history <release-name>`              | Displays the revision history of a Helm release.                                                  |
| `helm show chart <chart-name>`             | Shows metadata about a Helm chart.                                                                |
| `helm show values <chart-name>`            | Shows the default values of a Helm chart.                                                         |
| `helm create <chart-name>`                 | Creates a new Helm chart with a basic template structure.                                         |
| `helm install <release-name> <chart-name> --set <key>=<value>` | Installs a Helm chart with custom values using `--set`.                              |
| `helm install <release-name> <chart-name> -f <values-file>` | Installs a Helm chart with a custom values file.                                  |
| `helm template <release-name> <chart-name>` | Renders chart templates locally without installing them.                                          |
| `helm repo add <repo-name> <repo-url>`     | Adds a Helm chart repository to your local environment.                                           |
| `helm repo update`                         | Updates the local repository cache with the latest charts from all repositories.                  |
| `helm repo remove <repo-name>`             | Removes a Helm chart repository.                                                                  |
| `helm version`                             | Displays the version of Helm currently installed.                                                 |
| `helm get manifest <release-name>`         | Shows the Kubernetes resources created by a Helm release.                                         |
| `helm get all <release-name>`              | Retrieves all information about a Helm release (used for debugging).     




Note: There are many ways we can route traffic inside and outside our Kubernetes cluster . One of the most efficient approach to route traffic is will be through an `ingress rule` . 


**Difference between Service (LoadBalancer) and Ingress in Kubernetes or Benefits**

| Feature                | Service (LoadBalancer) | Ingress |
|------------------------|------------------------|---------|
| One Load Balancer per service | ❌ Yes            | ✅ No    |
| Path-based routing     | ❌ No                  | ✅ Yes   |
| Host-based routing     | ❌ No                  | ✅ Yes   |
| TLS termination        | ❌ Limited             | ✅ Yes   |
| Cost-efficient         | ❌ Expensive           | ✅ Cheaper |



**Installing Helm on Linux**

`curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash`

+ verify the installation by running 

`helm version`


**Installing Helm on Windows**

+ `Install Chocolatey (if not installed)`

Set-ExecutionPolicy Bypass -Scope Process -Force; `
[System.Net.ServicePointManager]::SecurityProtocol = `
[System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

+ Install helm using Choco

`choco install kubernetes-helm`

verify installation 

`helm version`



**Deploying NGINX Ingress Controller using Helm**

https://kubernetes.github.io/ingress-nginx

`helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx`

`helm repo update`

`helm pull ingress-nginx/ingress-nginx`



to deploy to eks 

`helm install ingress-nginx ingress-nginx/ingress-nginx \
  --namespace ingress-nginx \