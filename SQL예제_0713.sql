CREATE TABLE tbl_bookrent(
	rent_no number(5) PRIMARY KEY,
	mem_idx number(5) NOT NULL,
	bcode char(5) NOT NULL,
	rent_date date NOT NULL,
	exp_date date NOT NULL,
	return_date date,
	delay_days number(3),
	UNIQUE(mem_idx, bcode)
);

CREATE TABLE book_member(
	mem_idx number(5) PRIMARY KEY,
	name varchar2(20) NOT NULL,
	email varchar2(20) NOT NULL,
	tel varchar2(20),
	password varchar2(10),
	FOREIGN KEY(mem_idx) REFERENCES tbl_bookrent(mem_idx)
);

create table tbl_book(
	bcode char(5) PRIMARY KEY,
	title varchar2(30) NOT NULL,
	writer varchar2(20),
	publisher varchar2(20),
	pdate date,
	FOREIGN KEY(bcode) REFERENCES tbl_bookrent(bcode)
);

CREATE SEQUENCE memidx_seq START WITH 10001;
CREATE SEQUENCE rentno_seq START WITH 1;

INSERT INTO book_member
VALUES(memidx_seq.nextval,'이하니','honey@naver.com','010-9889-0567','1122');
INSERT INTO book_member
VALUES(memidx_seq.nextval,'이세종','jong@daum.net','010-2354-6773','2345');
INSERT INTO book_member
VALUES memidx_seq.nextval,'최행운','lucky@korea.com','010-5467-8792','9876');
INSERT INTO book_member
VALUES memidx_seq.nextval,'나길동','nadong@kkk.net','010-3456-8765','3456');
INSERT INTO book_member
VALUES memidx_seq.nextval,'강감찬','haha@korea.net','010-3987-9087','1234');

insert into tbl_book
values('A1101','코스모스','칼세이건','사이언스북스','2006-12-01');
insert into tbl_book
values('B1101','해커스토익','이해커','해커스랩','2018-07-10');
insert into tbl_book
values('C1101','푸른사자 와니니','이현','창비','2015-06-20');
insert into tbl_book
values('A1102','페스트','알베르트 까뮈','민음사','2011-03-01');

insert into tbl_bookrent(rent_no,mem_idx,bcode,rent_date,exp_date,return_date)
values(rentno_seq.nextval,10001,'B1101','2021-09-01','2021-09-15','2021-09-14');
insert into tbl_bookrent(rent_no,mem_idx,bcode,rent_date,exp_date,return_date)
values(rentno_seq.nextval,10002,'C1101','2021-09-12','2021-09-26','2021-09-29');
insert into tbl_bookrent(rent_no,mem_idx,bcode,rent_date,exp_date,return_date)
values(rentno_seq.nextval,10003,'B1101','2021-09-03','2021-09-17','2021-09-17');
insert into tbl_bookrent(rent_no,mem_idx,bcode,rent_date,exp_date)
values(rentno_seq.nextval,10004,'C1101','2022-06-30','2021-07-14');
insert into tbl_bookrent(rent_no,mem_idx,bcode,rent_date,exp_date)
values(rentno_seq.nextval,10001,'A1101','2022-07-04','2022-07-18');
insert into tbl_bookrent(rent_no,mem_idx,bcode,rent_date,exp_date,return_date)
values(rentno_seq.nextval,10003,'A1102','2022-07-06','2022-07-20','2022-07-13');

select * from tbl_book;
select * from book_member;
select * from tbl_bookrent;