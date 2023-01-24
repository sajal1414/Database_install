#!/bin/bash

# Check if Docker is installed

if ! [ -x "$(command -v docker)" ]; then
	echo 'Docker is not installed. Do you want to install it(The installation depends on docker)? (yes/no)'
  read install_docker
  if [ "$install_docker" == "yes" ]; then
    echo 'Installing Docker...'
    sudo apt-get update
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    echo 'Docker has been installed.'
  else
    echo 'Exiting script as Docker is not installed.'
    exit 1
  fi
else
  echo 'Docker is already installed.'
fi


echo "Do you want to install MySQL? (yes/no)"
read mysql

if [ "$mysql" == "yes" ]; then
  echo "Creating mysql directory"
  sudo mkdir -p /home/ubuntu/mysql
  chmod 777 /home/ubuntu/mysql
  echo "Installing MySQL..."
  sudo docker pull mysql
  sudo docker run --name mysql-container -p 3306:3306 -v /home/ubuntu/mysql:/etc/mysql/conf.d -e MYSQL_ROOT_PASSWORD=Nfolks12345 -d mysql
  echo "MySQL installation complete."
  echo "MySQL Connection Info: "
  echo "Port: 3306"
  echo "Default Database: N/A (create your own database)"
  echo "User: root"
  echo "Password: Nfolks12345"
else
  echo "Skipping MySQL installation."
fi

echo "Do you want to install Postgres? (yes/no)"
read postgres

if [ "$postgres" == "yes" ]; then
  echo "Creating postgres directory"
  sudo mkdir -p /home/ubuntu/postgres
  chmod 777 /home/ubuntu/postgres
  echo "Installing Postgres..."
  docker pull postgres
  docker run --name some-postgres -p 5432:5432 -e POSTGRES_PASSWORD=Nfolks12345 -v /home/ubuntu/postgres:/var/lib/postgresql/data --restart always -d postgres
  echo "Postgres installation complete."
  echo "Postgres Connection Info: "
  echo "Port: 5432"
  echo "Default Database: postgres"
  echo "User: postgres"
  echo "Password: Nfolks12345"
else
  echo "Skipping Postgres installation."
fi

echo "Do you want to install Mongo? (yes/no)"
read mongo

if [ "$mongo" == "yes" ]; then
  echo "Creating mongo directory"
  sudo mkdir -p /home/ubuntu/mongo
  chmod 777 /home/ubuntu/mongo
  echo "Installing Mongo..."
  docker pull mongo
  docker run --name my-mongo -d -p 27017:27017 -v /home/ubuntu/mongo:/data/db mongo
  echo "Mongo installation complete."
  echo "Mongo Connection Info: "
  echo "Port: 27017"
  echo "Default Database: test (create your own database)"
  echo "User: N/A (create your own user)"
  echo "Password: N/A (create your own password)"
else
  echo "Skipping Mongo installation."
fi

echo "Do you want to install Oracle XE? (yes/no)"
read oracle

if [ "$oracle" == "yes" ]; then
  echo "Creating oracle directory"
  sudo mkdir -p /home/ubuntu/oracle
  chmod 777 /home/ubuntu/oracle
  echo "Installing Oracle XE..."
  docker pull gvenzl/oracle-xe
  docker run -d -p 1521:1521 -e ORACLE_PASSWORD=Nfolks12345 -v /home/ubuntu/oracle:/opt/oracle/oradata gvenzl/oracle-xe
  echo "Oracle XE installation complete."
  echo "Oracle XE Connection Info: "
  echo "Port: 1521"
  echo "Service Name: XEPDB1"
  echo "Default Database: XE (create your own schema)"
  echo "User: system"
  echo "Password: Nfolks12345"
else
  echo "Skipping Oracle XE installation."
fi

echo "Do you want to install MS SQL Server? (yes/no)"
read mssql

