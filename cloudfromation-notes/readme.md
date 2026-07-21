

Interview Question 

`Between Terraform and AWS cloudformation which of them would you prefer ? and why ` ? 
`What is the difference between Cloudformation and Terraform` ? 





# Cloudformation 

+ Cloudformation is infrastructure as code and its a service in aws . Its not an open source like terraform. It does not support any other cloud provider only aws 
+ You can define your cloud resources in a simple text file called a template.With CloudFormation, you define your cloud infrastructure in text files using `JSON or YAML format`, known as `templates`. These templates describe the desired state of your resources, such as servers, databases, and networking configurations, and CloudFormation automates their creation and management.

Cloudformation is a regional service 

**Key Features / understanding of Cloudformation**

+ **Infrastructure as code* :It allows u to define your infrastructure using code .This code is put in a text file called `template`. It uses 
YAML or JSON syntax. 

+ **It has declarative Syntax* : You specify what resources you need and their configurations in a template file (`YAML or JSON`). CloudFormation takes care of provisioning and configuring those resources for you.

+ *Its good for Automation* ; It automates and manage your aws resources which reduces manual intervention , helps in consistency across different environments and reduces human errors. 

+ `Resource Management*`: CloudFormation takes care of dependencies between resources, ensuring that they are created, updated, or deleted in the correct order.

+ `*Stack Management*`: A stack is a collection of AWS resources that you can manage as a single unit. You create, update, and delete stacks using CloudFormation templates. CloudFormation keeps track of all the resources in your stack and their dependencies.

+ `*Change Sets*`: Before making changes to your stack, you can generate a change set, which shows you what changes CloudFormation will make. This allows you to review and approve changes before they are implemented.

+ `*Rollback and Roll Forward*` : If stack creation or update fails, CloudFormation automatically rolls back changes to the last known good state. This helps maintain stability and reliability in your infrastructure.

+ `*Cross-Stack References*`: CloudFormation allows you to export values from one stack and import them into another, enabling modular and reusable templates.


**Benefits of using Cloudformation** Ref benefits or advantages of IAC 





**Stack Management** 

1. **Stacks**

A stack is a collection of AWS resources that you can manage as a single unit (deployment). All the resources in a stack are defined by a CloudFormation template. Stacks allow you to create, update, and delete a group of resources together, ensuring that your infrastructure remains consistent and predictable.

`Stack Steps` : (These are simply the steps taken to create your stack or deployment using cloudformation)

+ *Creation*: When you create a stack, CloudFormation provisions all the resources defined in the template. i.e ur yaml file 
+ *Update*: You can update a stack by modifying its template and applying the changes. CloudFormation handles the dependencies and updates the resources accordingly.
+ *Deletion*: Deleting a stack removes all the resources associated with it, allowing for clean and automated resource management.

2. **Templates**

A template is a JSON or YAML formatted text file that describes the AWS resources you want to create and manage with CloudFormation. The template specifies the resources and their configurations, dependencies, and other settings.A template comes with different sections on how you can define your aws resources 



**Sections of a Template:**

+ **AWSTemplateFormatVersion** : Specifies the CloudFormation template version.
+ **Description**: A text description of the template.This is the description of what the template will do (brief description of the stack)
+ **Metadata**: Additional information about the template.
+ **Parameters**: Inputs to customize the template.Parameters can be defined in your template or can be passed at run time . 
+ **Mappings** : Static mappings like region-specific configurations.
+ **Conditions**: Conditions that control whether certain resources are created.
+ **Resources**: The resources to be created (e.g., EC2 instances, S3 buckets).
+ **Outputs**: Values to be returned after the stack is created, useful for cross-stack references.
+ **Transform** : For serverless applications, using the AWS Serverless Application Model (SAM).


#############################################

+ **Default** : This are the default values for the resources you want to create e.g instance type (t2.medium).Meaning at the time of creation if the user do not specify the values then create the default 
+ **Allowed Values** : This are the values you can set for your cloudformation resource parameters .This means only the allowed values specified here will be created using the parameter .This is like putting a restriction of which resources can be created using parameters.
+ **Constraint Description** : This is a description explaining what resources you need to create to meet the allowed values.


-----------------------------------------


3. **Change Sets**     `example here can be terraform plan or apply` 

A change set is a summary of the proposed changes that CloudFormation will make to your stack. Change sets allow you to preview how updates to a stack might impact your resources before actually applying the changes.

