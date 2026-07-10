
resource "aws_instance" "bastion_host" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = var.key_name

  tags = {
    Name        = "terraform-handson-bastion-host"
    Environment = var.environment
    Role        = "bastion"
  }
}

resource "aws_cloudwatch_metric_alarm" "bastion_high_cpu" {
  count = var.create_cloudwatch_alarm ? 1 : 0

  alarm_name          = "${var.environment}-bastion-high-cpu"
  alarm_description   = "Alerts when bastion host CPU utilization exceeds ${var.cpu_alarm_threshold_percent}%"
  namespace           = "AWS/EC2"
  metric_name         = "CPUUtilization"
  statistic           = "Average"
  period              = 300
  evaluation_periods  = 2
  threshold           = var.cpu_alarm_threshold_percent
  comparison_operator = "GreaterThanThreshold"
  treat_missing_data  = "notBreaching"

  dimensions = {
    InstanceId = aws_instance.bastion_host.id
  }

  tags = {
    Environment = var.environment
    Role        = "bastion"
  }
}
