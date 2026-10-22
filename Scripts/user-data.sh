#!/bin/bash
# EC2 User Data script - Amazon Linux 2023
# Installs Nginx and serves a simple page so the ALB can show
# which web server handled the request.
#
# IMPORTANT: change SERVER_NAME to "Server 1" on the first
# instance and "Server 2" on the second instance.

SERVER_NAME="Server 1"

# Update OS packages
dnf update -y

# Install and start Nginx
dnf install -y nginx
systemctl enable nginx
systemctl start nginx

# Create the web page shown through the Load Balancer
cat > /usr/share/nginx/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
  <title>AWS ALB Project</title>
</head>
<body>
  <h3>Application Artifact Deployed Successfully on ${SERVER_NAME}</h3>
</body>
</html>
EOF

# Restart Nginx to make sure the new page is served
systemctl restart nginx
