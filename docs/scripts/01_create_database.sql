CREATE SCHEMA
`db_tiendaonline` ;
-- Mysql < 8
CREATE USER 'sysadmin'@'%' IDENTIFIED BY 'sysadmin@2020';
-- Mysql >= 8
-- CREATE USER 'sysadmin'@'%' IDENTIFIED WITH mysql_native_password BY 'sysadmin@2020';
GRANT ALL ON db_tiendaonline.* TO 'sysadmin'@'%';
