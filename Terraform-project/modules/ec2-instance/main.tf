locals {
  ami_catalog = {
    "amazon-linux-2023:x86_64" = { owners = ["amazon"], name = "al2023-ami-2023.*-x86_64" }
    "amazon-linux-2023:arm64"  = { owners = ["amazon"], name = "al2023-ami-2023.*-arm64" }
    "amazon-linux-2:x86_64"    = { owners = ["amazon"], name = "amzn2-ami-hvm-*-x86_64-gp2" }
    "amazon-linux-2:arm64"     = { owners = ["amazon"], name = "amzn2-ami-hvm-*-arm64-gp2" }
    "ubuntu-24.04:x86_64"      = { owners = ["099720109477"], name = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*" }
    "ubuntu-24.04:arm64"       = { owners = ["099720109477"], name = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-arm64-server-*" }
    "ubuntu-22.04:x86_64"      = { owners = ["099720109477"], name = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*" }
    "ubuntu-22.04:arm64"       = { owners = ["099720109477"], name = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-arm64-server-*" }
    "debian-12:x86_64"         = { owners = ["136693071363"], name = "debian-12-amd64-*" }
    "debian-12:arm64"          = { owners = ["136693071363"], name = "debian-12-arm64-*" }
    "rhel-9:x86_64"            = { owners = ["309956199498"], name = "RHEL-9.*_HVM-*-x86_64-*-Hourly2-GP3" }
    "rhel-9:arm64"             = { owners = ["309956199498"], name = "RHEL-9.*_HVM-*-arm64-*-Hourly2-GP3" }
  }

  ami_key      = "${var.distribution}:${var.architecture}"
  selected_ami = local.ami_catalog[local.ami_key]
  common_tags  = merge(var.tags, { Name = var.name })
}

data "aws_ami" "selected" {
  count       = var.ami_id == null ? 1 : 0
  most_recent = true
  owners      = local.selected_ami.owners

  filter {
    name   = "name"
    values = [local.selected_ami.name]
  }

  filter {
    name   = "architecture"
    values = [var.architecture]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "this" {
  ami                         = var.ami_id != null ? var.ami_id : data.aws_ami.selected[0].id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  associate_public_ip_address = var.associate_public_ip_address
  key_name                    = var.key_name
  iam_instance_profile        = var.iam_instance_profile
  user_data                   = var.user_data
  user_data_replace_on_change = var.user_data_replace_on_change
  monitoring                  = var.detailed_monitoring
  disable_api_termination     = var.disable_api_termination
  ebs_optimized               = var.ebs_optimized

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = var.require_imdsv2 ? "required" : "optional"
    http_put_response_hop_limit = var.metadata_hop_limit
    instance_metadata_tags      = var.instance_metadata_tags ? "enabled" : "disabled"
  }

  root_block_device {
    volume_type           = var.root_volume_type
    volume_size           = var.root_volume_size
    iops                  = contains(["gp3", "io1", "io2"], var.root_volume_type) ? var.root_volume_iops : null
    throughput            = var.root_volume_type == "gp3" ? var.root_volume_throughput : null
    encrypted             = var.root_volume_encrypted
    kms_key_id            = var.root_volume_kms_key_id
    delete_on_termination = true
    tags                  = merge(var.tags, { Name = "${var.name}-root" })
  }

  tags = local.common_tags

  lifecycle {
    precondition {
      condition     = var.ami_id != null || contains(keys(local.ami_catalog), local.ami_key)
      error_message = "Unsupported distribution/architecture combination. Use a documented combination or supply ami_id."
    }
  }
}
