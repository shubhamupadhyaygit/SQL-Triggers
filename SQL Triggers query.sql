
#### Before trigger

create table passangers
( Name VARCHAR(20),
id int(10),
address VARCHAR(20),
charges int(10),
PRIMARY KEY(id));


select * from passengers;
-- RENAME TABLE passangers TO passengers;



INSERT INTO passengers (Name, id, address, charges) 
VALUES 
('John Doe', 1, '123 Main St', 50),
('Jane Smith', 2, '456 Elm St', 75),
('Alice Johnson', 3, '789 Oak St', 100),
('Bob Brown', 4, '321 Pine St', 60),
('Emily Davis', 5, '654 Maple St', 80),
('Michael Wilson', 6, '987 Birch St', 90),
('Sarah Lee', 7, '234 Cedar St', 70),
('David Miller', 8, '567 Walnut St', 55),
('Emma Taylor', 9, '876 Spruce St', 85),
('James Garcia', 10, '109 Cherry St', 65);


## Creating a brfore insert trigger
CREATE TRIGGER flight
BEFORE INSERT
ON passengers
FOR EACH ROW
SET NEW.charges = NEW.charges - 20;


INSERT INTO passengers (Name, id, address, charges) 
VALUES ('Alice Smith', 11, '456 Pine St', 70);


##### After trigger

create table colstu
( id int(10),
Name VARCHAR(20),
Age int(10),
PRIMARY KEY(id));


create table audstu
( id int(10),
PRIMARY KEY(id),
auditdescr VARCHAR(500));


CREATE TRIGGER after_ins
AFTER INSERT ON colstu
FOR EACH ROW
INSERT INTO audstu VALUES(1,concat(' insert a new row ',date_format(now(), '%d-%m-%y %h:%i:%s %p')));


INSERT INTO colstu VALUES(1,'Shubham',23);


select * from colstu;
select * from audstu;


## Before update trigger
CREATE TABLE workers(
id int(10),
name VARCHAR(10),
income int(10),
PRIMARY KEY(id));

insert into workers values(
1,'Manish',100000);

select * from workers;

-- DELIMITER //
-- CREATE TRIGGER befup
-- BEFORE UPDATE
-- ON workers 
-- FOR EACH ROW
-- BEGIN
-- IF NEW.income < 12000 THEN
-- SET NEW.income = 12000;
-- end if;
-- end;


UPDATE workers SET income = 11000 where id = 1;


select * from workers;


CREATE table auditemp
(id int(10),
auddesc VARCHAR(1000),
PRIMARY key(id));

select * from auditemp;


CREATE TRIGGER afteup
AFTER UPDATE
ON workers 
FOR EACH ROW
INSERT INTO auditemp VALUES(10,concat(' updated at new row ',
date_format(now(), '%d-%m-%y %h:%i:%s %p')));


INSERT INTO workers VALUES
(2,'Shubham',90000);

select * from workers;

UPDATE workers SET income = 42000 where id = 2;


select * from auditemp; 


