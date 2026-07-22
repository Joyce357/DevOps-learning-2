8:17 PM EST 





## ANSIBLE

**What is Ansible**  : Ansible is an open-source `automation tool`, used for IT tasks such as `configuration management`, `application deployment`, `intraservice orchestration`, and `Infrastructure provisioning`.  It is agentless, easy to use, and widely adopted for managing systems, networks, and cloud infrastructure.

Ansible was created by `Michael DeHaan` and is now maintained by `Red Hat`.


**Key Features / Benefits of Ansible** ;

+ **Agentless** : Ansible does not require any agents to be installed on managed nodes(server /ec2). It uses SSH (Secure Shell) for communication, which simplifies the setup and maintenance process.

+ **Idempotent**: Ansible ensures that tasks are idempotent, meaning the task can be ran multiple times without changing the system beyond its intended state. This helps prevent configuration drift and ensures consistency.

+ **Ansible Language (YAML)** : Ansible uses a simple, human-readable language called YAML (Yet Another Markup Language) to define automation tasks in playbooks. This makes it accessible to users with varying levels of technical expertise.This also makes it easy and simple to learn ansible.

+ **Declarative and Procedural** : 

Define the end state (declarative) while specifying steps for execution (procedural).


+ **It supports extensibility** : Ansible has a modular architecture with a wide range of built-in modules for managing various system components. Users can also create custom modules to extend its functionality.


CLOUDFORMATION (YAML OR JSON) ----> Templates 
TERRAFORM ( HASHICORP OR JSON) ---> terraform configuration files 
ANSIBLE ( YAML ) ------------------> Ansible Playbooks 
BASH ------------------------------> SHELL SCRIPT 



##########################################

`Tips to understand file and their special names labelled by each software or tool` :

a file in cloudformation written in yaml and has declarative resources to create in aws is called : `TEMPLATES` 
a file written in YAML with ansible configurations is called a : `PLAYBOOK` 
a file written in declarative language  in jenkins is called a : `Jenkinsfile` 
a file that contains instructions to create an docker image in docker is called : `Dockerfile` 
a file written in yaml in kubernetes for deployment is called : `Manifest file` 

###########################################


**CONCEPTS OR UNDERSTANDING TERMINOLOGIST IN ANSIBLE**

node - server (ec2 , laptop etc)

1. `Control Node` : This is the node and by node we are referring to a computer or server (ec2 instance , mac , windows) where the ansible software is installed and from which all tasks and playbooks are run. It’s the central point from which configuration management, application deployment, task orchestration, and other automation tasks are executed. 

*Requirements for control node* : 

+ Ansible software must be installed in the node (computer) , laptop ,ec2 instance 
+ It requires python 2.7 or python 3.5 and above to be installed on the control node.


2. `Managed Nodes` :Managed Nodes are the network devices (like servers , switches, routers), cloud instances, or any other devices that are managed by the Control Node. Ansible does not require any special agents to be installed on the Managed Nodes; instead, it typically uses SSH for Linux/Unix machines or WinRM (Windows Remote Management) for Windows machines.

**How do ansible control node interacts with the Managed nodes* :

The Control Node connects to these nodes through ssh and pushes out small `programs called "modules" or carry out task using modules`. These modules are executed on the Managed Nodes and can change the state of the node (for example, by installing a package or writing a configuration file you can install apache using ansbile).

3. `Inventory or Hosts` : The Inventory is a list of nodes or hosts (servers) that are managed by Ansible. It specifies the nodes where the Ansible modules should run, and can be static or dynamic.

The Inventory can be defined in a simple static file (typically named inventory), written in INI or YAML format. It can group hosts in various ways and can also define variables for individual hosts or groups. For more complex environments, Ansible supports dynamic inventories that can be sourced from external data sources or systems.

**Examples of defining the managed hosts in your inventory file**

[webservers]
web1.example.com
web2.example.com

[dbservers]
db1.example.com
db2.example.com

