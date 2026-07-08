+ What is IAC - Infrastructure as code 
+ Introduction to Terraform 
+ What are the benefits of using terraform 
+ How to setup or install terraform 
+ Core concepts of terraform 
+ Terraform workflows 
+ Terraform Configurations files 
+ Terraform modules 
+ Terraform workspaces 
+ Advanced terraform scenarios e.g for each , count etc 
+ Terragrunt 




## What is Infrastructure As Code (IAC):  

This is a practise in modern cloud computing and DevOps that involves , managing , provisioning computing infrastructure through machine readable configuration files , rather than through manual processes or interactive configuration tool .

This approach enables teams (developers , system admins , devops , cloud engineers) to be able to automatically monitor  and provision resources using code rather than manually setting them up .With IaC, you define your infrastructure in code, which can then be executed by automation tools to provision and manage resources like virtual machines, networks, storage, and more.


Think of it like this:

Without IaC: An administrator manually creates a virtual machine, configures networking, installs software, and sets permissions through a web console or command line. e.g aws console 

With IaC: The administrator writes a configuration file describing the desired (what they want to create) infrastructure, and a tool automatically creates and configures everything consistently.


**Some examples of IAC tools**

+ Terraform 
+ Aws cloudformation
+ Ansible 
+ Chef and Puppet 
+ Pulumi 
+ Arm templates (azure)


**What are some of the Benefits of IAC (Terraform)**

1. **Automation** : 

+ It automates the setup of infrastructures , reducing the potentials of human errors and it increases efficiency in deploying new environments 
+ With Terraform, you can deploy complex infrastructure in minutes, rather than waiting for manual configuration or execution


2.  **Consistency & Reliability** : 

+ When you define infrastructure as code teams can ensure environments are consistent across development , testing , staging , production etc .By so doing it reduces environmental discrepancies as "works on my machine" problem . 

3. **Version Control** :  

+ like how developers write code and version control them with git , Infrastructure as code can be versioned controlled , allows teams to track changes , review history and revert to previous changes / states if necessary . This helps in collaboration among team members

4.  **Speed & Efficiency** : 

+ IAC enables rapid(fast) provisioning of environments.Its easy to create and destroy infrastruture very easily.making it easy to test and destroy infrastructure . It can take longer to create a IAC as code script or terraform when compared to manual setup but when it comes to reproducing the same setup infrastructure as a code becomes very fast . This can now be argued because with the coming of Artificial intelligence Engineers can now write code very fast .


5. **Cost Savings or and easy to Manage** ; 

+ By automating infrastructure provisioning and deprovisioning of resources , organisations , individuals can minize wastage by ensuring your company or organisation only uses what they need and when they need it . 

6. **There is Scalability** ; 

+ Your infrastructure can be scaled up and down with mininmal (less) efforts as business demand changes 

7. **It helps Risk Management or Disaster Recovery** : 
+ Since your infrastructure is in code you can quickly spin up a new environment if the old one is affected for business continuity. (replicate environments).

+ Since the infrastructure is defined as code, any team member can quickly recreate the environment in a consistent manner, regardless of where they are or who built it initially.

8. **Integration with CI/CD** 

+ Terraform integrates easily with continuous integration and continuous delivery (CI/CD) pipelines, enabling you to automate infrastructure provisioning as part of your application deployment workflow.

+ As you make changes to your code, Terraform can automatically provision new resources or update existing ones as part of the CI/CD pipeline, ensuring your infrastructure is always up to date.


9. **It enhances security** : 

+ Because the entire infrastructure is defined as code, you don’t just push changes directly into the environment. Any update — whether it’s a new resource or a modification — goes through a code review process. So before anything is deployed, the changes are submitted as a Pull Request. This allows other engineers to review the code, catch mistakes early, and make sure we’re following our internal standards.

+ On top of that, you can integrate IaC security tools like Checkov, TFSec, and linting into your pipeline. They automatically scan Terraform for misconfigurations — things like open security groups, missing encryption, or IAM policies that are too broad. This helps enforce security best practices before the code ever reaches production.


**What is Terraform ?**   ( Terraform is an infrastructure as a code tool)

Terraform is an `open-source` infrastructure as code software tool created `Harshicorp` 
It enables users to be able to define and provision and manage infrastructure using a high level configuration language known as `Hashicorp Configuration Language (HCL)` optionally you can use `json` .

Terraform automates the deployment and management of `cloud resources`, enabling you to treat your infrastructure as code that can be version-controlled, shared, and reused.

`Terraform and Cloudformation` are the two tools we will used for IAC  


**Key Features of Terraform**


1. `Declarative configuration`  :

