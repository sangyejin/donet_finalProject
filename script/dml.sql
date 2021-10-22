-- 비밀번호 : 1234
INSERT INTO MEMBER 
VALUES ('admin', '$2a$10$ojddmdgWHqdD.sx7Xy7Wr.QqEkyIS3sEG.V57zQWSSnBYwG/Zo.kG', '관리자', '컨트롤타워', '서울시 강남구 역삼동', 'admin@donet.com', '010-0000-0000', '1989-12-23', 'D', DEFAULT, SYSDATE, SYSDATE, 0);
INSERT INTO MEMBER 
VALUES ('user01', '$2a$10$ojddmdgWHqdD.sx7Xy7Wr.QqEkyIS3sEG.V57zQWSSnBYwG/Zo.kG', '유저1', '첫회원', '서울시 강남구 역삼동', 'user01@donet.com', '010-1111-1111', '1990-11-21', DEFAULT, DEFAULT, SYSDATE, SYSDATE, 0);
INSERT INTO MEMBER 
VALUES ('user02', '$2a$10$ojddmdgWHqdD.sx7Xy7Wr.QqEkyIS3sEG.V57zQWSSnBYwG/Zo.kG', '유저2', '두번째회원', '서울시 강남구 역삼동', 'user02@donet.com', '010-2222-2222', '1995-12-25', DEFAULT, DEFAULT, SYSDATE, SYSDATE, 0);
INSERT INTO MEMBER 
VALUES ('user03', '$2a$10$ojddmdgWHqdD.sx7Xy7Wr.QqEkyIS3sEG.V57zQWSSnBYwG/Zo.kG', '대한동물협회', '대한동물협회', '서울시 강남구 역삼동', 'user03@donet.com', '010-3333-2121', '1995-12-25', 'B', DEFAULT, SYSDATE, SYSDATE, 0);

select * from member;

insert into funding_category values(0,'기타');
insert into funding_category values(1,'동물');
insert into funding_category values(2,'재난');
insert into funding_category values(3,'고아');

INSERT INTO SUPPORT_CATEGORY VALUES(SEQ_SUPPORT_CATEGORY.NEXTVAL, '지구촌');
INSERT INTO SUPPORT_CATEGORY VALUES(SEQ_SUPPORT_CATEGORY.NEXTVAL, '환경');
INSERT INTO SUPPORT_CATEGORY VALUES(SEQ_SUPPORT_CATEGORY.NEXTVAL, '동물');
INSERT INTO SUPPORT_CATEGORY VALUES(SEQ_SUPPORT_CATEGORY.NEXTVAL, '아동/청소년');
INSERT INTO SUPPORT_CATEGORY VALUES(SEQ_SUPPORT_CATEGORY.NEXTVAL, '취약계층');

