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

you can store your terraform state in a backend which can be `local or remote `

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

This is to define data sources (where terraform search for information) that can be used to fetch or search information from providers without creating resources.
when you seperate your code it helps in readability and maintainability  . 
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





###########################################
**DIFFERENT TYPES OF TERRAFORM BLOCKS** 
###########################################


1. **Providers Block** : the provider block contains configuration of your cloud provider which you want terraform to interact with 

`example `: 

`provider "aws" {
    region = us-east-1 
}`

2. **Resource Block** : A resource block define the resources you want terraform to manage (create , update etc) and within terraform code you can pass multiple resource blocks .

`examples:`

`resource "aws_instance" "jenkins" {
    ami   =  "ami-0c345585595959595"
    instance_type = t2.micro

}`


3. **Variable Block** : This block allows you to paramaterization (set parameters) and makes your configuration more flexible and resuable .using variables it makes your terraform code more dynamic .

example

`variable "instance_type" {
    description = "Instance i want to create"
    type = string
    default = "us-east-1"
}`


4. **Output Block** : This is used to display information after terraform completes creating or changing your resources in the cloud 

`example`

output "instance_type" {
    value = "aws_instance.jenkins.id"
}


5. **Data Block** : This block is used to fecth data from external sources (data sources) without modifying them. 



6. **Module Block** : This allows the reuse of existing configurations package as modules 
+ There are two types of modules ( `custom modules or terraform modules`)
+ `Custom modules` : These are modules that are created by you can be stored on github, gitlab , local computer etc 
+ `Terraform modules` : These are modules that comes with terraform by default and are stored on terraform registry 

example of a terraform module : 


`example of an terraform registry module for vpc` 

`module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}`



`example of a vpc custom module `

module "vpc-module" {
  source = "../../module/vpc"
  name   = var.name

  single_nat_gateway     = false
  one_nat_gateway_per_az = true
  enable_public_ipv6     = true

  azs  = var.azs
  cidr = var.cidr

  public_subnets                       = var.public_subnets
  private_subnets                      = var.private_subnets
  tags                                 = var.tags
  centralized_vpc_flow_logs_bucket_arn = var.centralized_vpc_flow_logs_bucket_arn
  cloudwatch_log_group_arn             = module.network.cloudwatch_log_group_arn
  vpc_flow_logs_role_arn               = module.iam_ssm_lambda.vpc_flow_logs_role_arn
  max_aggregation_interval             = 60
  log_retention_days                   = 365
}


**Terraform Block** : This block configures terraform settings such as backend configurations

example 

terraform {
  backend "s3" {
    bucket = "terraformstate-1273646474"
    key = "terraform/dev/statefile"
    region = "ca-central-1"
    dynamodb_table = "terraform-state-lock"
    encrypt = true
  }
}

**Locals Block** : The local block is for defining local variables that are used only within the configuration file 
+ The local block variables helps to create resuable and simplified expressions within configuration

Example 

locals  {
    environment = "dev"
    instance_tag = {
        name  = "jenkins instance"
        environment = local.environment
    }

}


**Dynamic Block** : This block provides away of configuring blocks within a resource 

example ; 

resource "aws_security_group" "jenkins_security_group" {
    name = "jenkins_security_group"

    dynamic "ingress" {
        for_each = var.ingress_rules
        content {
            from_port = 443
            to_port = 443
            protocol = tcp
            cidr_blocks = 0.0.0.0/0
        }
      
    }
}


you want to create a security group using terraform 


normally what you will do is 

ingress {
  from port 
}