defining them using variables 

[atlanta:vars]
ntp_server=ntp.atlanta.example.com
proxy=proxy.atlanta.example.com



`CONTROL NODE ARCHITECTURE`

When you install ansible on any server (server , computer ,ec2)it becomes the control node  .The control node have have the following 

`Ansible Engine` : the Ansible Engine, is responsible for executing automation tasks. It reads playbooks, interacts with the inventory, and uses modules to carry out the specified actions on managed nodes (servers).It carries out all the task defined in your playbooks and ensures the task are executed in the correct order. 


`Modules` : Modules are the units of work in Ansible. They are small programs that perform specific tasks, such as installing packages, managing services, or copying files.

Ansible has different types of Modules which are ? 

+ **Core Modules* : These are modules that came with the ansible server by default and it covers essential task.
+ *Custom Modules*: These are modules created by the user to extend the functionality of ansible.

Examples of modules : `apt`, `yum`, `service` , `copy` , `file` etc 


`Playbooks` ; Playbooks are YAML files (a file that ends with the YAML extension) with a series of task defined to be carryout on managed nodes by the ansible control node . Playbooks provide a workflow and ensure tasks are performed in the correct order.

+ At the begining of each playbook you will see `(---)` (This simply means the begining of a new playbook or document )

+ Playbooks consist of one or more "plays" (one or more events u want to carry out or task ), each targeting a set of hosts and specifying the tasks to be executed.

`example of a playbook` 

---
- name: Install and start Apache2 
  hosts: webservers
  become: yes
  tasks:
    - name: Install Apache
      apt:
        name: apache2
        state: present

    - name: Start Apache service
      service:
        name: apache2
        state: started


**What are some of the components of a Playbook**

+ Playsbooks starts with  `---`  :  This means a begining of a new file or playbook
+ `-name` : This is just a description of what the playbook will do 

+ **Hosts**: Define which hosts the play applies to.This is where you will be performing the task or this is the targeted managed nodes or computers 

`example`

- hosts: webservers  :  This means the playbook will execute only on that webservers 

- hosts: all      : This means your ansible playbook will run the task you have define to all servers in the inventory file or host file

[webservers]  
102.456.697
923.405.6907


**Tasks**: Define the actions to be performed by the playbook or ansible

`example`

tasks:
  - name: Install Apache
    yum:
      name: httpd
      state: present

**Variables**: It Defines dynamic values used within the playbook.

`example`
vars:
  http_port: 80


**Handlers**: Handlers are special tasks that run at the end of a playbook if notified by another task. For example, a handler might restart a service if its configuration file has been changed. Handlers are triggered by tasks that have a notify directive.

handlers:
  - name: restart apache
    service:
      name: httpd
      state: restarted


**Roles** are ways of automatically loading certain vars_files, tasks, and handlers based on a known file structure. Grouping content by roles also allows easy sharing of roles with other users.

`example`

roles:
  - common
  - webserver

**Tags** : Tags allow you to execute a specific part of a playbook. By assigning a tag to certain tasks, you can selectively run those tasks by specifying the tag name in the Ansible command line.

tasks:
  - name: Install PostgreSQL
    yum:
      name: postgresql
      state: present
    tags: database


---
- name: Ensure web server is installed and running
  hosts: webservers
  become: yes

  tasks:
    - name: Install Apache
      apt:
        name: apache2
        state: present

    - name: Start Apache service
      service:
        name: apache2
        state: started
        enabled: yes


**Templates** : Files that contain variables to be dynamically replaced during execution. Ansible uses the `Jinja2 template engine to manage template files`.

`example`

- name: Copy nginx config file
  template:
    src: templates/nginx.conf.j2
    dest: /etc/nginx/nginx.conf


**Blocks** in Ansible are used to group multiple tasks together so you can apply conditions, error handling, or cleanup logic to the whole group instead of repeating it for every task.


- block:
    - name: Ensure Apache is running
      service:
        name: httpd
        state: started
  when: ansible_os_family == "RedHat"



