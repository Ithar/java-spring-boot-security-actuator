/*
>  docker container exec -it mysql bash

># mysql -uroot -pmysql_pwd
># use db;
 */

CREATE  TABLE users (
  username VARCHAR(45) NOT NULL ,
  password VARCHAR(60) NOT NULL ,
  active TINYINT NOT NULL DEFAULT 1 ,
  PRIMARY KEY (username));

CREATE TABLE user_roles (
  user_role_id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(45) NOT NULL,
  role varchar(45) NOT NULL,
  PRIMARY KEY (user_role_id),
  UNIQUE KEY uni_username_role (role,username),
  KEY fk_username_idx (username),
  CONSTRAINT fk_username FOREIGN KEY (username) REFERENCES users (username));

INSERT INTO users(username,password,active) VALUES ('Admin','$2a$10$P9LQGD1Q5jYd58i.Jd8ws.9BLMn.vV8LyZwAs9tdmXwfaC67q7muS', true);
INSERT INTO users(username,password,active) VALUES ('Jane','$2a$10$cvs7kNTeVaFbdDSFcVT9ze3muPVSHQMMZTZ89ontNSCRMXT4CmRM2', true);

INSERT INTO user_roles (username, role) VALUES ('Admin', 'ROLE_USER');
INSERT INTO user_roles (username, role) VALUES ('Admin', 'ROLE_ADMIN');
INSERT INTO user_roles (username, role) VALUES ('Jane', 'ROLE_USER');