+ *Creation*: When you create a change set, CloudFormation compares the current stack state with the proposed changes and generates a list of changes.
+ *Review*: You can review the change set to understand what resources will be added, modified, or deleted.
+ *Execution*: After reviewing, you can choose to execute the change set to apply the changes to the stack or cancel it 


**Methods of deploying your IAC using Cloudformations** 

+ AWS Console ( through Graphical user interface)

+ You will need to prepare your Template in Yaml or json format by choosing an `existing template` or you can build it from an `infrastructure composer`

existing templates can upload from an `S3 Bucket` , Upload from `your computer` ,`Git repository (git sync)`


+ CLI (Commandline Interface)



4. **Stackset** :  is a feature of AWS CloudFormation that allows you to manage and deploy `CloudFormation stacks` across multiple AWS accounts and regions. This is particularly useful for large enterprises and organizations with multi-account or multi-region deployments that need centralized infrastructure management.

`Key Concepts of StackSets`

+ StackSet: A StackSet is a collection of CloudFormation stacks deployed across different accounts and regions.
+ Stack Instances: Each individual CloudFormation stack within the StackSet, deployed in a specific target account and region.
+ Administrator Account: The AWS account that has permission to manage StackSets. This account creates, updates, or deletes StackSets.
+ Target Accounts: The AWS accounts where the stacks are deployed in.
+ Execution Role: The IAM role in the target accounts that allows StackSets to perform operations on their behalf.

`Why use Stacksets`

+ Centralized Management: Manage infrastructure configurations from a central administrator account.
+ Multi-Account Deployment: Deploy infrastructure consistently across multiple AWS accounts.
+ Multi-Region Deployment: Distribute infrastructure resources to various regions for high availability.
+ Compliance: Ensure all environments (e.g., dev, prod, test) follow standardized infrastructure templates
+ Scalability: Simplifies managing infrastructure in large organizations.


`Hands On code` 

AWSTemplateFormatVersion: '2010-09-09'
Description: Create a single EC2 instance using CloudFormation

Parameters:
  InstanceType:
    Type: String
    Default: t2.micro
    AllowedValues:
      - t2.micro
      - t3.micro
      - t3.small
    Description: EC2 instance type

  KeyPairName:
    Type: AWS::EC2::KeyPair::KeyName
    Description: Existing EC2 KeyPair for SSH access

  VpcId:
    Type: AWS::EC2::VPC::Id
    Description: VPC where the instance will be launched

  SubnetId:
    Type: AWS::EC2::Subnet::Id
    Description: Subnet for the EC2 instance

Resources:
  EC2SecurityGroup:
    Type: AWS::EC2::SecurityGroup
    Properties:
      GroupDescription: Allow SSH access
      VpcId: !Ref VpcId
      SecurityGroupIngress:
        - IpProtocol: tcp
          FromPort: 22
          ToPort: 22
          CidrIp: 0.0.0.0/0

  EC2Instance:
    Type: AWS::EC2::Instance
    Properties:
      InstanceType: !Ref InstanceType
      KeyName: !Ref KeyPairName
      SubnetId: !Ref SubnetId
      SecurityGroupIds:
        - !Ref EC2SecurityGroup
      ImageId: ami-0a3c3a20c09d6f377   # Amazon Linux 2 (example – region specific)
      Tags:
        - Key: Name
          Value: CloudFormation-EC2

Outputs:
  InstanceId:
    Description: EC2 Instance ID
    Value: !Ref EC2Instance

  PublicIP:
    Description: Public IP address of the EC2 instance
    Value: !GetAtt EC2Instance.PublicIp






**Hands On**

AWS Console : When you want to create a stack you can use Existing Templates from sync with git , uploading as a file or Amazon s3 url 
+ You can also use Sample templates 
+ You can buid your template using application composer 

Rollback : `Stack failure options`

You can configure how you want the rollback mechanism to work in cloudformation . you have the option to roll back all deployments or resources if the stack fails or you can rollback to the succesful resources that has been created 

Other optins 

Stack Notifications : You can get notifications through sns once stack has been created , fails etc 

Timeouts for stack : 



**Commands to Deploy AWS Cloudformation Stack**