You describe the desired state of your infrastructure (e.g., creating a server, network, or storage) in configuration files. Terraform then figures out how to achieve that state.

2. `Multi Cloud Support (Cloud Agnostics)`: 

Terraform supports a wide variety of cloud providers like AWS, Azure, Google Cloud, and others, as well as on-premises environments.

3. `Resource Management`:

It can manage a wide range of resources, from cloud infrastructure (e.g., EC2 instances, S3 buckets) to services like DNS, networking, databases, and more.

4. `State Management`;

Terraform keeps track of your infrastructure using a `state file`, which is a snapshot of your current infrastructure. This helps Terraform understand what has been created and manage the lifecycle of your resources.

5. `Execution Plan`

Before making any changes, Terraform creates an execution plan that outlines what actions will be taken (such as creating, updating, or deleting resources) to reach the desired state.

6. `Idempotency`

Terraform ensures that running the same configuration multiple times will always result in the same infrastructure without unintended changes.

7. `Modules`

Terraform supports reusable modules, which allow you to package and reuse configurations for different environments or projects.

8. `Workspaces`

Terraform workspaces allow you to manage multiple instances of a given infrastructure configuration within the same backend. This is useful for creating isolated environments like development, staging, and production using the same Terraform codebase.




## HOW TO INSTALL TERRAFORM ON MAC , LINUX AND WINDOWS OPERATING SYSTEMS

+ go on https://developer.hashicorp.com/terraform/install?product_intent=terraform 
+ select your Operating system and run the commands or download and run the binaries 

**for mac**

brew tap hashicorp/tap
brew install hashicorp/tap/terraform

**for linux ubuntu**

wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

any other operating system check here https://developer.hashicorp.com/terraform/install?product_intent=terraform 


+ Next step after installation to verify run : 
`terraform -version`

you should see output like this 

Terraform v1.14.5
on darwin_amd64




# TERRAFORM WORKFLOW OR MANAGING TERRAFORM CONFIGURATIONS 


This is simply terraform CLI (Command line interface) commands .
Terraform worklow are the commands we will run when we want to provision resources in the cloud using terraform

your terraform code will be inside a directory and the code inside a file .All terraform files ends with the extension  `.tf` 

1. `terraform init`

This command initializes a terraform working directory by loading any terraform configuration files in the directory . terraform init  prepares the working directory for other terraform commands 

*What does it do ?*  : 

+ It installs required plugins needed for your terraform configuration ( Harshicorp)   
+ It initializes the backend which is used for the state storage  
+ It prepares the working directory for terraform operations 

2. `terraform validate` 

This command is used to check or validate your terraform configuration files.

*What does it do ?*  : 

*Syntax Check* ;  It checks the syntax of your terraform configuration files to ensure the files are formatted correctly .
*Configuration Validation* 
*internal Consistency of your configuration*


3. `terraform plan` 

It creates an `execution plan`.This command is used to preview or show you what you have defined in your configuration that terraform is going to create 

*What does it do ?*  : 

* Its reads the current state (state-file) of any already -managed or provisioned resources in aws to determined what changes
are necessary to achieve the desired state specified in your terraform configuration.(It checks current state of your infratructure and compare it to desired state in your configuration and show what it would create )

* It outputs a detailed summary of the actions terraform will take without actually performing those actions .It simply shows you what terraform will  `create ,destroy or update (change)` .


4. `terraform apply` 

This command is going to provisioned or apply the changes you want 

*What does it do ?*  : 

* By default This command when run and its prompt the user for approval before provisioning the resources in the cloud 
* It also shows you what terraform will create just like plan 
* It updates the terraform statefile to reflect the new changes made . 
* Terraform apply creates a statefile to store your current state of your infrastructure 

Interview Question : `At what time in terraform is the statefile created`


+ `terraform destroy` 

This command destroy or remove all resources in your aws account or cloud environment managed by Terraform

*What does it do ?*  : 
* removes all resources defined in your terraform configuration 
* Its a destructive command and should be used with `caution` as it will irreversibly delete all managed infrastructure 

To Target specific resources to create or destroy you can run the following commands

`terraform destroy -target=resource_type.resource_name`

e.g terraform destroy -target=aws_instance.jenkins





# KEY TERRAFORM CONFIGURATION FILES & USES  

These are some of the important files required when creating an infrastructure with terraform.
These files helps you to organise your terraform configurations which makes it resuable , maintainable and clean code base.

`note`: Terraform files ends with .tf extensions 

1. **main.tf**

+ In this file you will need to declare the provider configurations (aws) ,and the resources you want to create for example EC2,

+ This is the primary configuration file where you define or declare the actual infrastructure resources e.g vpc , ec2 , security groyps , s3 buckets , eks cluster ,etc  adding a provider in this file is optional 