**Includes and Imports:** : Include or import tasks, roles, or other playbooks within a playbook. This helps in breaking down large playbooks into manageable pieces.

`example`

- include_tasks: setup.yml
- import_playbook: common.yml

**Loops:** Execute a task multiple times with different items. Ansible supports several types of loops, including simple lists, dictionaries, and nested loops.

example ;

tasks:
  - name: Add multiple users
    user:
      name: "{{ item }}"
      state: present
    loop:
      - alice
      - bob
      - charlie



**Ansible Plugins** 

Ansible plugins are pieces of code that augment Ansible's core functionality. They can be used to add custom features or to modify the behavior of existing features. Ansible supports several types of plugins e.g action plugins, callback plugins , filter plugins , connection plugins . inventory plugins , vars plugin , strategy plugins , test plugins , module plugins "


1. **Action Plugins**: These plugins act in relation with modules to execute actions on the managed hosts. They can manipulate data before handing it off to a module and can handle tasks directly on the control machine without involving the target hosts.

+ Extends the behaviour of ansible modules 
+ Use case : Modifying how a module operates or adding pre- and post processing 

2. **Callback Plugins**: 

+ Allow you to execute code in response to specific events during the execution of Ansible tasks.
+ Use Case: Logging, sending notifications, or custom reporting

3. **Lookup Plugins**: 
+ Retrieve data (information) from external sources.
+ Use Case: Fetching data from files, databases, or web services.

4. **Filter plugins**
+ Add custom Jinja2 filters.
+ Use Case: Transforming data within templates.

5. **Connection Plugins**
+ Manage connections to hosts.
+ Use Case: Custom connection methods like interacting with APIs or using specific protocols.

6. **Cache Plugin** 

+ These are used to keep a cache of facts to avoid costly gathering operations. This can significantly improve performance for large inventories or repeated playbook runs

7. **Vars Plugin**
+ Dynamically generate variables for use in playbooks based on external sources or environment conditions.

8. **Inventory Plugins**: 
Allow Ansible to dynamically load inventory from external systems like cloud providers or other APIs.



## Ansible API

Ansible Api allows you to integrate ansibile with other tools or applications. The API can be used to programmatically run playbooks , manage inventories , and interect with ansible components 




----------------------------------



**HOW TO INSTALL ANSIBLE** 



##################################
**Install Ansible on Windows**
##################################

*Step 1*

+ Open your terminal or Powershell as administrator and run the command `wsl --install`
+ Restart your computer if it prompts you to restart 

*Step 2*

+ After your computer restarts , open the microsoft store and search for a Linux distribution of your choice (Ubuntu)

*Step 3*

+ After the installation is complete , Open the installed Linux Distribution from the start Menu.
+ Follow the screen instructions to setup your linux user account 

*Step 4* 

+ Update and upgrade the linux distribution you have download by running the following on commands on your terminal 
`sudo apt update`
`sudo apt upgrade` 

*Step 5* 

+ Add the Ansible PPA (Personal Package Archive) and install Ansible by running the commands below
`sudo apt update`
`sudo apt install software-properties-common`
`sudo add-apt-repository --yes --update ppa:ansible/ansible`
`sudo apt install ansible -y`

*Step 6* 

+ Verify if ansible has been installed by running the command below

`ansible --version`


*Step 5* 

+ Add the Ansible PPA (Personal Package Archive) and install Ansible by running the commands below
`sudo apt update`
`sudo apt install software-properties-common`
`sudo add-apt-repository --yes --update ppa:ansible/ansible`
`sudo apt install ansible -y`

*Step 6* 

+ Verify if ansible has been installed by running the command below

`ansible --version`


YouTube Video for Ansible installation on windows 

https://www.youtube.com/watch?v=52ErTSw79eg 



###################################
**How to Install Ansible on Linux** 
#####################################

*Step 1* 

+ Update and upgrade the linux distribution (Ubuntu)

