# Architecture Overview

This project describes a highly available AWS web application deployed across two Availability Zones.

Users reach the application through the internet, optionally using Route 53 to resolve a domain name. An internet-facing Application Load Balancer receives HTTP or HTTPS traffic and distributes requests to EC2 web servers in public subnets. The servers run in an Auto Scaling Group across both Availability Zones, and only accept web traffic from the load balancer.

An Amazon RDS MySQL database is provisioned in private subnets. It is not publicly accessible, and its security group allows connections only from the web-server tier. RDS can optionally use Multi-AZ deployment for higher availability. The sample landing page is static and does not yet read from or write to the database.

CloudWatch collects web server logs and monitors EC2 CPU utilization and load balancer target health.