| **Action**                | **Command**                                                                                                      | **Description**                                                                                           |
|---------------------------|------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| Create Stack              | `aws cloudformation create-stack --stack-name <stack-name> --template-body file://<template-file>`               | Creates a new stack from a specified template file.                                                        |
| Create Stack with Parameters | `aws cloudformation create-stack --stack-name <stack-name> --template-body file://<template-file> --parameters ParameterKey=<key>,ParameterValue=<value>` | Creates a new stack from a specified template file with parameters.                                        |
| Update Stack              | `aws cloudformation update-stack --stack-name <stack-name> --template-body file://<template-file>`               | Updates an existing stack using a specified template file.                                                 |
| Update Stack with Parameters | `aws cloudformation update-stack --stack-name <stack-name> --template-body file://<template-file> --parameters ParameterKey=<key>,ParameterValue=<value>` | Updates an existing stack with new parameters.                                                             |
| Delete Stack              | `aws cloudformation delete-stack --stack-name <stack-name>`                                                     | Deletes the specified stack.                                                                               |
| Describe Stacks           | `aws cloudformation describe-stacks --stack-name <stack-name>`                                                  | Describes the specified stack, including its status and outputs.                                           |
| List Stacks               | `aws cloudformation list-stacks`                                                                                | Lists all stacks in the account with their statuses.                                                       |
| Create Change Set         | `aws cloudformation create-change-set --stack-name <stack-name> --template-body file://<template-file> --change-set-name <change-set-name>` | Creates a change set for an existing stack to preview changes before applying them.                        |
| Execute Change Set        | `aws cloudformation execute-change-set --change-set-name <change-set-name> --stack-name <stack-name>`           | Executes the specified change set to apply changes to the stack.                                           |
| Describe Change Set       | `aws cloudformation describe-change-set --change-set-name <change-set-name> --stack-name <stack-name>`          | Describes the changes in the specified change set.                                                         |
| Validate Template         | `aws cloudformation validate-template --template-body file://<template-file>`                                   | Validates a specified CloudFormation template for syntax and logical errors.                               |
| Estimate Template Cost    | `aws cloudformation estimate-template-cost --template-body file://<template-file>`                              | Estimates the cost of the resources defined in the specified template.                                      |
| Get Template Summary      | `aws cloudformation get-template-summary --template-body file://<template-file>`                                | Gets a summary of the resources and parameters defined in the specified template.                          |
| Describe Stack Events     | `aws cloudformation describe-stack-events --stack-name <stack-name>`                                            | Describes the events for the specified stack, useful for troubleshooting stack creation or update issues.  |
| Describe Stack Resources  | `aws cloudformation describe-stack-resources --stack-name <stack-name>`                                         | Describes the resources in the specified stack, including their status and logical ID.                     |
| List Stack Resources      | `aws cloudformation list-stack-resources --stack-name <stack-name>`                                             | Lists all the resources in the specified stack, including their status and logical ID.                     |



**What are some of the cloudformation Build in functions you can use in your Template ?**


1. `Ref`Function ;

The Ref function returns the value of the specified `parameter or resource`. For resources, it returns the physical ID of the resource. For parameters, it returns the value of the parameter.

`example`

AWSTemplateFormatVersion: '2010-09-09'
Description: A simple EC2 instance

Parameters:
  InstanceType:
    Description: Type of EC2 instance to launch
    Type: String
    Default: t2.medium
    AllowedValues:
      - t2.micro
      - t2.small
      - t2.medium

    ConstraintDescription: Must be a valid EC2 instance type.

Resources:
  Jenkins:
    Type: 'AWS::EC2::Instance'
    Properties:
      InstanceType: !Ref InstanceType
      ImageId: 'ami-0cf2b4e024cdb6960'
      KeyName: 'myteam4tech'

  Webserver:
    Type: 'AWS::EC2::Instance'
    Properties:
      InstanceType: !Ref InstanceType
      ImageId: 'ami-0cf2b4e024cdb6960'
      KeyName: 'myteam4tech'


Outputs:
  InstanceId:
    Description: 'The Instance ID'
    Value: !Ref Jenkins


2. `Fn::GetAtt Function`
The Fn::GetAtt function returns the value of an attribute from a resource in the template.it is used to retrieve the value of an attribute from a resource in a CloudFormation stack. It allows you to reference output properties of AWS resources defined in the template.

`example`

Resources:
  MyEC2Instance:
    Type: 'AWS::EC2::Instance'
    Properties:
      InstanceType: 't2.micro'
      ImageId: 'ami-0cf2b4e024cdb6960'

  MyInstanceProfile:
    Type: 'AWS::IAM::InstanceProfile'
    Properties:
      Roles: [!Ref MyRole]

  MyRole:
    Type: 'AWS::IAM::Role'
    Properties:
      AssumeRolePolicyDocument:
        Version: '2012-10-17'
        Statement:
          - Effect: Allow
            Principal:
              Service: [ec2.amazonaws.com]
            Action: ['sts:AssumeRole']

