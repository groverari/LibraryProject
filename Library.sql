CREATE DATABASE db_library;

USE db_library;
GO

create table tbl_branch(
	branch_id int primary key not null identity (1,1),
	branch_name varchar (50) not null,
);

create table tbl_publisher(
	publisher_id int primary key not null identity (100,1),
	publisher_name varchar(30) not null,
);

create table tbl_authors(
	author_id int primary key not null identity(2000,1),
	author_name varchar(50) not null,
);
create table tbl_book(
	book_id int primary key not null identity(1000, 10),
	book_name varchar(50)not null,
	book_publisher int not null constraint fk_publisher_id foreign key references tbl_publisher(publisher_id) on update cascade on delete cascade,
	book_author int not null constraint fk_author_id foreign key references tbl_authors(author_id) on update cascade on delete cascade
);



create table tbl_copies(
	copy_branch int not null constraint fk_branch_id foreign key references tbl_branch(branch_id) on update cascade on delete cascade,
	copy_book int not null constraint fk_book2_id foreign key references tbl_book(book_id) on update cascade on delete cascade,
	copy_num int not null
);
create table tbl_person(
	person_id int primary key not null identity(5000, 1),
	person_name varchar(60) not null,
	person_town varchar(20) not null
);
create table tbl_loan(
	loan_id int primary key not null identity (1,1),
	loan_book int not null constraint fk_book1_id foreign key references tbl_book(book_id) on update cascade on delete cascade,
	loan_branch int not null constraint fk_branch1_id foreign key references tbl_branch(branch_id) on update cascade on delete cascade,
	loan_card int not null constraint fk_person_id foreign key references tbl_person(person_id) on update cascade on delete cascade,
	loan_out date not null,
	loan_return date not null
);

/* ALL THE INSERT STATEMENTS*/

Insert into tbl_branch (branch_name)
	values
	('Sharpstown'),
	('Scranton'),
	('New York'),
	('Central')
	;

Insert into tbl_publisher (publisher_name)
	values
	('Penguin'),
	('Random House')
	;
insert into tbl_authors (author_name)
	values
	('Ariesh Grover'),
	('Jesus My Man'),
	('Morgan Freeman'),
	('Mark Twain'),
	('Jesus Garcia'),
	('Eminem'),
	('J.K. Rowling'),
	('Kanye West'),
	('Anish Patel'),
	('Gabby A.'),
	('Stephen King');

/*drop table tbl_loan, tbl_copies,  tbl_book, tbl_authors, tbl_person,  tbl_branch,tbl_publisher*/
Insert into tbl_book (book_name, book_publisher, book_author)
	values
	('The Lost Tribe',100,2001),
	('The Found Tribe',101,2002),
	('The Boring Tribe',100,2003),
	('The LIT Tribe',101,2004),
	('Baby Josh Goes to the Mall',101,2005),
	('Anish Gets Shit Faced',100,2006),
	('Anish Has to Throw Up',101,2007),
	('Ariesh Saves the Day',100,2010),
	('Anish loves Ariesh',101,2009),
	('Anish is Thankful towards Ariesh',100,2000),
	('Martha be a lil bitch',101,2001),
	('Shaiva be a lil hoe',100,2002),
	('Gabby be crazy',101,2003),
	('Ariesh: Santas helper',101,2004),
	('Ariesh Goes to Church',100,2005),
	('Ariesh studies all day',101,2006),
	('Ariesh get a 4.0',100,2007),
	('Ariesh gets rich',101,2008),
	('Ariesh Dies',100,2009),
	('Anish dies out of respect',101,2000);

insert into tbl_copies (copy_book, copy_branch, copy_num)
	values
	(1000,1,3),
	(1010,1,2),
	(1020,1,4),
	(1030,1,3),
	(1040,1,2),
	(1050,1,4),
	(1060,1,3),
	(1070,1,2),
	(1080,1,4),
	(1090,1,3),
	(1100,1,2),
	(1110,1,4),
	(1120,1,3),
	(1130,1,2),
	(1150,1,4),
	(1160,1,3),
	(1170,1,2),
	(1180,1,4),
	(1190,1,3),
	(1140,1,2),
	(1000,2,3),
	(1010,2,2),
	(1020,2,4),
	(1030,2,3),
	(1040,2,2),
	(1050,2,4),
	(1060,2,3),
	(1070,2,2),
	(1080,2,4),
	(1090,2,3),
	(1100,2,2),
	(1110,2,4),
	(1120,2,3),
	(1130,2,2),
	(1150,2,4),
	(1160,2,3),
	(1170,2,2),
	(1180,2,4),
	(1190,2,3),
	(1140,2,2),
	(1000,3,3),
	(1010,3,2),
	(1020,3,4),
	(1030,3,3),
	(1040,3,2),
	(1050,3,4),
	(1060,3,3),
	(1070,3,2),
	(1080,3,4),
	(1090,3,3),
	(1100,3,2),
	(1110,3,4),
	(1120,3,3),
	(1130,3,2),
	(1150,3,4),
	(1160,3,3),
	(1170,3,2),
	(1180,3,4),
	(1190,3,3),
	(1140,3,2),
	(1000,4,3),
	(1010,4,2),
	(1020,4,4),
	(1030,4,3),
	(1040,4,2),
	(1050,4,4),
	(1060,4,3),
	(1070,4,2),
	(1080,4,4),
	(1090,4,3),
	(1100,4,2),
	(1110,4,4),
	(1120,4,3),
	(1130,4,2),
	(1150,4,4),
	(1160,4,3),
	(1170,4,2),
	(1180,4,4),
	(1190,4,3),
	(1140,4,2);

