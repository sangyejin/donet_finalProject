--DROP
DROP TABLE NOTICE;
DROP TABLE FAQ;
DROP TABLE ASK;
DROP TABLE PAYMENT;
--DROP TABLE IMAGE;
DROP TABLE FAQ_TYPE;
DROP TABLE BANK;

DROP SEQUENCE SEQ_NOTICE;
DROP SEQUENCE SEQ_FAQ;
DROP SEQUENCE SEQ_ASK;
DROP SEQUENCE SEQ_PAYMENT;
DROP SEQUENCE SEQ_FAQ_TYPE;
DROP SEQUENCE SEQ_BANK;

--1 공지사항

CREATE TABLE NOTICE (
	NO_NO	NUMBER	PRIMARY KEY,
	NO_TITLE	VARCHAR2(30)	NOT NULL,
    NO_CONTENT	VARCHAR2(4000)	NOT NULL,
	NO_DATE 	DATE	DEFAULT SYSDATE NOT NULL,
	NO_WRITER	VARCHAR2(50)	NOT NULL,
	NO_COUNT	NUMBER	DEFAULT 0 NOT NULL,
	NO_SAVE	VARCHAR2(2) DEFAULT 'N' NOT NULL ,
	NO_STATUS	VARCHAR2(2)	DEFAULT 0 NOT NULL,
    CHECK (NO_SAVE IN('Y','N')),
    CHECK (NO_STATUS IN (0,1))
);

--공지사항 테이블 코멘트
COMMENT ON TABLE NOTICE IS '공지사항';
COMMENT ON COLUMN NOTICE.NO_NO IS '공지사항 번호';
COMMENT ON COLUMN NOTICE.NO_TITLE IS '제목';
COMMENT ON COLUMN NOTICE.NO_CONTENT IS '내용';
COMMENT ON COLUMN NOTICE.NO_DATE IS '작성일자';
COMMENT ON COLUMN NOTICE.NO_WRITER IS '작성자'; --작성자에 외래키 걸기
COMMENT ON COLUMN NOTICE.NO_COUNT IS '조회수';
COMMENT ON COLUMN NOTICE.NO_SAVE IS '임시저장여부';
COMMENT ON COLUMN NOTICE.NO_STATUS IS '상태';

--공지사항 테이블 시퀀스
CREATE SEQUENCE SEQ_NOTICE
INCREMENT BY 1
START WITH 1
CACHE 100;


--2 자주 묻는 질문 카테고리				
CREATE TABLE FAQ_TYPE (
	F_TYPENO	NUMBER	PRIMARY KEY,
	F_TYPENAME	VARCHAR2(30)	NOT NULL
);

--자주 묻는 질문 카테고리	 테이블 코멘트
COMMENT ON TABLE FAQ_TYPE IS '사진 첨부 파일';

COMMENT ON COLUMN FAQ_TYPE.F_TYPENO IS '질문 카테고리 번호'; 
COMMENT ON COLUMN FAQ_TYPE.F_TYPENAME IS '질문 카테고리 이름'; 

--자주 묻는 질문 카테고리 테이블 시퀀스
CREATE SEQUENCE SEQ_FAQ_TYPE
INCREMENT BY 1
START WITH 1
CACHE 100;


--3 자주 묻는 질문
CREATE TABLE FAQ (
	F_NO	NUMBER	PRIMARY KEY,
	F_Q	VARCHAR2(4000)	NOT NULL,
    F_A	VARCHAR2(4000)	NOT NULL,
	F_TYPENUM	NUMBER  NOT NULL
);

--자주 묻는 질문 테이블 코멘트
COMMENT ON TABLE FAQ IS '자주 묻는 질문';
COMMENT ON COLUMN FAQ.F_NO IS '질문 번호';
COMMENT ON COLUMN FAQ.F_Q IS '질문';
COMMENT ON COLUMN FAQ.F_A IS '답변';
COMMENT ON COLUMN FAQ.F_TYPENUM IS '질문 구분'; 

--자주 묻는 질문 테이블 시퀀스
CREATE SEQUENCE SEQ_FAQ
INCREMENT BY 1
START WITH 1
CACHE 100;



--4 문의
CREATE TABLE ASK (
	ASK_NO	NUMBER	PRIMARY KEY,
	ASK_TITLE	VARCHAR2(100)	NOT NULL,
    ASK_CONTENT	VARCHAR2(4000)	NOT NULL,
	ASK_ORIGIN_IMG 	VARCHAR2(4000)	,
    ASK_NEW_IMG VARCHAR2(4000)	,
	ASK_ID	VARCHAR2(30)	NOT NULL,
	ANSWERED	VARCHAR2(4000)	,
	ASK_TYPENUM	NUMBER  NOT NULL ,
	ASK_DATE	DATE NOT NULL,
    ASK_STATUS	VARCHAR2(2)	 DEFAULT 'N' NOT NULL,
	ASK_EMAIL	VARCHAR2(50),
	ASK_PHONE	VARCHAR2(20),
    CHECK (ASK_STATUS IN('Y','N'))
);