insert into funding_project 
values (SEQ_FUNDING_PROJECT.NEXTVAL,'유기견을 향한 마음','user03',1000000,2400000,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);
insert into funding_project 
values (SEQ_FUNDING_PROJECT.NEXTVAL,'유기견을 향한 마음','user03',1000000,default,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);
insert into funding_project 
values (SEQ_FUNDING_PROJECT.NEXTVAL,'유기견을 향한 마음','user03',1000000,1000000,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);
insert into funding_project 
values (SEQ_FUNDING_PROJECT.NEXTVAL,'유기견을 향한 마음','user03',1000000,1000,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);
insert into funding_project 
values (SEQ_FUNDING_PROJECT.NEXTVAL,'유기견을 향한 마음','user03',1000000,30000,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);
insert into funding_project 
values (SEQ_FUNDING_PROJECT.NEXTVAL,'유기견을 향한 마음','user03',4000000,2300000,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);
insert into funding_project 
values (SEQ_FUNDING_PROJECT.NEXTVAL,'유기견을 향한 마음','user03',1000000,default,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);
insert into funding_project 
values (SEQ_FUNDING_PROJECT.NEXTVAL,'유기견을 향한 마음','user03',1000000,default,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);
insert into funding_project 
values (SEQ_FUNDING_PROJECT.NEXTVAL,'유기견을 향한 마음','user03',1000000,default,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);
insert into funding_project 
values (SEQ_FUNDING_PROJECT.NEXTVAL,'유기견을 향한 마음','user03',1000000,default,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);
insert into funding_project 
values (SEQ_FUNDING_PROJECT.NEXTVAL,'유기견을 향한 마음','user03',1000000,default,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);
insert into funding_project 
values (SEQ_FUNDING_PROJECT.NEXTVAL,'유기견을 향한 마음','user03',1000000,default,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);
insert into funding_project 
values (SEQ_FUNDING_PROJECT.NEXTVAL,'유기견을 향한 마음','user03',1000000,default,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);
insert into funding_project 
values (SEQ_FUNDING_PROJECT.NEXTVAL,'유기견을 향한 마음','user03',1000000,3000000,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);
insert into funding_project 
values (SEQ_FUNDING_PROJECT.NEXTVAL,'유기견을 향한 마음','user03',15000000,200000,to_date('2021-10-02'),to_date('2021-12-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate, 1,default,default,'sample.PNG','sample.PNG',sysdate);

--NOTICE 게시글 관련 INSERT
--1
INSERT INTO NOTICE VALUES (SEQ_NOTICE.NEXTVAL,'도넷닷컴 설립! 안녕하세요.','사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와

봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는

실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은',TO_DATE('10000815','YYYYMMDD'),'admin12',DEFAULT,DEFAULT,DEFAULT);


--2
INSERT INTO NOTICE VALUES (SEQ_NOTICE.NEXTVAL,'도넷닷컴, 이렇게 사용하세요.','사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와

봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는

실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은',TO_DATE('18080815','YYYYMMDD'),'admin12',DEFAULT,DEFAULT,DEFAULT);


--3
INSERT INTO NOTICE VALUES (SEQ_NOTICE.NEXTVAL,'구한말 물가 상승으로 인한 안내','사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와

봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는

실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은',TO_DATE('18880815','YYYYMMDD'),'admin12',DEFAULT,DEFAULT,DEFAULT);


--4
INSERT INTO NOTICE VALUES (SEQ_NOTICE.NEXTVAL,'도넫닫콤. 페이지 개편 안내','사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와

봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는

실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은',TO_DATE('18950815','YYYYMMDD'),'admin12',DEFAULT,DEFAULT,DEFAULT);


--5
INSERT INTO NOTICE VALUES (SEQ_NOTICE.NEXTVAL,'페이지 개편 로고 이벤트 당첨자 안내','사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와

봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는

실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은',TO_DATE('19050815','YYYYMMDD'),'admin12',DEFAULT,DEFAULT,DEFAULT);


--6
INSERT INTO NOTICE VALUES (SEQ_NOTICE.NEXTVAL,'개인정보처리방침 개정 내용 안내','사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와

봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는

실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은',TO_DATE('19250815','YYYYMMDD'),'admin12',DEFAULT,DEFAULT,DEFAULT);


--7
INSERT INTO NOTICE VALUES (SEQ_NOTICE.NEXTVAL,'제공 서비스 확대 안내','사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와

봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는

실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은',TO_DATE('19430815','YYYYMMDD'),'admin12',DEFAULT,DEFAULT,DEFAULT);


--8
INSERT INTO NOTICE VALUES (SEQ_NOTICE.NEXTVAL,'포인트 서비스 도입 안내','사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와

봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는

실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은',TO_DATE('19450815','YYYYMMDD'),'admin12',DEFAULT,DEFAULT,DEFAULT);


--9
INSERT INTO NOTICE VALUES (SEQ_NOTICE.NEXTVAL,'카카오페이, 토스간편결제 도입','사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와

봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는

실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은',TO_DATE('20000915','YYYYMMDD'),'admin12',DEFAULT,DEFAULT,DEFAULT);


--10
INSERT INTO NOTICE VALUES (SEQ_NOTICE.NEXTVAL,'사용자 환경 개선 서비스 점검 안내','사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와

봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는

실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은',TO_DATE('20100915','YYYYMMDD'),'admin12',DEFAULT,DEFAULT,DEFAULT);


--11
INSERT INTO NOTICE VALUES (SEQ_NOTICE.NEXTVAL,'근무자 코로나19 확진자 관련 안내','사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와

봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는

실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은',TO_DATE('20210915','YYYYMMDD'),'admin12',DEFAULT,DEFAULT,DEFAULT);



--update
UPDATE NOTICE
SET NO_CONTENT='사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

                   '이것은 현저하게 일월과 같은 예가 되려니와 그와 봄바람이다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 
                   
                   '실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다' ||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 
                   
                   '그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 '
 WHERE NO_NO='1';       
 
 UPDATE NOTICE
SET NO_CONTENT='사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

                   '이것은 현저하게 일월과 같은 예가 되려니와 그와 봄바람이다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 
                   
                   '실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다' ||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 
                   
                   '그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 '
 WHERE NO_NO='2';       
 
 UPDATE NOTICE
SET NO_CONTENT='사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

                   '이것은 현저하게 일월과 같은 예가 되려니와 그와 봄바람이다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 
                   
                   '실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다' ||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 
                   
                   '그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 '
 WHERE NO_NO='3';       
 
 UPDATE NOTICE
SET NO_CONTENT='사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

                   '이것은 현저하게 일월과 같은 예가 되려니와 그와 봄바람이다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 
                   
                   '실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다' ||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 
                   
                   '그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 '
 WHERE NO_NO='4';       
 
 UPDATE NOTICE
SET NO_CONTENT='사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

                   '이것은 현저하게 일월과 같은 예가 되려니와 그와 봄바람이다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 
                   
                   '실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다' ||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 
                   
                   '그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 '
 WHERE NO_NO='5';    
 UPDATE NOTICE
SET NO_CONTENT='사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

                   '이것은 현저하게 일월과 같은 예가 되려니와 그와 봄바람이다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 
                   
                   '실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다' ||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 
                   
                   '그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 '
 WHERE NO_NO='6';       
 
 UPDATE NOTICE
SET NO_CONTENT='사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

                   '이것은 현저하게 일월과 같은 예가 되려니와 그와 봄바람이다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 
                   
                   '실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다' ||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 
                   
                   '그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 '
 WHERE NO_NO='7';       
 
 UPDATE NOTICE
SET NO_CONTENT='사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

                   '이것은 현저하게 일월과 같은 예가 되려니와 그와 봄바람이다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 
                   
                   '실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다' ||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 
                   
                   '그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 '
 WHERE NO_NO='8';       
 
 UPDATE NOTICE
SET NO_CONTENT='사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

                   '이것은 현저하게 일월과 같은 예가 되려니와 그와 봄바람이다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 
                   
                   '실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다' ||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 
                   
                   '그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 '
 WHERE NO_NO='9';       
 
 UPDATE NOTICE
SET NO_CONTENT='사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

                   '이것은 현저하게 일월과 같은 예가 되려니와 그와 봄바람이다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 
                   
                   '실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다' ||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 
                   
                   '그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 '
 WHERE NO_NO='10';    
 
 UPDATE NOTICE
SET NO_CONTENT='사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

                   '이것은 현저하게 일월과 같은 예가 되려니와 그와 봄바람이다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 

                    '오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는'||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 
                   
                   '실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다' ||CHR(10)||CHR(13)||CHR(10)||CHR(13)|| 
                   
                   '그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 '
 WHERE NO_NO='11';   

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
--SELECT NVL(MAX(FS_NO)+1,1) FROM FUNDING_SUPPORTER WHERE FP_NO=1;

--INSERT INTO PAYMENT
--VALUES (1,'USER01','1010212','464','201602','1212121212','이윤정','1');
--
--INSERT INTO FUNDIONG_SUPPORTER
--VALUES((SELECT NVL(MAX(FS_NO)+1,1) FROM FUNDING_SUPPORTER WHERE FP_NO=1),1,'USER01',SYSDATE,100000,1,'김석구','충주시','010-1231-1214','12345','1');

select * from funding_project;
select * from funding_image;
select * from funding_goods;

-- delete from funding_project;
commit;

