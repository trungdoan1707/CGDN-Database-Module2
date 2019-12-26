drop database if exists quan_ly_thu_vien;
create database quan_ly_thu_vien;
use quan_ly_thu_vien;
create table category (
	category_id int primary key,
    category_name nvarchar(50)
);
create table book (
	book_id int primary key,
    book_name nvarchar(50),
    publisher nvarchar(50),
    author nvarchar(50),
    publish_year date,
    publish_time int,
    amount double,
    image nvarchar(255),
    category_id int,
    `status` int,
    -- 1 : co the muon, 0 : khong the muon
    constraint foreign key fk_book_category(category_id) references category(category_id)
);
create table student (
	student_number nvarchar(15) primary key,
    student_name nvarchar(50),
    address nvarchar(500),
    email nvarchar(50),
    image nvarchar(255)
);
create table borrow_order (
	student_number nvarchar(15),
    book_id int,
    start_borrow_date date,
    end_borrow_date date,
	borrow_status boolean, -- 1 la da tra sach, 0 chua tra sach 
    constraint primary key pk_borrow_order(student_number, book_id),
    constraint foreign key fk_borrow_order_book(book_id) references book(book_id)
);

insert into category(category_id,category_name) values(1,'Khoa học tự nhiên');
insert into category(category_id,category_name) values(2,'Xã hội nhân văn');
insert into category(category_id,category_name) values(3,'Lập trình');
insert into category(category_id,category_name) values(4,'Nghệ Thuật');
insert into category(category_id,category_name) values(5,'Lịch Sử');
insert into book(book_id, book_name, publisher, author, publish_year, publish_time, amount, image, category_id, `status`) values (1, 'Toán', 'Kim Đồng', 'Nguyễn Ánh', '2018-01-01',2,20000,'',1,1);
insert into book(book_id, book_name, publisher, author, publish_year, publish_time, amount, image, category_id, `status`) values (2, 'Văn', 'Kim Đồng', 'Nguyễn Ánh', '2018-02-02',1,40000,'',2,1);
insert into book(book_id, book_name, publisher, author, publish_year, publish_time, amount, image, category_id, `status`) values (3, 'Lý', 'Kim Đồng', 'Nguyễn Ánh', '2018-03-03',1,60000,'',1,1);
insert into book(book_id, book_name, publisher, author, publish_year, publish_time, amount, image, category_id, `status`) values (4, 'Java', 'Codegym', 'Nguyên', '2018-03-03',1,60000,'',3,1);
insert into book(book_id, book_name, publisher, author, publish_year, publish_time, amount, image, category_id, `status`) values (5, 'PHP', 'Codegym', 'Nguyên', '2018-03-03',1,60000,'',3,0);
insert into student(student_number, student_name, address, email, image) values (1,'Nguyễn Văn A', 'Đà Nẵng', 'a@a.com','');
insert into student(student_number, student_name, address, email, image) values (2,'Nguyễn Văn B', 'Quảng Nam', 'b@b.com','');
insert into borrow_order(student_number, book_id, start_borrow_date, end_borrow_date,borrow_status) values (1,1,'2019-12-04','2019-12-06',0);
insert into borrow_order(student_number, book_id, start_borrow_date, end_borrow_date,borrow_status) values (2,2,'2019-12-04','2019-12-06',0);
insert into borrow_order(student_number, book_id, start_borrow_date, end_borrow_date,borrow_status) values (3,3,'2019-12-04','2019-12-06',0);
insert into borrow_order(student_number, book_id, start_borrow_date, end_borrow_date,borrow_status) values (3,4,'2019-12-04','2019-12-06',0);
insert into borrow_order(student_number, book_id, start_borrow_date, end_borrow_date,borrow_status) values (3,5,'2019-12-04','2019-12-06',0);

select book_name,publisher,author,publish_year,publish_time,amount,image,category_name 
from book
inner join category on book.category_id=category.category_id;

select book_name,publisher,author,publish_year,publish_time,amount,image,category_name 
from book
inner join category on book.category_id=category.category_id
where category_name="Lập Trình";

select book_name,borrow_status 
from borrow_order
inner join book on borrow_order.book_id=book.book_id
where borrow_status=0;

select student.student_number,student.student_name,borrow_order.borrow_status as still
 from borrow_order
inner join student on borrow_order.student_number=student.student_number
where borrow_order.borrow_status=0
group by student.student_number