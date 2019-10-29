create table member(
	id varchar(20) primary key,
	pass varchar(20),
	name varchar(20),
	gender int(1),
	tel varchar(50),
	email varchar(100),
	picture varchar(200)
)

alter table member add email varchar(100)