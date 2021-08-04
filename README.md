# Getting Started


### Step-1 :  Starting all containers 
         sudo docker-compose up
### Creating database of MoMs
### Step-2 : starting bash terminal in mysql container 
         sudo docker exec -it <container_id_of_mysql_container> bash

### Step-3 : Now, to enter into mysql command line  enter command
         mysql -u root -ppassworddelta

### Step-4 : Setting local_infile = true by entering query
         SET GLOBAL local_infile=true; exit;

### Step-5 : logging in 
         mysql --local-infile=1 -u root -ppassworddelta

### Step-6: executing .sql file
         source /var/lib/making_db.sql

# for Task-2B

### Step-7: executing hostConf.sh to enable reverse proxy on host
         ./hostConf.sh 
### Username to login is superuser
### Password - superuserpass