Outputs:
  InstanceID:
    Description: 'The Instance ID'
    Value: !Ref MyEC2Instance

  AvailabilityZone:
    Description: 'The Availability Zone'
    Value: !GetAtt MyEC2Instance.AvailabilityZone


3. `Fn::Join Function` : 

The Fn::Join function in AWS CloudFormation takes a list of values and combines them into a single string, using a specified delimiter to separate each value. Think of it like using glue to stick a bunch of words together with a space or any other character in between.

`example`

AWSTemplateFormatVersion: '2010-09-09'
Description: Example template using Fn::Join function
Resources:
  MyBucket:
    Type: 'AWS::S3::Bucket'

  MyBucketPolicy:
    Type: 'AWS::S3::BucketPolicy'
    Properties:
      Bucket: !Ref MyBucket
      PolicyDocument:
        Statement:
          - Action: 's3:*'
            Effect: Allow
            Resource: !Join
              - ''
              - - 'arn:aws:s3:::'
                - !Ref MyBucket
                - '/*'
            Principal: '*'

arn:aws:s3:::demobucketusa/*

4. `Fn::Sub Function` : the Fn::Sub function substitutes variables in an input string with values that you specify. It’s often used to construct ARNs.

`example: 

Resources:
  MyBucket:
    Type: 'AWS::S3::Bucket'
  MyBucketPolicy:
    Type: 'AWS::S3::BucketPolicy'
    Properties:
      Bucket: !Ref MyBucket
      PolicyDocument:
        Statement:
          - Action: 's3:*'
            Effect: Allow
            Resource: !Sub 'arn:aws:s3:::${MyBucket}/*'
            Principal: '*'


5. `Fn::If Function`:The Fn::If function returns one value if the specified condition evaluates to true and another value if the specified condition evaluates to false.

`example`

AWSTemplateFormatVersion: '2010-09-09'
Description: Example template using Fn::Join function

Parameters:
  EnvironmentType:
    Description: 'The environment type.'
    Type: String
    Default: 'test'
    AllowedValues: ['prod', 'test']
    ConstraintDescription: 'must specify prod or test.'

Resources:
  MyBucket:
    Type: 'AWS::S3::Bucket'
    DeletionPolicy: !If [IsProd, Retain, Delete]

Conditions:
  IsProd: !Equals [!Ref EnvironmentType, 'prod']


6. `Fn::ImportValue Function`: The Fn::ImportValue function returns the value of an output exported by another stack.

The Fn::ImportValue function is used to import values that have been exported from another CloudFormation stack. This allows for reusing common resources across multiple stacks, promoting modularity and reducing duplication. For example, you might have a VPC stack that creates a VPC and exports its ID. Other stacks can then import this VPC ID to create resources within the same VPC.

`EXAMPLES`
**This creates a vpc and exports its ID**

`AWSTemplateFormatVersion: '2010-09-09'
Description: VPC Stack

Resources:
  MyVPC:
    Type: 'AWS::EC2::VPC'
    Properties:
      CidrBlock: '10.0.0.0/16'
      EnableDnsSupport: true
      EnableDnsHostnames: true

Outputs:
  VPCId:
    Description: 'The ID of the VPC'
    Value: !Ref MyVPC
    Export:
      Name: MyVPCId`

##############################################################################
This template now uses the `Fn::ImportValue Function` to import the VPC ID from the previous example above 
###############################################################################

AWSTemplateFormatVersion: '2010-09-09'
Description: EC2 Instance Stack

Resources:
  MySubnet:
    Type: 'AWS::EC2::Subnet'
    Properties:
      VpcId: !ImportValue MyVPCId
      CidrBlock: '10.0.1.0/24'
      MapPublicIpOnLaunch: true

  MyEC2Instance:
    Type: 'AWS::EC2::Instance'
    Properties:
      InstanceType: 't2.micro'
      ImageId: 'ami-0cf2b4e024cdb6960'
      SubnetId: !Ref MySubnet

Outputs:
  InstanceId:
    Description: 'The Instance ID'
    Value: !Ref MyEC2Instance




7. `Fn::Split Function`: The Fn::Split function is used to divide a string into a list of string values based on a specified delimiter. This function is useful when you need to process a single parameter or output value that contains multiple items separated by a delimiter.

`example`

AWSTemplateFormatVersion: '2010-09-09'
Description: Example template using Fn::Split function

Parameters:
  CommaDelimitedList:
    Type: String
    Default: 'one,two,three'
    Description: 'A comma-delimited list of values.'

Resources:
  MyBucket:
    Type: 'AWS::S3::Bucket'
    Properties:
      BucketName: !Sub 'my-bucket-${AWS::StackName}'

Outputs:
  SplitValues:
    Value: !Select [1, !Split [",", !Ref CommaDelimitedList]]
    Description: 'The second value in the comma-delimited list.'


aws cloudformation create-stack --stack-name split-example-stack --template-body file://split-example.yaml --parameters ParameterKey=CommaDelimitedList,ParameterValue='one,two,three,four'



8.  `Fn::Select Function`: The Fn::Select function returns a single object from a list of objects by index.
    
    `example`: 

    Parameters:
  MyamiList:
    Type: CommaDelimitedList
    Default: "ami-12345678,ami-87654321"

Resources:
  MyEC2Instance:
    Type: 'AWS::EC2::Instance'
    Properties:
      InstanceType: 't2.micro'
      ImageId: !Select [0, !Ref MyamiList]



# Interview Question :  

+ `What is the difference Between Cloudformation and Terraform` which of them do you prefer ? 
+ `You have experience with Cloudformation and Terraform , which of them do you prefer and why` ? 


**WHAT ARE THE KEY DIFFERENCES BETWEEN TERRAFORM AND CLOUDFORMATION** 

1. Terraform is an opensource tool and free to use while AWS cloudformation is propriatary
2. Terraform is written in Hashicorp or Json while Cloudformation is written in Yaml and also json 
3. Terraform manages a state (statefile ) that tracks the current state vs the desire state while cloudformation does not require any statefile
4. Cost cloudformation is free to use but you pay for the resources it will provisioned while terraform is also free but have a paid enterprized offer for advanced collaboration ,features with an addiational cost . 
5. Terraform is Cloud Agnostics ( supports multiple cloud providers), whereas Cloudformation is an aws Native tool and can be used only on AWS . 
6. Cloudformation has an Automatic rollback on failure while terraform Requires manual intervention, with some automation options.





| **Feature**                         | **AWS CloudFormation**                              | **Terraform**                                     |
|-------------------------------------|-----------------------------------------------------|---------------------------------------------------|
| **Provider**                        | Amazon Web Services (AWS) only                      | Multiple cloud providers (AWS, Azure, GCP, etc.)  |
| **Language**                        | JSON or YAML                                        | HashiCorp Configuration Language (HCL) or JSON    |
| **State Management**                | Managed by AWS, no explicit state file              | Requires management of state files (locally or remotely) |
| **Resource Support**                | Only supports AWS resources                         | Supports a wide range of cloud providers and resources |
| **Cross-Provider Support**          | Limited to AWS resources                            | Extensive support for multi-cloud and on-premises |
| **Modularity**                      | Nested stacks                                       | Modules                                           |
| **Community Support**               | Strong AWS-focused community                        | Large and diverse community across multiple providers |
| **Templating**                      | Built-in with intrinsic functions                   | Native support using interpolation and functions  |
| **Drift Detection**                 | Built-in                                            | Requires additional tools or custom scripts       |
| **Execution Plan**                  | Change sets to preview changes                      | Plan command to preview changes                   |
| **Deployment Speed**                | Can be slower due to detailed dependency handling   | Generally faster due to parallel resource creation|
| **Error Handling**                  | Automatic rollback on failure                       | Requires manual intervention, with some automation options |
| **Learning Curve**                  | Easier for those familiar with AWS                  | Steeper due to support for multiple providers and HCL syntax |
| **Licensing**                       | Free (included with AWS services)                   | Open-source with enterprise options available     |
| **Extensibility**                   | Limited to AWS custom resources                     | Highly extensible with provider plugins           |
| **CLI Tool**                        | AWS Console,  CLI                                             | Terraform CLI                                     |
| **Integration with Other Tools**    | Integrates well with other AWS services             | Integrates with many DevOps tools and platforms   |
| **Documentation**                   | Comprehensive for AWS resources                     | Comprehensive for multiple providers              |
| **Resource Graph Visualization**    | Limited                                             | Provides a graph of resource dependencies         |
| **Rollback Mechanism**              | Built-in automatic rollback                         | Manual rollback with terraform apply or state manipulation |


Other IAC tools cloud native 

+ Azure Resource Manager (ARM) Templates ( uses Json)
+ Google Cloud Deployment Manager (Yaml or Python )



HANDS ON CLOUDFORMATION TEMPLATE 


AWSTemplateFormatVersion: "2010-09-09"
Description: Production-ready VPC (2 AZ) with 2 public + 2 private subnets, IGW, 2 NAT GWs, and a private EC2 instance (SSM-enabled). Outputs InstanceId.

Parameters:
  EnvironmentName:
    Type: String
    Default: prod
    Description: Tag value for Environment

  VpcCidr:
    Type: String
    Default: 10.0.0.0/16
    Description: VPC CIDR block

  PublicSubnet1Cidr:
    Type: String
    Default: 10.0.0.0/24
  PublicSubnet2Cidr:
    Type: String
    Default: 10.0.1.0/24

  PrivateSubnet1Cidr:
    Type: String
    Default: 10.0.10.0/24
  PrivateSubnet2Cidr:
    Type: String
    Default: 10.0.11.0/24

  InstanceType:
    Type: String
    Default: t3.micro
    AllowedValues:
      - t2.micro
      - t3.micro
      - t3.small
      - t3.medium
    Description: EC2 instance type

  EnableSSH:
    Type: String
    Default: "false"
    AllowedValues: ["true", "false"]
    Description: Set true only if you want SSH (not recommended for production)

  KeyPairName:
    Type: String
    Default: ""
    Description: Optional. Required only if EnableSSH=true

  AllowedSSHCidr:
    Type: String
    Default: "0.0.0.0/0"
    Description: Optional. Restrict SSH to your IP (recommended) if SSH enabled

Conditions:
  UseSSH: !Equals [!Ref EnableSSH, "true"]
  HasKeyPair: !Not [!Equals [!Ref KeyPairName, ""]]
  UseSSHWithKeyPair: !And [!Condition UseSSH, !Condition HasKeyPair]

Resources:
  # -------------------------
  # VPC + IGW
  # -------------------------
  VPC:
    Type: AWS::EC2::VPC
    Properties:
      CidrBlock: !Ref VpcCidr
      EnableDnsSupport: true
      EnableDnsHostnames: true
      Tags:
        - Key: Name
          Value: !Sub "${EnvironmentName}-vpc"
        - Key: Environment
          Value: !Ref EnvironmentName

  InternetGateway:
    Type: AWS::EC2::InternetGateway
    Properties:
      Tags:
        - Key: Name
          Value: !Sub "${EnvironmentName}-igw"
        - Key: Environment
          Value: !Ref EnvironmentName

  VPCGatewayAttachment:
    Type: AWS::EC2::VPCGatewayAttachment
    Properties:
      VpcId: !Ref VPC
      InternetGatewayId: !Ref InternetGateway

  # -------------------------
  # Subnets (2 AZs)
  # -------------------------
  PublicSubnet1:
    Type: AWS::EC2::Subnet
    Properties:
      VpcId: !Ref VPC
      AvailabilityZone: !Select [0, !GetAZs ""]
      CidrBlock: !Ref PublicSubnet1Cidr
      MapPublicIpOnLaunch: true
      Tags:
        - Key: Name
          Value: !Sub "${EnvironmentName}-public-a"
        - Key: Tier
          Value: public
        - Key: Environment
          Value: !Ref EnvironmentName

  PublicSubnet2:
    Type: AWS::EC2::Subnet
    Properties:
      VpcId: !Ref VPC
      AvailabilityZone: !Select [1, !GetAZs ""]
      CidrBlock: !Ref PublicSubnet2Cidr
      MapPublicIpOnLaunch: true
      Tags:
        - Key: Name
          Value: !Sub "${EnvironmentName}-public-b"
        - Key: Tier
          Value: public
        - Key: Environment
          Value: !Ref EnvironmentName

  PrivateSubnet1:
    Type: AWS::EC2::Subnet
    Properties:
      VpcId: !Ref VPC
      AvailabilityZone: !Select [0, !GetAZs ""]
      CidrBlock: !Ref PrivateSubnet1Cidr
      MapPublicIpOnLaunch: false
      Tags:
        - Key: Name
          Value: !Sub "${EnvironmentName}-private-a"
        - Key: Tier
          Value: private
        - Key: Environment
          Value: !Ref EnvironmentName

  PrivateSubnet2:
    Type: AWS::EC2::Subnet
    Properties:
      VpcId: !Ref VPC
      AvailabilityZone: !Select [1, !GetAZs ""]
      CidrBlock: !Ref PrivateSubnet2Cidr
      MapPublicIpOnLaunch: false
      Tags:
        - Key: Name
          Value: !Sub "${EnvironmentName}-private-b"
        - Key: Tier
          Value: private
        - Key: Environment
          Value: !Ref EnvironmentName

  # -------------------------
  # Public Route Table + Route to IGW
  # -------------------------
  PublicRouteTable:
    Type: AWS::EC2::RouteTable
    Properties:
      VpcId: !Ref VPC
      Tags:
        - Key: Name
          Value: !Sub "${EnvironmentName}-public-rt"
        - Key: Environment
          Value: !Ref EnvironmentName

  PublicDefaultRoute:
    Type: AWS::EC2::Route
    DependsOn: VPCGatewayAttachment
    Properties:
      RouteTableId: !Ref PublicRouteTable
      DestinationCidrBlock: 0.0.0.0/0
      GatewayId: !Ref InternetGateway

  PublicSubnet1RouteTableAssociation:
    Type: AWS::EC2::SubnetRouteTableAssociation
    Properties:
      SubnetId: !Ref PublicSubnet1
      RouteTableId: !Ref PublicRouteTable

  PublicSubnet2RouteTableAssociation:
    Type: AWS::EC2::SubnetRouteTableAssociation
    Properties:
      SubnetId: !Ref PublicSubnet2
      RouteTableId: !Ref PublicRouteTable

  # -------------------------
  # NAT Gateways (2 for HA) + Private Route Tables
  # -------------------------
  NatEip1:
    Type: AWS::EC2::EIP
    Properties:
      Domain: vpc

  NatEip2:
    Type: AWS::EC2::EIP
    Properties:
      Domain: vpc

  NatGateway1:
    Type: AWS::EC2::NatGateway
    DependsOn: VPCGatewayAttachment
    Properties:
      AllocationId: !GetAtt NatEip1.AllocationId
      SubnetId: !Ref PublicSubnet1
      Tags:
        - Key: Name
          Value: !Sub "${EnvironmentName}-nat-a"
        - Key: Environment
          Value: !Ref EnvironmentName

  NatGateway2:
    Type: AWS::EC2::NatGateway
    DependsOn: VPCGatewayAttachment
    Properties:
      AllocationId: !GetAtt NatEip2.AllocationId
      SubnetId: !Ref PublicSubnet2
      Tags:
        - Key: Name
          Value: !Sub "${EnvironmentName}-nat-b"
        - Key: Environment
          Value: !Ref EnvironmentName

  PrivateRouteTable1:
    Type: AWS::EC2::RouteTable
    Properties:
      VpcId: !Ref VPC
      Tags:
        - Key: Name
          Value: !Sub "${EnvironmentName}-private-rt-a"
        - Key: Environment
          Value: !Ref EnvironmentName

  PrivateRouteTable2:
    Type: AWS::EC2::RouteTable
    Properties:
      VpcId: !Ref VPC
      Tags:
        - Key: Name
          Value: !Sub "${EnvironmentName}-private-rt-b"
        - Key: Environment
          Value: !Ref EnvironmentName

  PrivateDefaultRoute1:
    Type: AWS::EC2::Route
    Properties:
      RouteTableId: !Ref PrivateRouteTable1
      DestinationCidrBlock: 0.0.0.0/0
      NatGatewayId: !Ref NatGateway1

  PrivateDefaultRoute2:
    Type: AWS::EC2::Route
    Properties:
      RouteTableId: !Ref PrivateRouteTable2
      DestinationCidrBlock: 0.0.0.0/0
      NatGatewayId: !Ref NatGateway2

  PrivateSubnet1RouteTableAssociation:
    Type: AWS::EC2::SubnetRouteTableAssociation
    Properties:
      SubnetId: !Ref PrivateSubnet1
      RouteTableId: !Ref PrivateRouteTable1

  PrivateSubnet2RouteTableAssociation:
    Type: AWS::EC2::SubnetRouteTableAssociation
    Properties:
      SubnetId: !Ref PrivateSubnet2
      RouteTableId: !Ref PrivateRouteTable2

  # -------------------------
  # Security Group (SSM-only by default; optional SSH)
  # -------------------------
  EC2SecurityGroup:
    Type: AWS::EC2::SecurityGroup
    Properties:
      GroupDescription: EC2 SG (SSM access; optional SSH)
      VpcId: !Ref VPC
      SecurityGroupIngress: !If
        - UseSSH
        - - IpProtocol: tcp
            FromPort: 22
            ToPort: 22
            CidrIp: !Ref AllowedSSHCidr
        - []
      Tags:
        - Key: Name
          Value: !Sub "${EnvironmentName}-ec2-sg"
        - Key: Environment
          Value: !Ref EnvironmentName

  # -------------------------
  # IAM Role for SSM
  # -------------------------
  EC2Role:
    Type: AWS::IAM::Role
    Properties:
      AssumeRolePolicyDocument:
        Version: "2012-10-17"
        Statement:
          - Effect: Allow
            Principal:
              Service: ec2.amazonaws.com
            Action: "sts:AssumeRole"
      ManagedPolicyArns:
        - arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore
      Tags:
        - Key: Environment
          Value: !Ref EnvironmentName

  EC2InstanceProfile:
    Type: AWS::IAM::InstanceProfile
    Properties:
      Roles:
        - !Ref EC2Role

  # -------------------------
  # EC2 Instance (in Private Subnet)
  # -------------------------
  EC2Instance:
    Type: AWS::EC2::Instance
    Properties:
      InstanceType: !Ref InstanceType
      IamInstanceProfile: !Ref EC2InstanceProfile
      SubnetId: !Ref PrivateSubnet1
      SecurityGroupIds:
        - !Ref EC2SecurityGroup
      KeyName: !If [UseSSHWithKeyPair, !Ref KeyPairName, !Ref "AWS::NoValue"]
      ImageId: !Sub "{{resolve:ssm:/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2}}"
      Tags:
        - Key: Name
          Value: !Sub "${EnvironmentName}-ec2"
        - Key: Environment
          Value: !Ref EnvironmentName

Outputs:
  InstanceId:
    Description: EC2 Instance ID
    Value: !Ref EC2Instance
    Export:
      Name: EC2-InstanceId



##############################
NEXT STEP OF THE HANDS ON 
###############################

Create another cloudformation template to use the EC2 instance output from our first deployment( stack) as an input so we can create a cloudwatch alarm . This template will create SNS + use our instance id as input to create CPU Utilization) 



AWSTemplateFormatVersion: '2010-09-09'
Description: Create CloudWatch Alarm for EC2 CPU utilization with SNS email notification

Parameters:
  InstanceId:
    Type: String
    Description: EC2 Instance ID from the VPC/EC2 stack output

  NotificationEmail:
    Type: String
    Description: Email address to receive alarm notifications

  AlarmThreshold:
    Type: Number
    Default: 80
    Description: CPU percentage threshold for alarm

Resources:
  # -------------------------
  # SNS Topic
  # -------------------------
  AlarmSNSTopic:
    Type: AWS::SNS::Topic
    Properties:
      TopicName: ec2-cpu-alarm-topic

  # -------------------------
  # SNS Email Subscription
  # -------------------------
  AlarmEmailSubscription:
    Type: AWS::SNS::Subscription
    Properties:
      Protocol: email
      Endpoint: !Ref NotificationEmail
      TopicArn: !Ref AlarmSNSTopic

  # -------------------------
  # CloudWatch Alarm
  # -------------------------
  EC2HighCPUAlarm:
    Type: AWS::CloudWatch::Alarm
    Properties:
      AlarmName: !Sub "EC2-High-CPU-${InstanceId}"
      AlarmDescription: Alarm when EC2 CPU exceeds threshold
      Namespace: AWS/EC2
      MetricName: CPUUtilization
      Dimensions:
        - Name: InstanceId
          Value: !ImportValue EC2-InstanceId
      Statistic: Average
      Period: 300
      EvaluationPeriods: 1
      Threshold: !Ref AlarmThreshold
      ComparisonOperator: GreaterThanThreshold
      AlarmActions:
        - !Ref AlarmSNSTopic
      OKActions:
        - !Ref AlarmSNSTopic
      InsufficientDataActions:
        - !Ref AlarmSNSTopic
      TreatMissingData: notBreaching

Outputs:
  AlarmName:
    Description: Name of the CloudWatch alarm
    Value: !Ref EC2HighCPUAlarm

  SNSTopicArn:
    Description: SNS Topic ARN for notifications
    Value: !Ref AlarmSNSTopic

