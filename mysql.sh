# command for starting up local mysql database
docker run -d --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=password mysql
