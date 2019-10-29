create table board(
	num int primary key,
	name varchar(30),
	pass varchar(20),
	subject varchar(100),
	content varchar(4000),
	file1 varchar(100),
	regdate datetime,
	readcnt int(10),
	grp int,
	grplevel int(3),
	grpstep int(5)
)