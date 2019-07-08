variable "region" {
  default = "us-west-1"
}

variable "profile" {
  default = "terraform"
}

variable "availability_zone" {
  description = "https://www.terraform.io/docs/providers/aws/d/availability_zone.html"
  default     = ""
}

variable "shared_credentials_file" {
  description = "Path to your AWS credentials file"
  type        = string
  default     = "~/.aws/credentials"
}

variable "public_key_name" {
  description = "A name for AWS Keypair to use to auth to helk. Can be anything you specify."
  default     = "linux"
}

variable "public_key_path" {
  description = "Path to the public key to be loaded into the helk authorized_keys file"
  type        = string
  default     = "~/.ssh/linux.pub"
}

variable "private_key_path" {
  description = "Path to the private key to use to authenticate to helk."
  type        = string
  default     = "~/.ssh/linux"
}

variable "ip_whitelist" {
  description = "A list of CIDRs that will be allowed to access the EC2 instances"
  type        = list(string)
  default     = [""]
}

variable "external_dns_servers" {
  description = "Configure lab to allow external DNS resolution"
  type        = list(string)
  default     = ["8.8.8.8"]
}


#Empire AMI
data "aws_ami" "empire_ami" {
  owners = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-20190406"]
  }
}

#Guacamole 
data "aws_ami" "guac_ami" {
  owners = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-20190406"]
  }
}

#HELK Pre-built AMI
data "aws_ami" "helk_ami" {
  owners = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-20190406"]
  }
}
#HFDC1 Pre-built AMI
data "aws_ami" "dc_ami" {
  owners = ["946612485350"]
  filter {
    name   = "name"
    values = ["hfdc1"]
  }
}

#WEC Pre-built AMI
data "aws_ami" "wec_ami" {
  owners = ["946612485350"]
  filter {
    name   = "name"
    values = ["wecserver"]
  }
}

#ACCT001 Pre-built AMI
data "aws_ami" "acct001_ami" {
  owners = ["946612485350"]
  filter {
    name   = "name"
    values = ["acct001"]
  }
}

#IT001 Pre-built AMI
data "aws_ami" "it001_ami" {
  owners = ["946612485350"]
  filter {
    name   = "name"
    values = ["it001"]
  }
}

#HR001 Pre-built AMI
data "aws_ami" "hr001_ami" {
  owners = ["946612485350"]
  filter {
    name   = "name"
    values = ["hr001"]
  }
}




# If you are building your own AMIs you will have replace these values below with your own AMIs. 
# This will also have to be changed if you choose to be in another region besides 'us-west-1'

#Confirmed
variable "guac_ami" {
  type    = string
  default = "ami-0ad16744583f21877"
}

#Confirmed
variable "empire_ami" {
  type    = string
  default = "ami-0ad16744583f21877"
}

#Confirmed
variable "helk_ami" {
  type    = string
  default = "ami-0ad16744583f21877"
}

#Confirmed
variable "dc_ami" {
  type    = string
  default = "ami-0a9f630cf7d44ed1b"
}
variable "wec_ami" {
  type    = string
  default = "ami-099b9481b8cf66940"
}
#Confirmed **Needs to be confirmed with WECServer running together
variable "acct001_ami" {
  type    = string
  default = "ami-05a7b3c7ed8a26c31"
}
variable "hr001_ami" {
  type    = string
  default = "ami-0e59342e26948095d"
}
variable "it001_ami" {
  type    = string
  default = "ami-0c924364d1df53e62"
}