insert into tbl_person (person_name, person_town) values 
('Jeff Bezos','Seattle'),
('Bill Gates','Dullvile'),
('Warren Buffet','Sharpstown'),
('Jane Doe', 'New York'),
('Bernard Anault','Paris'),
('Mark Zuckerberg','Boston'),
('Amancio Ortega','Barcelona'),
('Charles Koch','New York'),
('Larry Ellison','Singapore');

insert into tbl_loan (loan_book, loan_branch, loan_card, loan_out, loan_return)
	values
	(1000,1,5000,'2018-08-12', '2018-09-03'),
	(1010,4,5000,'2018-08-12', '2018-09-03'),
	(1020,4,5000,'2018-08-12', '2018-09-03'),
	(1030,3,5000,'2018-08-12', '2018-09-03'),
	(1040,2,5000,'2018-08-12', '2018-09-03'),
	(1050,1,5000,'2018-08-12', '2018-09-03'),
	(1060,3,5000,'2018-08-12', '2018-09-03'),
	(1070,3,5001,'2018-08-12', '2018-09-03'),
	(1080,2,5001,'2018-08-12', '2018-09-03'),
	(1090,1,5001,'2018-08-12', '2018-09-03'),
	(1100,4,5001,'2018-08-12', '2018-09-03'),
	(1120,3,5001,'2018-08-12', '2018-09-03'),
	(1130,2,5001,'2018-08-12', '2018-09-03'),
	(1140,1,5001,'2018-08-12', '2018-09-03'),
	(1150,4,5002,'2018-08-12', '2018-09-03'),
	(1160,1,5002,'2018-08-12', '2018-09-03'),
	(1170,2,5002,'2018-08-12', '2018-09-03'),
	(1180,3,5002,'2018-08-12', '2018-09-03'),
	(1190,4,5002,'2018-08-12', '2018-09-03'),
	(1000,3,5002,'2018-08-12', '2018-09-03'),
	(1010,2,5003,'2018-08-12', '2018-09-03'),
	(1020,1,5003,'2018-08-12', '2018-09-03'),
	(1030,4,5003,'2018-08-12', '2018-09-03'),
	(1040,3,5003,'2018-08-12', '2018-09-03'),
	(1050,2,5003,'2018-08-12', '2018-09-03'),
	(1060,1,5003,'2018-08-12', '2018-09-03'),
	(1070,4,5004,'2018-08-12', '2018-09-03'),
	(1080,3,5004,'2018-08-12', '2018-09-03'),
	(1090,3,5004,'2018-08-12', '2018-09-03'),
	(1100,2,5004,'2018-08-12', '2018-09-03'),
	(1120,1,5004,'2018-08-12', '2018-09-03'),
	(1130,4,5004,'2018-08-12', '2018-09-03'),
	(1140,3,5005,'2018-08-12', '2018-09-03'),
	(1150,2,5005,'2018-08-12', '2018-09-03'),
	(1160,1,5005,'2018-08-12', '2018-09-03'),
	(1170,4,5005,'2018-08-12', '2018-09-03'),
	(1180,3,5005,'2018-08-12', '2018-09-03'),
	(1190,3,5005,'2018-08-12', '2018-09-03'),
	(1000,2,5006,'2018-08-12', '2018-09-03'),
	(1010,1,5006,'2018-08-12', '2018-09-03'),
	(1020,4,5006,'2018-08-12', '2018-09-03'),
	(1030,3,5006,'2018-08-12', '2018-09-03'),
	(1040,2,5006,'2018-08-12', '2018-09-03'),
	(1050,2,5006,'2018-08-12', '2018-09-03'),
	(1060,1,5007,'2018-08-12', '2018-09-03'),
	(1070,4,5007,'2018-08-12', '2018-09-03'),
	(1080,3,5007,'2018-08-12', '2018-09-03'),
	(1090,2,5007,'2018-08-12', '2018-09-03'),
	(1100,1,5007,'2018-08-12', '2018-09-03'),
	(1030,1,5002,'2018-08-01','2018-08-22'),
	(1090,4,5007,'2018-08-12', '2018-09-03');


	/*ALL THE STORED PROCEDURES*/


