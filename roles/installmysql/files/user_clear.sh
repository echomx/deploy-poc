#!/bin/sh
mysql -uroot -padminpwd -e "use mysql;delete from user where password=\"\";flush privileges;"

