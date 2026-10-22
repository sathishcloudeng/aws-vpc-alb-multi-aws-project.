Overview

This project demonstrates a highly available web application architecture on AWS, built manually through the AWS Console in the Asia Pacific (Mumbai) region.

Two Nginx web servers run on EC2 instances in separate Availability Zones inside a custom VPC (10.0.0.0/24). An Application Load Balancer receives internet traffic and distributes it across both servers through a target group with health checks. A second, isolated VPC (11.0.0.0/24) hosts a private backend server with no internet gateway, reachable only through a VPC peering connection with updated route tables on both sides.

Key highlights:

- Custom VPC with public subnets across two Availability Zones
- Application Load Balancer with target group health checks
- Layered Security Groups: the web servers accept HTTP only from the ALB
- EC2 web servers bootstrapped with User Data (Nginx)
- VPC peering between two VPCs with routing configured on both sides
- Private connectivity verified with an ICMP ping from the web tier to the backend

Tech used: AWS VPC, EC2, Application Load Balancer, Target Groups, Security Groups, VPC Peering, Route Tables, Amazon Linux 2023, Nginx
