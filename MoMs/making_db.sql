/*
execute this file by
logging into server from command line as
mysql --local-infile=1 -u root -p
*/
CREATE DATABASE IF NOT EXISTS Delta;
USE Delta;
CREATE TABLE IF NOT EXISTS MoMs(
    NAME varchar(20),
    DATE_OF_MEET DATE,
    MOM varchar(200)
    );
LOAD DATA LOCAL INFILE '/var/lib/MoMs.txt' INTO TABLE MoMs
COLUMNS TERMINATED BY '|';
CREATE TABLE IF NOT EXISTS Users(
    username varchar(20) ,
    passwd  varchar(20),
    UNIQUE (username)
    );
INSERT INTO Users(username, passwd) VALUES("superuser", "superuserpass");
CREATE USER IF NOT EXISTS 'user'@'localhost' IDENTIFIED BY 'password2';
GRANT SELECT, SHOW VIEW ON Delta.* TO 'user'@'localhost';
FLUSH PRIVILEGES;