`sudo apt update`
`sudo apt upgrade` 

*Step 2*

+ Install required Dependencies ( install the software-properties-common packages which provides "add-apt-repository) by using the command below 
`sudo apt install software-properties-common -y`

*Step 3*

+ Add the ansible PPA(Personal Package Archive ) to your system using the command below ;

``sudo add-apt-repository --yes --update ppa:ansible/ansible`

*Step 4*

Install Ansible by running the command 

`sudo apt install ansible -y`

*Step 5*

Verify if ansible has been installed 
`ansible --version`


################################
**How to Install Ansible on Mac**
##################################

Only run the first command if you do not have Mac package manager ( Brew )
to verify if brew is installed run the command `brew --version`

if you do not have brew install it using your terminal by running the command below :

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

Step 1 . 

Update Home Brew by running the command 
`brew update`

Step 2.

Install Ansible by running the command 
`brew install ansible`

Step 3. 
Verify if ansible has been installed by running the command 
`ansible --version`









## ANSIBLE FILES & DIRECTORIES 

After installing ansible we will create the following files and directories and organised them for our project 


+ Create the Ansible Configuration File for your project 
1. `ansible.cfg` :

Purpose : It contains configurations files on how ansible will behave . This specifies default behaviour like specifying the inventory location , module path , log settngs , and ssh behaviour 


2. `Inventory File (`host` or `inventory`)

The Inventory or host is a list of nodes or hosts (servers) that are managed by Ansible. It specifies the nodes where the Ansible modules should run, and can be static or dynamic.

3. `Create a Playbook directory and inside you can create different playbooks or yml files` .you can store multiple yaml files for your project 

playbooks /install_apache.yaml
          /

3 . `Create  Roles directory` : (This simply helps to organize your playbook into a modular form )

Ansible roles are a way to organize Ansible playbooks into reusable components. Each role can include variables, tasks, files, templates, and modules needed to configure a system

Inside your role directory you can have multiple directories orgainising your playbook. Some of these directories can be : 

+ `defaults/` : This directory will contain default variables for the role
+ `vars/`     : this will contain other variables for the role (with higher priority) than the default 
+ `tasks/`    : This contains a list of tasks or things you want the role to execute 
+ `files/`     : This contains files that can be deployed through the role 
+  `templates/`: These are templates that needs to be processed and deployed by the role 
+ `handlers/`  : Contains handlers that is tasks that needs to run after the main task is completed and it will be notified to run 
+ `meta/ `     : This are dependencies for other roles . 




end here 



4. `site.yml`:This is a file . The site.yml file is typically the main playbook in an Ansible project.Its a playbook that defines the sequence of roles and tasks on your inventory of host .This will run all your playbooks that have been stated inside the site.yml

`example` :

 ---
- import_playbook: copy_key.yml
- import_playbook: install_apache.yml
- import_playbook: install_nginx.yml

Purpose of this is to : 

+ To make your playbooks reusable 
+ To make your playbooks maintainable 
+ To break your playbooks into modules . 


`group_vars` : This is a directory for defining variables specific to group of hosts (servers)

Production  : aws regions or infrastruture 
Staging     : Internal testing 
Development : Development and testing 
group_vars


`filter plugins` : This directory you can create custom jinja2 filter plugins to extend ansible functionality 




NOTE : What happens if you dont have the ssh private key for the instances 

`If you don't have the SSH private key for the instances you are trying to manage with Ansible, you will not be able to establish an SSH connection to those instances. This means that Ansible will not be able to execute any tasks or playbooks on those managed nodes`.

What Ansible Actually Needs 

+ SSH Access
+ Valid User 
+ Proper Network Connectivity
+ One of the following Authentication methods 

1. SSH Key-Based Authentication (private key )
2. Password-Based Authentication ( discouraged)
3. SSH Agent
4. Bastion /SSM 



`What are Tags in Ansible` ? 

Tags let you run specific tasks, roles, or plays instead of running the entire playbook.

`Why Tags Are Important`

+ Faster deployments
+ Safer production changes
+ Targeted fixes (hotfixes)




`What does Gathering Facts in Ansible means` ? 

+ Gathering facts in Ansible refers to the process of collecting information about the managed nodes (servers) before executing any tasks or playbooks. These facts include details about the system's hardware, software, network configuration, operating system, and other relevant attributes.

+ This of is like Ansible connects to the server and ask who are you ? and what do you look like e.g are ubuntu , windows or redhat etc 

`What kind of information does Ansible Collect ?` 
When ansible gathers facts it collects information or details such as :

1. OS name and version ( Ubuntu , Amazon Linux or Redht)
2. Network interfaces and IP addresses
3. Hardware details ( CPU, memory ,disk space)
4. OS architecture (x86_64 ,arm64)
5. Installed packages and software versions
6. Environment variables
7. File system information
8. User and group information
9. Running services and processes
10. Time and timezone settings



These are stored as variables you can use in playbooks.




`What is an Ansible Adhoc commands`

+ Ad-hoc commands are one-line Ansible commands used to perform quick, simple tasks on managed hosts without writing a playbook.
`example of an ad-hoc command to ping all servers in the inventory file`

`Note` the host on the adhoc commands is web - so change the host to your own host 


| Purpose                               | Ad-hoc Command                                                                             |
| ------------------------------------- | ------------------------------------------------------------------------------------------ |
| Test connectivity (Ansible ping)      | `ansible web -i inventory -m ping`                                                         |
| Check uptime                          | `ansible web -i inventory -m command -a "uptime"`                                          |
| Check disk usage                      | `ansible web -i inventory -m command -a "df -h"`                                           |
| Check memory usage                    | `ansible web -i inventory -m command -a "free -m"`                                         |
| Check OS version                      | `ansible web -i inventory -m command -a "cat /etc/os-release"`                             |
| Check kernel version                  | `ansible web -i inventory -m command -a "uname -r"`                                        |
| List running processes                | `ansible web -i inventory -m command -a "ps aux"`                                          |
| Check logged-in users                 | `ansible web -i inventory -m command -a "who"`                                             |
| Check hostname                        | `ansible web -i inventory -m command -a "hostname"`                                        |
| Check IP address                      | `ansible web -i inventory -m command -a "ip a"`                                            |
| Run shell command (pipes allowed)     | `ansible web -i inventory -m shell -a "df -h \| grep dev"`                                 |
| Install package (Ubuntu / Debian)     | `ansible web -i inventory -m apt -a "name=nginx state=present update_cache=yes" --become`  |
| Install package (RHEL / Amazon Linux) | `ansible web -i inventory -m yum -a "name=httpd state=present" --become`                   |
| Start service                         | `ansible web -i inventory -m service -a "name=nginx state=started enabled=yes" --become`   |
| Stop service                          | `ansible web -i inventory -m service -a "name=nginx state=stopped" --become`               |
| Restart service                       | `ansible web -i inventory -m service -a "name=nginx state=restarted" --become`             |
| Copy file to server                   | `ansible web -i inventory -m copy -a "src=test.txt dest=/tmp/test.txt mode=0644" --become` |
| Create directory                      | `ansible web -i inventory -m file -a "path=/opt/demo state=directory mode=0755" --become`  |
| Delete file                           | `ansible web -i inventory -m file -a "path=/tmp/test.txt state=absent" --become`           |
| Create user                           | `ansible web -i inventory -m user -a "name=demo_user state=present" --become`              |
| Gather system facts                   | `ansible web -i inventory -m setup`                                                        |
| Filter OS facts                       | `ansible web -i inventory -m setup -a "filter=ansible_distribution*"`                      |
| Check privilege escalation            | `ansible web -i inventory -m command -a "whoami" --become`                                 |
| Verbose debug output                  | `ansible web -i inventory -m ping -vvvv`                                                   |


