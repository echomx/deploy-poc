#!/bin/sh
mysql -uroot -padminpwd -e "use mysql;delete from user where password=\"\";flush privileges;"
mysql -uroot -padminpwd -e "grant all privileges on *.* to root@'%' identified by 'adminpwd';flush privileges;"