if [ "$mssql" == "yes" ]; then
  echo "Creating mssql directory"
  sudo mkdir -p /home/ubuntu/mssql
  chmod 777 /home/ubuntu/mssql
  echo "Installing MS SQL Server..."
  docker pull mcr.microsoft.com/mssql/server:latest
  docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=Nfolks12345' -p 1433:1433 -v /home/ubuntu/mssql:/var/opt/mssql --name sql1 -d  mcr.microsoft.com/mssql/server:latest
  echo "MS SQL Server installation complete."
  echo "MS SQL Server Connection Info: "
  echo "Port: 1433"
  echo "Default Database: master"
  echo "User: sa"
  echo "Password: Nfolks12345"
else
  echo "Skipping MS SQL Server installation."
fi


echo "Do you want to install Cassandra? (yes/no)"
read cassandra

if [ "$cassandra" == "yes" ]; then
  echo "Creating Cassandra directory"
  sudo mkdir -p /home/ubuntu/cassandra
  chmod 777 /home/ubuntu/cassandra
  echo "Installing Cassandra..."
  docker pull cassandra
  docker run --name my_cassandra -d -p 9042:9042 -v /home/ubuntu/cassandra:/var/lib/cassandra cassandra:latest
  echo "Cassandra installation complete."
  echo "Cassandra Connection Info: "
  echo "Port: 9042"
  echo "Default Database: N/A (create your own keyspace)"
  echo "User: N/A (create your own user)"
  echo "Password: N/A (create your own password)"
else
  echo "Skipping Cassandra installation."
fi

echo "Do you want to install Mariadb? (yes/no)"
read mariadb

if [ "$mariadb" == "yes" ]; then
  echo "Creating Mariadb directory"
  sudo mkdir -p /home/ubuntu/mariadb
  chmod 777 /home/ubuntu/mariadb
  echo "Installing Mariadb..."
  sudo docker pull mariadb
  sudo docker run --name mariadb -p 3307:3306 -e MYSQL_ROOT_PASSWORD=Nfolks12345 -v /home/ubuntu/mariadb:/var/lib/mysql -d mariadb
  echo "Mariadb installation complete."
  echo "Mariadb Connection Info: "
  echo "Port: 3307"
  echo "Default Database: N/A (create your own database)"
  echo "User: root"
  echo "Password: Nfolks12345"
else
  echo "Skipping Mariadb installation."
fi

echo "Do you want to install Redis? (yes/no)"
read redis

if [ "$redis" == "yes" ]; then
  echo "Creating Redis directory"
  sudo mkdir -p /home/ubuntu/redis
  chmod 777 /home/ubuntu/redis
  echo "Installing Redis..."
  docker pull redis
  sudo docker run --name redis -p 6379:6379 -v /home/ubuntu/redis:/data -d redis
  echo "Redis installation complete."
  echo "Redis Connection Info: "
  echo "Port: 6379"
  echo "Default Database: N/A (create your own database)"
  echo "User: N/A (redis does not require a user)"
  echo "Password: N/A (redis does not require a password)"
else
  echo "Skipping Redis installation."
fi

echo "Do you want to install IBM DB2? (yes/no)"
read db2

if [ "$db2" == "yes" ]; then
  echo "Creating IBM DB2 directory"
  sudo mkdir -p /home/ubuntu/db2
  chmod 777 /home/ubuntu/db2
  echo "Installing IBM DB2..."
  docker pull ibmcom/db2
  docker run -itd --name mydb2 --privileged=true -p 50000:50000 -e LICENSE=accept -e DB2INST1_PASSWORD=db2inst1 -e DBNAME=xmeta -v /home/ubuntu/db2:/database ibmcom/db2
  echo "IBM DB2 installation complete."
  echo "IBM DB2 Connection Info: "
  echo "Port: 50000"
  echo "Default Database: xmeta"
  echo "User: db2inst1"
  echo "Password: db2inst1"
else
  echo "Skipping IBM DB2 installation."
fi

