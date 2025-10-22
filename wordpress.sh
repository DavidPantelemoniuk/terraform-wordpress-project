#!/bin/bash
# Update and install necessary packages
yum update -y
yum install -y httpd php php-mysqlnd wget unzip

# Enable and start Apache
systemctl enable httpd
systemctl start httpd

# Download and set up WordPress under /blog
cd /var/www/html
wget https://wordpress.org/latest.zip
unzip latest.zip
mv wordpress blog

# Set proper permissions
chown -R apache:apache /var/www/html
chmod -R 755 /var/www/html

# Restart Apache to apply changes
systemctl restart httpd
