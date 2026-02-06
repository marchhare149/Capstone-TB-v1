#!/bin/bash
yum update -y
amazon-linux-extras install php8.0 -y
yum install -y httpd mysql

systemctl start httpd
systemctl enable httpd

cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
chown -R apache:apache wordpress
chmod -R 755 wordpress

cp wordpress/wp-config-sample.php wordpress/wp-config.php

sed -i "s/database_name_here/wordpress/" wordpress/wp-config.php
sed -i "s/username_here/wpuser/" wordpress/wp-config.php
sed -i "s/password_here/wpPassword123!/" wordpress/wp-config.php
sed -i "s/localhost/wordpress-db.chy6uimi0gsm.us-west-2.rds.amazonaws.com/" wordpress/wp-config.php

systemctl restart httpd
