USER EZEN;

CREATE TABLE `USER_INFO` (
  `USER_NUM` int NOT NULL AUTO_INCREMENT,
  `USER_ID` VARCHAR(70) NOT NULL UNIQUE,
  `USER_NAME` varchar(70)  NOT NULL,
  `USER_EMAIL` varchar(40)  NOT NULL,
  `PASSWORD` VARCHAR(200) NOT NULL,
  `ROLE` varchar(45) DEFAULT 'ROLE_USER' ,
  PRIMARY KEY (`USER_NUM`)
);



INSERT INTO USER_INFO(USER_NAME, USER_ID,USER_EMAIL, PASSWORD, ROLE)
VALUES('TEST','TEST','test@test.com','$2a$10$L2MZTl98j51KWWKvCLuRgefrGGHVram//JoBuIz6YHiDbqtaW5yHm','ROLE_ADMIN');

UPDATE USER_INFO
SET USER_NAME='TEST1', USER_EMAIL='test1@test.com'
WHERE USER_ID='TEST';