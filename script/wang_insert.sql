
--NOTICE INSERT
--공지사항 테이블 수정!!
ALTER TABLE NOTICE DROP(NO_STATUS);
ALTER TABLE NOTICE ADD(NO_ORIGIN VARCHAR(4000));
ALTER TABLE NOTICE ADD(NO_NEW VARCHAR(4000));
ALTER TABLE NOTICE MODIFY(NO_TITLE VARCHAR2(100));


COMMENT ON COLUMN NOTICE.NO_ORIGIN IS '파일원이름';
COMMENT ON COLUMN NOTICE.NO_NEW IS '파일새이름';
select * from notice;
--공지사항 인서트 


--1
INSERT INTO NOTICE VALUES (SEQ_NOTICE.NEXTVAL,'도넷닷컴 설립! 안녕하세요.','사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와

봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는

실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은',TO_DATE('10000815','YYYYMMDD'),'admin',DEFAULT,DEFAULT,NULL,NULL);


--2
INSERT INTO NOTICE VALUES (SEQ_NOTICE.NEXTVAL,'도넷닷컴, 이렇게 사용하세요.','사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와

봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는

실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은',TO_DATE('18080815','YYYYMMDD'),'admin',DEFAULT,DEFAULT,NULL,NULL);


--3
INSERT INTO NOTICE VALUES (SEQ_NOTICE.NEXTVAL,'구한말 물가 상승으로 인한 안내','사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와

봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는

실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은',TO_DATE('18880815','YYYYMMDD'),'admin',DEFAULT,DEFAULT,NULL,NULL);


--4
INSERT INTO NOTICE VALUES (SEQ_NOTICE.NEXTVAL,'도넫닫콤. 페이지 개편 안내','사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와

봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는

실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은',TO_DATE('18950815','YYYYMMDD'),'admin',DEFAULT,DEFAULT,NULL,NULL);


--5
INSERT INTO NOTICE VALUES (SEQ_NOTICE.NEXTVAL,'페이지 개편 로고 이벤트 당첨자 안내','사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와

봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는

실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은',TO_DATE('19050815','YYYYMMDD'),'admin',DEFAULT,DEFAULT,NULL,NULL);


--6
INSERT INTO NOTICE VALUES (SEQ_NOTICE.NEXTVAL,'개인정보처리방침 개정 내용 안내','사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와

봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는

실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은',TO_DATE('19250815','YYYYMMDD'),'admin',DEFAULT,DEFAULT,NULL,NULL);


--7
INSERT INTO NOTICE VALUES (SEQ_NOTICE.NEXTVAL,'제공 서비스 확대 안내','사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와

봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는

실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은',TO_DATE('19430815','YYYYMMDD'),'admin',DEFAULT,DEFAULT,NULL,NULL);


--8
INSERT INTO NOTICE VALUES (SEQ_NOTICE.NEXTVAL,'포인트 서비스 도입 안내','사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와

봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는

실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은',TO_DATE('19450815','YYYYMMDD'),'admin',DEFAULT,DEFAULT,NULL,NULL);


--9
INSERT INTO NOTICE VALUES (SEQ_NOTICE.NEXTVAL,'카카오페이, 토스간편결제 도입','사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와

봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는

실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은',TO_DATE('20000915','YYYYMMDD'),'admin',DEFAULT,DEFAULT,NULL,NULL);


--10
INSERT INTO NOTICE VALUES (SEQ_NOTICE.NEXTVAL,'사용자 환경 개선 서비스 점검 안내','사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와

봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는

실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은',TO_DATE('20100915','YYYYMMDD'),'admin',DEFAULT,DEFAULT,NULL,NULL);


--11
INSERT INTO NOTICE VALUES (SEQ_NOTICE.NEXTVAL,'근무자 코로나19 확진자 관련 안내','사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와

봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는

실로 인간의 부패를 방지하는 소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가 더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은',TO_DATE('20210915','YYYYMMDD'),'admin',DEFAULT,DEFAULT,NULL,NULL);



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
 
 
 


/**************************************************************************************************************/
DROP TABLE FAQ;
DROP SEQUENCE SEQ_FAQ;
DROP TABLE FAQ_TYPE;
DROP SEQUENCE SEQ_FAQ_TYPE;


--자주 묻는 질문 카테고리 테이블 시퀀스
CREATE SEQUENCE SEQ_FAQ_TYPE
INCREMENT BY 1
START WITH 1
CACHE 100;

--자주 묻는 질문 테이블 시퀀스
CREATE SEQUENCE SEQ_FAQ
INCREMENT BY 1
START WITH 1
CACHE 100;



--2 자주 묻는 질문 카테고리				
CREATE TABLE FAQ_TYPE (
	F_TYPENO	NUMBER	PRIMARY KEY,
	F_TYPENAME	VARCHAR2(30)	NOT NULL UNIQUE
);
--자주 묻는 질문 카테고리	 테이블 코멘트
COMMENT ON TABLE FAQ_TYPE IS '자주 묻는 질문 카테고리	';
COMMENT ON COLUMN FAQ_TYPE.F_TYPENO IS '질문 카테고리 번호'; 
COMMENT ON COLUMN FAQ_TYPE.F_TYPENAME IS '질문 카테고리 이름'; 


--FAQ_TYPE 인서트
INSERT INTO FAQ_TYPE 
VALUES (SEQ_FAQ_TYPE.NEXTVAL,'회원문의');
INSERT INTO FAQ_TYPE 
VALUES (SEQ_FAQ_TYPE.NEXTVAL,'결제/환불');
INSERT INTO FAQ_TYPE 
VALUES (SEQ_FAQ_TYPE.NEXTVAL,'서비스 이용 및 기타');
 

--3 자주 묻는 질문
CREATE TABLE FAQ (
	F_NO	NUMBER	PRIMARY KEY,
	F_Q	VARCHAR2(4000)	NOT NULL UNIQUE, --***
    F_A	VARCHAR2(4000)	NOT NULL,
	F_TYPENUM	NUMBER  NOT NULL
);
--자주 묻는 질문 테이블 코멘트
COMMENT ON TABLE FAQ IS '자주 묻는 질문';
COMMENT ON COLUMN FAQ.F_NO IS '질문 번호';
COMMENT ON COLUMN FAQ.F_Q IS '질문';
COMMENT ON COLUMN FAQ.F_A IS '답변';
COMMENT ON COLUMN FAQ.F_TYPENUM IS '질문 구분'; 

--질문구분 컬럼 외래키
 ALTER TABLE FAQ ADD CONSTRAINT FK_FAQ FOREIGN KEY (F_TYPENUM)REFERENCES FAQ_TYPE (F_TYPENO);




--FAQ 인서트

INSERT INTO FAQ 
VALUES (SEQ_FAQ.NEXTVAL, '회원가입은 무료인가요?','저희 도넷닷컴은 기존의 후원 및 펀딩이 접근성이 좋지 않은 방식으로 진행되고 있다는 점에 대해'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'문제점을 느꼈기에 설립하게 된 5명의 개발자로 이루어진 비영리 단체입니다.'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'펀딩 내역과 후원 내역을 외부 회계팀의 감사를 받으며 1원 단위까지 공개하는 방식으로 진행하고 있사오니, 안심하시고'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 우리의 귀는 생의 찬미를 듣는다 그것은'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'살 수 있는 것이다 석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'을 위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여 구하기 위하여서 그리하였는가?'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'감사합니다.', 1);

INSERT INTO FAQ 
VALUES (SEQ_FAQ.NEXTVAL, '아이디와 비밀번호가 생각나지 않아요. 어떻게 찾을 수 있나요?','저희 도넷닷컴은 기존의 후원 및 펀딩이 접근성이 좋지 않은 방식으로 진행되고 있다는 점에 대해'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'문제점을 느꼈기에 설립하게 된 5명의 개발자로 이루어진 비영리 단체입니다.'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'펀딩 내역과 후원 내역을 외부 회계팀의 감사를 받으며 1원 단위까지 공개하는 방식으로 진행하고 있사오니, 안심하시고'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 우리의 귀는 생의 찬미를 듣는다 그것은'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'살 수 있는 것이다 석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'을 위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여 구하기 위하여서 그리하였는가?'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'감사합니다.', 1);

INSERT INTO FAQ 
VALUES (SEQ_FAQ.NEXTVAL, '회원 탈퇴를 하고 싶습니다.','저희 도넷닷컴은 기존의 후원 및 펀딩이 접근성이 좋지 않은 방식으로 진행되고 있다는 점에 대해'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'문제점을 느꼈기에 설립하게 된 5명의 개발자로 이루어진 비영리 단체입니다.'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'펀딩 내역과 후원 내역을 외부 회계팀의 감사를 받으며 1원 단위까지 공개하는 방식으로 진행하고 있사오니, 안심하시고'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 우리의 귀는 생의 찬미를 듣는다 그것은'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'살 수 있는 것이다 석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'을 위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여 구하기 위하여서 그리하였는가?'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'감사합니다.', 1);

INSERT INTO FAQ 
VALUES (SEQ_FAQ.NEXTVAL, '후원/펀딩 환불이 가능한가요?','저희 도넷닷컴은 기존의 후원 및 펀딩이 접근성이 좋지 않은 방식으로 진행되고 있다는 점에 대해'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'문제점을 느꼈기에 설립하게 된 5명의 개발자로 이루어진 비영리 단체입니다.'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'펀딩 내역과 후원 내역을 외부 회계팀의 감사를 받으며 1원 단위까지 공개하는 방식으로 진행하고 있사오니, 안심하시고'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 우리의 귀는 생의 찬미를 듣는다 그것은'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'살 수 있는 것이다 석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'을 위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여 구하기 위하여서 그리하였는가?'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'감사합니다.', 1);

INSERT INTO FAQ 
VALUES (SEQ_FAQ.NEXTVAL, '어떤 결제 방법을 제공하나요?','저희 도넷닷컴은 기존의 후원 및 펀딩이 접근성이 좋지 않은 방식으로 진행되고 있다는 점에 대해'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'문제점을 느꼈기에 설립하게 된 5명의 개발자로 이루어진 비영리 단체입니다.'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'펀딩 내역과 후원 내역을 외부 회계팀의 감사를 받으며 1원 단위까지 공개하는 방식으로 진행하고 있사오니, 안심하시고'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 우리의 귀는 생의 찬미를 듣는다 그것은'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'살 수 있는 것이다 석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'을 위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여 구하기 위하여서 그리하였는가?'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'감사합니다.', 2);

INSERT INTO FAQ 
VALUES (SEQ_FAQ.NEXTVAL, '현금영수증/세금계산서 발행은 어떻게 하나요?','저희 도넷닷컴은 기존의 후원 및 펀딩이 접근성이 좋지 않은 방식으로 진행되고 있다는 점에 대해'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'문제점을 느꼈기에 설립하게 된 5명의 개발자로 이루어진 비영리 단체입니다.'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'펀딩 내역과 후원 내역을 외부 회계팀의 감사를 받으며 1원 단위까지 공개하는 방식으로 진행하고 있사오니, 안심하시고'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 우리의 귀는 생의 찬미를 듣는다 그것은'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'살 수 있는 것이다 석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'을 위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여 구하기 위하여서 그리하였는가?'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'감사합니다.', 2);

INSERT INTO FAQ 
VALUES (SEQ_FAQ.NEXTVAL, '문의는 어떻게 할 수 있나요?','저희 도넷닷컴은 기존의 후원 및 펀딩이 접근성이 좋지 않은 방식으로 진행되고 있다는 점에 대해'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'문제점을 느꼈기에 설립하게 된 5명의 개발자로 이루어진 비영리 단체입니다.'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'펀딩 내역과 후원 내역을 외부 회계팀의 감사를 받으며 1원 단위까지 공개하는 방식으로 진행하고 있사오니, 안심하시고'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 우리의 귀는 생의 찬미를 듣는다 그것은'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'살 수 있는 것이다 석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'을 위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여 구하기 위하여서 그리하였는가?'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'감사합니다.', 2);

INSERT INTO FAQ 
VALUES (SEQ_FAQ.NEXTVAL, '도넷닷컴은 어떤 회사인가요? 믿고 펀딩, 후원을 할 수 있나요?'
,'저희 도넷닷컴은 기존의 후원 및 펀딩이 접근성이 좋지 않은 방식으로 진행되고 있다는 점에 대해'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'문제점을 느꼈기에 설립하게 된 5명의 개발자로 이루어진 비영리 단체입니다.'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'펀딩 내역과 후원 내역을 외부 회계팀의 감사를 받으며 1원 단위까지 공개하는 방식으로 진행하고 있사오니, 안심하시고'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 우리의 귀는 생의 찬미를 듣는다 그것은'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'살 수 있는 것이다 석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'을 위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여 구하기 위하여서 그리하였는가?'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'감사합니다.', 3);


INSERT INTO FAQ 
VALUES (SEQ_FAQ.NEXTVAL, '현금영수증 취소를 하고 싶어요.','저희 도넷닷컴은 기존의 후원 및 펀딩이 접근성이 좋지 않은 방식으로 진행되고 있다는 점에 대해'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'문제점을 느꼈기에 설립하게 된 5명의 개발자로 이루어진 비영리 단체입니다.'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'펀딩 내역과 후원 내역을 외부 회계팀의 감사를 받으며 1원 단위까지 공개하는 방식으로 진행하고 있사오니, 안심하시고'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 우리의 귀는 생의 찬미를 듣는다 그것은'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'살 수 있는 것이다 석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'을 위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여 구하기 위하여서 그리하였는가?'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'감사합니다.', 3);

INSERT INTO FAQ 
VALUES (SEQ_FAQ.NEXTVAL, '회원 탈퇴 후 재가입이 가능한가요?','저희 도넷닷컴은 기존의 후원 및 펀딩이 접근성이 좋지 않은 방식으로 진행되고 있다는 점에 대해'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'문제점을 느꼈기에 설립하게 된 5명의 개발자로 이루어진 비영리 단체입니다.'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'펀딩 내역과 후원 내역을 외부 회계팀의 감사를 받으며 1원 단위까지 공개하는 방식으로 진행하고 있사오니, 안심하시고'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'그들의 눈에 무엇이 타오르고 있는가? 우리 눈이 그것을 보는 때에 우리의 귀는 생의 찬미를 듣는다 그것은'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'살 수 있는 것이다 석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'을 위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여 구하기 위하여서 그리하였는가?'||CHR(10)||CHR(13)|| CHR(10)||CHR(13)|| 

'감사합니다.', 3);

--FAQ INSERT
/****************************************************************/
ALTER TABLE ASK MODIFY ASK_DATE DATE DEFAULT SYSDATE;
ALTER TABLE ASK DROP(ASK_EMAIL);
ALTER TABLE ASK DROP(ASK_PHONE);



--1
INSERT INTO ASK VALUES(SEQ_ASK.NEXTVAL,'이중 결제가 되었는데 취소가 가능한가요?','제곧내',NULL,NULL,'user01',NULL,2,DEFAULT,'N');

--2
INSERT INTO ASK VALUES(SEQ_ASK.NEXTVAL,'후원처 등록은 어떻게 하나요?','제곧내',NULL,NULL,'user01',NULL,3,DEFAULT,'N');

--3
INSERT INTO ASK VALUES(SEQ_ASK.NEXTVAL,'문의드립니다 문의드립니다','제곧내',NULL,NULL,'user01',NULL,2,DEFAULT,'N');

--5
INSERT INTO ASK VALUES(SEQ_ASK.NEXTVAL,'영자야 일 안하냐','사이트가 이모양 이꼴인데 일 안하냐',NULL,NULL,'user01','썅놈아 개열심히하는 중인데 개새끼야',2,DEFAULT,'Y');

--6
INSERT INTO ASK VALUES(SEQ_ASK.NEXTVAL,'아오','아오 열받아서 못쓰겠네!',NULL,NULL,'user01',NULL,2,DEFAULT,'N');

--7
INSERT INTO ASK VALUES(SEQ_ASK.NEXTVAL,'엄마카드로 후원했는데 엄마가 환불해오래요','제곧내',NULL,NULL,'user02',NULL,2,DEFAULT,'N');

--8
INSERT INTO ASK VALUES(SEQ_ASK.NEXTVAL,'사이트 개선방안 건의!','이건희',NULL,NULL,'user02',NULL,2,DEFAULT,'N');

--9
INSERT INTO ASK VALUES(SEQ_ASK.NEXTVAL,'비즈니스 문의는 어디로 드리면 될까요?','제곧내',NULL,NULL,'user02',NULL,2,DEFAULT,'N');

--bank insert
INSERT INTO BANK VALUES(SEQ_BANK.NEXTVAL, 'KB국민은행 ');

INSERT INTO BANK VALUES(SEQ_BANK.NEXTVAL, '우리은행');

INSERT INTO BANK VALUES(SEQ_BANK.NEXTVAL, 'KEB하나은행');

INSERT INTO BANK VALUES(SEQ_BANK.NEXTVAL, '신한은행');

INSERT INTO BANK VALUES(SEQ_BANK.NEXTVAL, '대구은행');

INSERT INTO BANK VALUES(SEQ_BANK.NEXTVAL, '부산은행');

INSERT INTO BANK VALUES(SEQ_BANK.NEXTVAL, '경남은행');

INSERT INTO BANK VALUES(SEQ_BANK.NEXTVAL, '광주은행');


INSERT INTO BANK VALUES(SEQ_BANK.NEXTVAL, '제주은행');

INSERT INTO BANK VALUES(SEQ_BANK.NEXTVAL, '전북은행');

INSERT INTO BANK VALUES(SEQ_BANK.NEXTVAL, '케이뱅크');

INSERT INTO BANK VALUES(SEQ_BANK.NEXTVAL, '카카오뱅크');

INSERT INTO BANK VALUES(SEQ_BANK.NEXTVAL, 'KDB산업은행 ');

INSERT INTO BANK VALUES(SEQ_BANK.NEXTVAL, 'IBK기업은행');

INSERT INTO BANK VALUES(SEQ_BANK.NEXTVAL, '수협은행');

INSERT INTO BANK VALUES(SEQ_BANK.NEXTVAL, 'NH농협은행');

INSERT INTO BANK VALUES(SEQ_BANK.NEXTVAL, '우정사업본부');


/*
PAY_NO	NUMBER	No		1	결제번호
USER_ID	VARCHAR2(30 BYTE)	No		2	아이디
CARD_NO	VARCHAR2(100 BYTE)	Yes		3	카드번호
PAY_CVC	NUMBER	Yes		4	CVC번호
PAY_EXPIRY	NUMBER	Yes		5	카드 유효기간
PAY_ACCOUNT	VARCHAR2(100 BYTE)	Yes		6	계좌번호
PAY_NAME	VARCHAR2(30 BYTE)	No		7	예금주
B_NO	NUMBER	No		8	은행번호
*/

--결제 
ALTER TABLE PAYMENT DROP(PAY_ACCOUNT);