create proc dbo.getSharpstownLostTribe
As
begin
	Select a2.book_name as 'Title', a3.branch_name as 'branch', a1.copy_num as 'Number of Copies' from tbl_copies a1
		inner join tbl_book a2 on a2.book_id = a1.copy_book
		inner join tbl_branch a3 on a3.branch_id = a1.copy_branch
		where a2.book_name = 'The Lost Tribe' and a3.branch_name = 'Sharpstown';
end


create proc dbo.getLostTribe
As
begin
	Select a2.book_name as 'Title', a3.branch_name as 'branch', a1.copy_num as 'Number of Copies' from tbl_copies a1
		inner join tbl_book a2 on a2.book_id = a1.copy_book
		inner join tbl_branch a3 on a3.branch_id = a1.copy_branch
		where a2.book_name = 'The Lost Tribe' ;
end

create proc dbo.getNoBorrower
as
	Select person_name from tbl_person
WHERE   person_id NOT IN (SELECT loan_card FROM tbl_loan)
go

create proc dbo.getDueToday
as
	select a2.book_name as 'Book Title', a3.branch_name as 'Branch',
	a4.person_name as'Borrower' from tbl_loan a1
	inner join tbl_book a2 on a2.book_id = a1.loan_book
	inner join tbl_branch a3 on a3.branch_id = a1.loan_branch
	inner join tbl_person a4 on a4.person_id = a1.loan_card
	where loan_return = CONVERT(date, getdate());
go

create proc dbo.getDueTodaySharpstown
as
	select a2.book_name as 'Book Title', a3.branch_name as 'Branch',
	a4.person_name as'Borrower' from tbl_loan a1
	inner join tbl_book a2 on a2.book_id = a1.loan_book
	inner join tbl_branch a3 on a3.branch_id = a1.loan_branch
	inner join tbl_person a4 on a4.person_id = a1.loan_card
	where loan_return = CONVERT(date, getdate()) and a3.branch_name = 'Sharpstown';
go


create proc dbo.getBookLoaned
as
	Create Table tbl_totalBooksOut(
	out_branch int not null constraint fk_branch4_id foreign key references tbl_branch(branch_id) on update cascade on delete cascade,
	out_numBooks int
	)
		declare @num int;
	set @num = (select count(distinct loan_id) from  tbl_loan where loan_branch = 1);
	
	insert into tbl_totalBooksOut (out_branch, out_numBooks)
	values
	(1,(select count(distinct loan_id)as 'books out' from tbl_loan where loan_branch = 1)),
	(2,(select count(distinct loan_id)as 'books out' from tbl_loan where loan_branch = 2)),
	(3,(select count(distinct loan_id)as 'books out' from tbl_loan where loan_branch = 3)),
	(4,(select count(distinct loan_id)as 'books out' from tbl_loan where loan_branch = 4));
	
	select a2.branch_name as 'Branch', a1.out_numBooks as 'Total Books Out'
	from tbl_totalBooksOut a1
	 inner join tbl_branch a2  on a2.branch_id = a1.out_branch;

	 drop table tbl_totalBooksOut;

go

create proc getBorrowers
as

	create table temp(
		person int not null constraint fk_person2_id foreign key references tbl_person(person_id) on update cascade on delete cascade,
		books int
	);

	insert into temp (person, books) values
	(5000, (select count(distinct loan_id) from tbl_loan where loan_card = 5000)),
	(5001, (select count(distinct loan_id) from tbl_loan where loan_card = 5001)),
	(5002, (select count(distinct loan_id) from tbl_loan where loan_card = 5002)),
	(5003, (select count(distinct loan_id) from tbl_loan where loan_card = 5003)),
	(5004, (select count(distinct loan_id) from tbl_loan where loan_card = 5004)),
	(5005, (select count(distinct loan_id) from tbl_loan where loan_card = 5005)),
	(5006, (select count(distinct loan_id) from tbl_loan where loan_card = 5006)),
	(5007, (select count(distinct loan_id) from tbl_loan where loan_card = 5007)),
	(5008, (select count(distinct loan_id) from tbl_loan where loan_card = 5008));

	select a2.person_name, a2.person_town, a1.books from temp a1
		inner join tbl_person a2 on a2.person_id = a1.person
		where books > 5;

	drop table temp;
go

create proc findKing
as
		create table temp(
		book int not null constraint fk_books2_id foreign key references tbl_book(book_id) on update cascade on delete cascade,
		num int
	);

	insert into temp (book, num)
	values (1070,(
	select count(distinct loan_book)  from tbl_loan a1
	inner join tbl_book a2 on a2.book_id = a1.loan_book
	inner join tbl_authors a3 on a3.author_id = a2.book_author
	where loan_branch = 4 and a3.author_name = 'Stephen King'));

	select a2.book_name as 'title', num as 'Number of Copies' from temp a1
		inner join tbl_book a2 on a2.book_id = a1.book;


		drop table temp;
go

