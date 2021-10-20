-- 비밀번호 : 1234
INSERT INTO MEMBER 
VALUES ('admin', '$2a$10$ojddmdgWHqdD.sx7Xy7Wr.QqEkyIS3sEG.V57zQWSSnBYwG/Zo.kG', '관리자', '컨트롤타워', '서울시 강남구 역삼동', 'admin@donet.com', '010-0000-0000', '1989-12-23', 'D', DEFAULT, SYSDATE, SYSDATE, 0);
INSERT INTO MEMBER 
VALUES ('user01', '$2a$10$ojddmdgWHqdD.sx7Xy7Wr.QqEkyIS3sEG.V57zQWSSnBYwG/Zo.kG', '유저1', '첫회원', '서울시 강남구 역삼동', 'user01@donet.com', '010-1111-1111', '1990-11-21', DEFAULT, DEFAULT, SYSDATE, SYSDATE, 0);
INSERT INTO MEMBER 
VALUES ('user02', '$2a$10$ojddmdgWHqdD.sx7Xy7Wr.QqEkyIS3sEG.V57zQWSSnBYwG/Zo.kG', '유저2', '두번째회원', '서울시 강남구 역삼동', 'user02@donet.com', '010-2222-2222', '1995-12-25', DEFAULT, DEFAULT, SYSDATE, SYSDATE, 0);
INSERT INTO MEMBER 
VALUES ('user03', '$2a$10$ojddmdgWHqdD.sx7Xy7Wr.QqEkyIS3sEG.V57zQWSSnBYwG/Zo.kG', '대한동물협회', '대한동물협회', '서울시 강남구 역삼동', 'user03@donet.com', '010-3333-2121', '1995-12-25', DEFAULT, DEFAULT, SYSDATE, SYSDATE, 0);

select * from member;

insert into funding_category values(0,'기타');
insert into funding_category values(1,'동물');
insert into funding_category values(2,'재난');
insert into funding_category values(3,'고아');

insert into funding_project 
values (1,'유기견을 향한 마음','user03',1000000,2400000,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);
insert into funding_project 
values (2,'유기견을 향한 마음','user03',1000000,default,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);
insert into funding_project 
values (3,'유기견을 향한 마음','user03',1000000,1000000,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);
insert into funding_project 
values (4,'유기견을 향한 마음','user03',1000000,1000,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);
insert into funding_project 
values (5,'유기견을 향한 마음','user03',1000000,30000,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);
insert into funding_project 
values (6,'유기견을 향한 마음','user03',4000000,2300000,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);
insert into funding_project 
values (7,'유기견을 향한 마음','user03',1000000,default,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);
insert into funding_project 
values (8,'유기견을 향한 마음','user03',1000000,default,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);
insert into funding_project 
values (9,'유기견을 향한 마음','user03',1000000,default,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);
insert into funding_project 
values (10,'유기견을 향한 마음','user03',1000000,default,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);
insert into funding_project 
values (11,'유기견을 향한 마음','user03',1000000,default,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);
insert into funding_project 
values (12,'유기견을 향한 마음','user03',1000000,default,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);
insert into funding_project 
values (13,'유기견을 향한 마음','user03',1000000,default,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);
insert into funding_project 
values (14,'유기견을 향한 마음','user03',1000000,3000000,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);
insert into funding_project 
values (15,'유기견을 향한 마음','user03',15000000,200000,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);


select * from funding_project;
select * from funding_image;
--insert into funding_project 
--values (17,'유기견을 향한 마음','user03',12000000,300000,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);


--SELECT FP_NO,FP_NAME,USER_NAME,GOAL,RAISED,START_DATE,CLOSING_DATE
--    ,CATEGORY_NO,HITS, THUMBNAIL_ORIGIN_NAME, THUMBNAIL_CHANGE_NAME,FUNDING_CATEGORY_NAME
--from FUNDING_PROJECT
--JOIN MEMBER ON HOST_ID=USER_ID
--JOIN FUNDING_CATEGORY ON CATEGORY_NO =FUNDING_CATEGORY_NO;
--
--SELECT NVL(MAX(FS_NO)+1,1) FROM FUNDIONG_SUPPORTER WHERE FP_NO=1;

--INSERT INTO PAYMENT
--VALUES (1,'USER01','1010212','464','201602','1212121212','이윤정','1');
--
--INSERT INTO FUNDIONG_SUPPORTER
--VALUES((SELECT NVL(MAX(FS_NO)+1,1) FROM FUNDIONG_SUPPORTER WHERE FP_NO=1),1,'USER01',SYSDATE,100000,1,'김석구','충주시','010-1231-1214','12345','1');

select * from funding_project;
select * from funding_image;
delete from funding_project;
delete from funding_image;
commit;

