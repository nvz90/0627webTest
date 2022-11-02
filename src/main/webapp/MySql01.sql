create table member(
	id int not null auto_increment,
	name varchar(100) not null,
	passwd varchar(50) not null,
	primary key(id)
);

select * from member;

show tables;

desc member;

insert into member values(88, '홍길저', '1239');
insert into member(name, passwd) values('홍길며', '1244');

select * from member where id=88;

select * from member order by passwd desc;

update member set name='홍홍홍' where name='홍길며';

delete from member where id=1;

delete from member;

create table products(
	productId int(11) not null,
	pname varchar(12) not null,
	unitPrice int not null,
	description varchar(34) not null,
	mnufacturer varchar(12) not null,
	category varchar(10) not null,
	unitsInStock int not null,
	condi varchar(10) not null,
	imageName varchar(24) not null,
	primary key(productId)
);

