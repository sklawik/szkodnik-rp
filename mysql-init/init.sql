CREATE DATABASE IF NOT EXISTS szkodnikrp;

CREATE USER IF NOT EXISTS 'samp'@'%' IDENTIFIED WITH mysql_native_password BY 'example';

GRANT ALL PRIVILEGES ON szkodnikrp.* TO 'samp'@'%';

FLUSH PRIVILEGES;