`example` 

provider "aws" {
    region = "ca-central-1" 
}

resource "aws_instance" "jenkins" {
    ami = "ami-0c9f6749650d5c0e3"
    instance_type = "t2.micro"    
} 


+ In the main.tf we have a block of code call the resource block . The resource block defines a resource to be managed by Terraform, such as an EC2 instance or an S3 bucket. Each resource block includes a type (e.g., aws_instance, aws_s3_bucket) and a name (e.g., example_instance, example_bucket).

2. **Variables.tf** 

This file is used to define input variables that will be used within your terraform configurations. By defining variables in this file it allows you to be able to customized your terraform configuration without altering or changing the main code (main.tf). This file is used to define input variables. Variables make your configuration reusable by parameterizing values like region, instance type, or AMI ID.

Defines input variables that allow your Terraform configurations to be `reusable, configurable, and dynamic`.

`example` 

variable "region" {
    description = "This is for the aws region to deploy to"
    type = string
    default = ca-cental-1
}

variable "ami" {
    description = "this is ami for each region"
    type = string
  
}

+ The variable define in this file we called each block the `variable block` 


3. `output.tf` 

This file will contain defintions of outputs that you want to get from your terraform state after deployment. These outputs can be useful for providing information such as ip addresses  , DNS records ,VPC id etc 

+ Also you can output information and use those output within your terraform configuration at run time . 


`example` 

output "instance_id" {
    value = aws_instance.jenkins.id
}

output "public_ip" {
    value = aws_instance.jenkins.public_ip

}

+ Each output define in this file we refer to it as the `output block` 




**END** 


4. `Provider.tf` 

This is optional file you can create to specify the required providers  (AWS ,AZURE , GCP ) and their configurations
Use case - you can use a seperate provider configurations , its easy to manage multiple providers or share  configurations between projects 

`example`

provider "aws" {
    region = var.region 
}

+ The code or configuration in this file is what we call a `provider block` 



5. `terraform.tfvars` or `terraform.tfvars.json` 

This file stores the values for the input variables declared in variables.tf 
*content* ; key value pairs matching the variable names 

region = "us-east-1"


**Note** You can have different .tfvars files for different envronments (e.g Development , Production , Staging etc )

6. `backend.tf` 

This file has configuration for your terraform backend which determines where the state information is stored . 
default backend is a file system , you can use a remote state backup using AWS S3 bucket or Terraform cloud 
Best practise use a remote backend like s3 bucket or terraform cloud. 

backend can be local or remote 

example 

terraform {
  backend "s3" {
    bucket = "class9-statefile-bucket-demo"
    key    = "class9/terraform.tfstate"
    region = "ca-central-1"
    
  }
}


+ The block code in this file we refer to it as the `backend.tf block`


7. `version.tf` (optional).

This file is used to specify the required `terraform version` and `providers version (aws , azure etc)` to ensure compatibility of your terraform configurations with specific versions of terraform and providers

a. `Terraform Required version` 

Specifies the minimum and/or maximum Terraform version required
Prevents running the configuration on an unsupported version.

required_version = ">= 1.3.0, < 2.0.0" (This means the configuration requires Terraform version 1.3.0 or higher, but less than 2.0.0.)

e.g 

terraform {
  required_version = ">= 1.3.0, < 2.0.0"
}



b `Provider Required providers`

+ specifies the providers required by the configuration.
+ Defines the source of the provider (e.g., hashicorp/aws) and its version constraints.

`example` 

required_providers {
  aws = {
    source  = "hashicorp/aws"
    version = "~> 4.20"
  }
}

This means the configuration requires the AWS provider version 4.20.x, and Terraform will automatically use the latest patch version in the 4.20 series

(It specifies the required terraform version and providers version to ensure compatibility)

remember terraform is a software and just like any other software they will keep updating the versions .This means e.g
something that was supported in version 1 might not be supported anymore in version 5 
This file you will specify the required Terraform version you want and the required versions of providers that you want.
using this file helps ensure that your infrastructure is deployed with compatible versions of terraform & providers which helps to avoid incompatible issues.


+ The block code in this file we refer to it as the `providers block`

8. `data.tf`  (optional)

This is to define data sources that can be used to fetch or search information from providers without creating resources.
when you seperate your code it helps in readability and maintainability terraform configurations . 
for instance , you might want to retreive information about an AWS AMI (Amazon Machine Image) , DNS  without making any changes to these entities , or retreive data from secret manager or paramaters 

`example for data source for an ami`

data "aws_ami" "ubuntu" {
    most_recent = true
    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
    }
    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"]
}

+ The code define in this files is what we call the `Data block`