--문의 테이블 코멘트
COMMENT ON TABLE ASK IS '문의';
COMMENT ON COLUMN ASK.ASK_NO IS '문의 질문 번호';
COMMENT ON COLUMN ASK.ASK_TITLE IS '문의 질문 제목';
COMMENT ON COLUMN ASK.ASK_CONTENT IS '문의 질문 내용';
COMMENT ON COLUMN ASK.ASK_ORIGIN_IMG IS '문의 질문 첨부파일(구)'; 
COMMENT ON COLUMN ASK.ASK_NEW_IMG IS '문의 질문 첨부파일(신)'; 
COMMENT ON COLUMN ASK.ASK_ID IS '아이디'; --사용자 테이블 외래키 연결
COMMENT ON COLUMN ASK.ANSWERED IS '문의 답변';
COMMENT ON COLUMN ASK.ASK_TYPENUM IS '질문 구분';
COMMENT ON COLUMN ASK.ASK_DATE IS '작성일';
COMMENT ON COLUMN ASK.ASK_STATUS IS '답변 여부'; 
COMMENT ON COLUMN ASK.ASK_EMAIL IS '이메일';
COMMENT ON COLUMN ASK.ASK_PHONE IS '전화번호';

--자주 묻는 질문 테이블 시퀀스
CREATE SEQUENCE SEQ_ASK
INCREMENT BY 1
START WITH 1
CACHE 100;


--5 결제수단
CREATE TABLE PAYMENT (
	PAY_NO	NUMBER	PRIMARY KEY,
	USER_ID	VARCHAR2(30)	NOT NULL,
    CARD_NO	VARCHAR2(100)	,
	PAY_CVC 	NUMBER	,
	PAY_EXPIRY	NUMBER	,
	PAY_ACCOUNT	VARCHAR2(100)	,
	PAY_NAME	VARCHAR2(30)  NOT NULL ,
	B_NO	NUMBER NOT NULL
   
);

--결제수단 테이블 코멘트
COMMENT ON TABLE PAYMENT IS '결제수단';

COMMENT ON COLUMN PAYMENT.PAY_NO IS '결제번호'; --아이디랑 복합키 : max+1
COMMENT ON COLUMN PAYMENT.USER_ID IS '아이디'; --사용자 테이블 외래키 연결
COMMENT ON COLUMN PAYMENT.CARD_NO IS '카드번호';
COMMENT ON COLUMN PAYMENT.PAY_CVC IS 'CVC번호';
COMMENT ON COLUMN PAYMENT.PAY_EXPIRY IS '카드 유효기간'; 
COMMENT ON COLUMN PAYMENT.PAY_ACCOUNT IS '계좌번호';
COMMENT ON COLUMN PAYMENT.PAY_NAME IS '예금주'; 
COMMENT ON COLUMN PAYMENT.B_NO IS '은행번호'; 

--결제수단 테이블 시퀀스
CREATE SEQUENCE SEQ_PAYMENT
INCREMENT BY 1
START WITH 1
CACHE 100;


/*
--6 사진 첨부 파일
CREATE TABLE IMAGE (
	IMG_ID	NUMBER	PRIMARY KEY,
	USER_ID	VARCHAR2(30)	NOT NULL,
    ORIGIN_IMG_NAME	VARCHAR2(4000)	NOT NULL,
	IMG_PATH 	VARCHAR2(4000)	NOT NULL,
	CHANGE_IMG_NAME	VARCHAR2(4000) NOT NULL
);

--사진 첨부 파일 테이블 코멘트
COMMENT ON TABLE IMAGE IS '사진 첨부 파일';

COMMENT ON COLUMN IMAGE.IMG_ID IS '파일번호'; 
COMMENT ON COLUMN IMAGE.USER_ID IS '아이디'; --사용자 테이블 외래키 연결			
COMMENT ON COLUMN IMAGE.ORIGIN_IMG_NAME IS '원래 파일명';
COMMENT ON COLUMN IMAGE.IMG_PATH IS '파일 경로';
COMMENT ON COLUMN IMAGE.CHANGE_IMG_NAME IS '바뀐 파일명'; 

--사진 첨부 파일 테이블 시퀀스
CREATE SEQUENCE SEQ_IMAGE
INCREMENT BY 1
START WITH 1
CACHE 100;
*/

--7 은행
CREATE TABLE BANK (
	BANK_NO	NUMBER 	PRIMARY KEY,
	BANK_NAME	VARCHAR2(20)	NOT NULL
);

--은행 테이블 코멘트
COMMENT ON TABLE BANK IS '은행';

COMMENT ON COLUMN BANK.BANK_NO IS '은행번호'; 
COMMENT ON COLUMN BANK.BANK_NAME IS '은행명'; 

--은행 테이블 시퀀스
CREATE SEQUENCE SEQ_BANK
INCREMENT BY 1
START WITH 1
CACHE 100;

--결제수단 > 은행 번호 외래키 연결
ALTER TABLE PAYMENT ADD CONSTRAINT FK_PAYMENT FOREIGN KEY (B_NO)REFERENCES BANK (BANK_NO);

--FAQ_TYPE 테이블 외래키 연결
ALTER TABLE ASK ADD CONSTRAINT FK_ASK FOREIGN KEY (ASK_TYPENUM)REFERENCES FAQ_TYPE (F_TYPENO);

--질문구분 컬럼 외래키
 ALTER TABLE FAQ ADD CONSTRAINT FK_FAQ FOREIGN KEY (F_TYPENUM)REFERENCES FAQ_TYPE (F_TYPENO);

--사진 첨부파일 테이블 외래키 연결 ?? 없어도 될 것 같은 기분,,
--ALTER TABLE ASK ADD CONSTRAINT FK_ASK_ATTACH FOREIGN KEY (ASK_ATTACH)REFERENCES ATTACH (BANK_NO);