ingress {
  from port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

ingress {
  from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}

This can be come to messy and alot of work so you can use dynamic blocks to help with this.

dynamic "ingress" {
  for_each = var.ingress_rules
  content {
    from_port   = ingress.value.from_port
    to_port     = ingress.value.to_port
    protocol    = ingress.value.protocol
    cidr_blocks = ingress.value.cidr_blocks
  }
}

loop through var.ingress_rules and create an ingress block for each rule defined in the variable.
each item creates one ingress rule 

example of variables for dynamic block 

variable "ingress_rules" {
  description = "List of ingress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "ingress_rules" {
  description = "List of ingress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

in terraform.tfvars 

ingress_rules = [
  {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  },
  {
    from_port = 80
    to_port = 80 
    protocol = http
    cidr_block ["0.0.0.0/0"]
  }
]





# VARIABLES 

variables are used to make configurations more flexible and reusable. Variables allow you to pass in values that can be used throughout your configuration files, making it easier to manage and update infrastructure settings. You can define variables for things like instance sizes, regions, AMIs, and other configuration options that may need to change based on different environments or use cases.

So far we have seen the variable.tf (file) and inside this file we have been able to see the variable block .
Variables in terraform allows you to parameterized or store values for your configurations , making them more flexible and resuable .Variables
can be define for various data (information) types and there different types of variables .

**DIFFERENT  TYPES OF VARIABLES** 

1. `Input Variables`

Input variables are used to customize the configuration of your Terraform infrastructure. They allow users to pass in values that Terraform can use during execution, making the configuration reusable and dynamic. These variables can be provided by the user via command-line arguments, .tfvars files, environment variables, or defaults within the configuration itself.

2. `Output Variables` 

Output variables are used to expose values from your Terraform configuration after it has been applied. These values could be information like IP addresses, instance IDs, or URLs that you may want to view or pass along to other configurations or modules. Outputs are typically used for displaying relevant data to the user or for passing information between modules or configurations .

3. `Local Variables`

Local variables in Terraform are used to store intermediate or calculated values that can be reused within a module (specific configurations). They are defined using the `locals block` and can simplify your configuration by eliminating repetitive calculations or code. Local variables are local to the module in which they are defined and cannot be passed to or accessed by other modules.
 

**Variable Data Types**

 Primitive Data Types 

1. + **String** :A string variable holds a single piece of text. It is the most basic and common variable type in Terraform.  This is a sequence of characters used to represent a text .it can include letters ,numbers ,and symbols.
e.g "hello" , "1234"  "welcome@90.com"


`example`

variable "aws_instance" {
    type = string  
    description = "Type of ec2 instance to launch"
    default = "t2.micro"
}

example of a string = "t2.micro"


2. **Number** : A number variable can hold a numeric value, either an integer or a float.

A `number` represents numeric values.These can be integers (whole numbers e.g 43 44 ) or it can be a floating point number (decimal numbers e.g 2.5 , 9.0)

example 

variable "instance_count" {
    description = "Number of ec2 instance to launch"
    type = number
    default = 2
    
}

instance_count = 128.345.67


3. **Boolean (Bool)** : A bool variable stores a boolean value, either `true or false` .
This is used for conditional statements.

variable "enable_logging" {
    description = "Determined to enable or disable logging"
    type = bool
    default = false 
   
}

enable_logging = true or false 


4. **List** : Its a `List` (array) which is a collection of items which can be of any data type .They are used to store a sequence of values of the same type  .define using Square brackets 

e.g list(number) [1, 2, 3, 4]  , list (string) ["calson", "divine", "foday", "lambert" ]


variable "availability_zones" {
    description = "List of Availability Zones"
    type = list(string)
    default =  [ "us-east-1a", "us-east-1b", "us-east-1c" ]
  
}

variable "ip_addresses" {
    description = "List of ip addresses"
    type = list(number)
    default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  
}

5. **Map**: This is a collection of values where each is identified by a string label defined using curly brackets 
Note you can use a map(string) , map(number)

example : {"name": "John", "age": 30 }


variable "tags" {
    description = "tags to apply on ec2 instances"
    type = map(string)
     default = {
       Environment = "Development"
       Class     = "5"
     }
     {
       Product = "Software"
       name    = "Class9" 
       managedby = terraform

     }
}


6. **Object**: An object is a complex data type that consists of named attributes, where each attribute can be a different data type. It allows you to group multiple related variables together. 

Example ;

variable "server" {
  type = object({
    name        = string
    port        = number
    protocol    = string
    public      = bool
  })
}


`variable "database" {
  type = object({
    username = string
    password = string
    port     = number
  })
  default = {
    username = "admin"
    password = "securepassword"
    port     = 5432
  }
  description = "Credentials for the database."
}`



7. **Turple** : A `turple` is a fixed-sized collection of elements ,where each element can be of different data type

example (true, "calson", 42)

`variable "networking_settings" {
    description = "my ip address .port and ssl certificates"
    type = tuple([string, number, bool])
    default = [ "10.0.0.0", 80, true ]
  
}`

8. **Set** : A set is a collection of unique values of a specific type. Sets are unordered, meaning the order of the elements is not guaranteed.

example : 

variable "unique_names" {
  type    = set(string)
  default = ["Alice", "Bob", "Charlie"]
}




9. **null** : a value that represents absence or omission. If you set an argument of a resource to null, Terraform behaves as though you had completely omitted it — it will use the argument's default value if it has one, or raise an error if the argument is mandatory. null is most useful in conditional expressions, so you can dynamically omit an argument if a condition isn't met.

variable "optional_variable" {
  type    = string
  nullable = true
  default = null
}

10. **Any** 

The any type is a special type that can represent any data type. It is used when the variable can accept any type of value, whether it's a string, number, list, object, or other types.

variable "config" {
  description = "explains any variable"
    type = any 
}


| Data Type   | Description                                                                 | Example                                       |
|-------------|-----------------------------------------------------------------------------|-----------------------------------------------|
| **string**  | Holds a single string value.                                                 | `type = string`                               |
| **number**  | Holds a numeric value (either integer or float).                             | `type = number`                               |
| **bool**    | Holds a boolean value (`true` or `false`).                                  | `type = bool`                                 |
| **list**    | Holds an ordered collection of values of the same type.                     | `type = list(string)`                         |
| **set**     | Holds a collection of unique values, unordered.                             | `type = set(string)`                          |
| **map**     | Holds a collection of key-value pairs where keys are strings.               | `type = map(string)`                          |
| **object**  | A complex type that consists of named attributes, each with its own type.   | `type = object({ instance_type = string })`    |
| **tuple**   | An ordered collection of elements with fixed types.                         | `type = tuple([string, number])`              |
| **any**     | A special type that can represent any data type.                            | `type = any`                                  |
| **nullable**| Allows a variable to be `null` or a specific type.                          | `nullable = true`                             |








END HERE 
MONDAY CONTINUATION 


# TERRAFORM DIRECTORY STRUCTURE 

Companies have different ways of arranging terraform project directories .

## Root Directory ( Main Configurations )

.
├── environments
│   ├── Dev ----------------------> directories (folders)
│   │   ├── main.tf
│   │   ├── output.tf
│   │   ├── terraform.tfvars
│   │   └── variables.tf
│   ├── Shared-service
│   │   ├── main.tf
│   │   ├── output.tf
│   │   ├── terraform.tfvars
│   │   └── variables.tf
│   ├── Staging
│   │   ├── main.tf
│   │   ├── output.tf
│   │   ├── terraform.tfvars
│   │   └── variables.tf
│   └── production
│       ├── main.tf
│       ├── output.tf
│       ├── terraform.tfvars
│       └── variables.tf
└── modules
    ├── ec2-instance
    │   ├── main.tf
    │   ├── output.tf
    │   └── variables.tf
    ├── loadbalancers
    │   ├── main.tf
    │   ├── output.tf
    │   └── variables.tf
    └── vpc
        ├── main.tf
        ├── output.tf
        └── variables.tf






**TERRAFORM MODULES** 

*What is a terraform module* ; Its like a container of multiple resources that are used together. Modules in terraform are use to group resources that are logically associated , and making your code base more organised , resuable and easier to maintain.

A module can include resoruces such as VPC, Security groups , S3 buckets ,cloudfront ,cloudwatch etc


**Types of Terraform Modules** 

1. `Root Module` : 

+ This is the main module where terraform is initialized and applied (i.e where you run terraform init , validate , plan and apply)
+ Located in the directory where you run Terraform commands (usually contains main.tf).


2. `Child Modules`:

+ These are modules that has resource confugurations and they are called (referenced) by the root modules or other modules 
+ They are Stored in separate directories or remote sources (e.g., GitHub, Terraform Registry, or local paths).


**HOW TO MANAGE MODULES**

You can manage your modules locally or remotely 

1.  `Local Management` : 

+ This is when you define modules in a directory.
+ To call the modules and use it in your configuration you need to specify the file path of that module 

`example` to reference or call a child module in your root module you will use the following example 

module "vpc" {
  source = "../../modules/vpc
  subnets = var.subnets
}



2.  `Remote Management : `

You can save your child modules into a GitHub repository or  Terraform Registry and you can call the modules from there. 

example of calling or referencing a remote module by following this 


`example for calling terraform registery module`


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "2.44.0"
}


`example calling a github module`

module "vpc" {
  source = "github.com/your-org/terraform-aws-vpc"

  cidr_block = "10.0.0.0/16"
  environment = "dev"
}



or 

`recommended`

module "vpc" {
  source = "github.com/your-org/terraform-aws-vpc?ref=v1.0.0"

  cidr_block = "10.1.0.0/16"
  environment = "staging"
}



### Importance of Terraform Modules

+ **Sharing and Collaboration** : You can share modules across different projects , environments within your organisation and you can share it with the terraform registry .This helps to foster collaboration and accelerate development by reusing proven infrastructure code . 

+ **Reusable** : Modules allows you to define your configurations and reuse them multiple times in different scenarios (env or projects).Which this helps to reduce duplication and errors in your infrastructure setup  

+ **Organisation of your code** : It helps to group all related resources together which makes your code easier to understand , manage and update 

+ **Version Control** ; Modules can be versioned allowing you to control and manage updates to the modules in a systematic way (1.0.0) .This is useful when you have a stable module that should not be affected by any ongoing changes somewhere else.(custom modules)

+ **Easy to Maintained** : This is easier to maintain because you can make changes to a single module and apply to your infrastructure and its going to make changes only to the resources using the module . 


## Terraform Modules Best Practise 

**Good naming conventions to your modules** : Give a name that reflects the modules purpose and components inside the module
**Document your Modules** : Its good you include comments and documenation within the module to describe its purpose , inputs & outputs
**Keep modules more focused** : Each module should have  a single , well defined purpose. Avoid creating overly complex or multipurpose modules for example a vpc module should not have cloud watch configurations or ec2 configurations keep it simple . 
**use versions constraints** :its good to specify version constraints for your modules, especially when using external sources to avoid unexpected changes 
**Test Modules** ; Test and validate modules independently to ensure they work before integrating them to your main infrastructure 


Note: You can target a particular module in your environment to create , update using the target command 
for examle `terraform plan --target=module.s3` && `terraform apply --target=modules.s3`  these target specific modules within your configuration and create the resources or update the resources . 

