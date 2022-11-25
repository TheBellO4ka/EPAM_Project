#!/bin/bash
yum -y update
yum -y install httpd


myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`

cat <<EOF > /var/www/html/index.html
<html>
<head>
<title>Page Title</title>
</head>
<body bgcolor="black">

<h2><font color="gold">Build by Power of Terraform</h2><br><p>
<font color="green">Serber PivateIP: <font color="aqua">$myip<br><br>

<font color="magenta">
<b>Version 3.0</b>
</body>
</html>
EOF

sudo service httpd start
chkconfig httpd on