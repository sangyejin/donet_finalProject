-- DROP문 -----------------------------------------
--DROP TABLE BENEFICIARY;
--DROP TABLE REVIEW;
--DROP TABLE REVIEW;
--DROP TABLE REVIEW_IMAGE;
--DROP TABLE SPONSOR;
--DROP TABLE SUPPORT_IMAGE;
--DROP TABLE SUPPORT_CATEGORY;
--DROP TABLE SUPPORT;
--DROP TABLE SUPPORT_USE_PLAN;
--
--DROP TABLE NOTICE;
--DROP TABLE FAQ;
--DROP TABLE ASK;
--DROP TABLE PAYMENT;
--DROP TABLE FAQ_TYPE;
--DROP TABLE BANK;
--
--
--DROP TABLE GOODS_CATEGORY ;
--DROP TABLE FUNDING_CATEGORY;
--DROP TABLE GOODS;
--DROP TABLE GOODS_PURCHASE ;
--DROP TABLE REQUIRED_CATEGORY ;
--DROP TABLE GOODS_IMAGE;
--DROP TABLE FUNDING_CATEGORY ;
--DROP TABLE FUNDIONG_GOODS;
--DROP TABLE FUNDING_GOODS;
--DROP TABLE FUNDING_SUPPORTER;
--DROP TABLE FUNDING_IMAGE;
--DROP TABLE FUNDING_PROJECT;
--DROP TABLE FUNDING_REPLY;
--DROP TABLE FUNDIONG_SUPPORTER;
--
--
--DROP TABLE EVENT;               --이벤트 테이블
--DROP TABLE EVENT_REPLY;         --이벤트 댓글 
--DROP TABLE EVENT_ATTACHMENT;    --이벤트 첨부파일
--DROP TABLE VOLUNTEER;           --선행활동 테이블
--DROP TABLE VOLUNTEER_REPLY;     --선행활동 댓글
--DROP TABLE VOL_ATTACHMENT;      --선행활동 첨부파일
--
--
--DROP SEQUENCE SEQ_EV;
--DROP SEQUENCE SEQ_EV_REPLY;
--DROP SEQUENCE SEQ_EV_ATTA;
--DROP SEQUENCE SEQ_VOL;
--DROP SEQUENCE SEQ_VOL_REPLY;
--DROP SEQUENCE SEQ_VOL_ATTA;
--
--
--DROP TABLE MEMBER;
--DROP TABLE ATTENDANCE;
--DROP TABLE SUPPORT_COMMENT;
--DROP TABLE REVIEW_COMMENT;
--
--DROP SEQUENCE SEQ_ATT;
--DROP SEQUENCE SEQ_SPC;
--DROP SEQUENCE SEQ_REC;
--DROP SEQUENCE SEQ_FUNDING_PROJECT;
--DROP SEQUENCE SEQ_GOODS;
--DROP SEQUENCE SEQ_FUNDING_PROJECT;
--DROP SEQUENCE SEQ_FUNDING_CATEGORY;
--DROP SEQUENCE SEQ_GOODS_CATEGORY;
--DROP SEQUENCE SEQ_NOTICE;
--DROP SEQUENCE SEQ_FAQ;
--DROP SEQUENCE SEQ_ASK;
--DROP SEQUENCE SEQ_PAYMENT;
--DROP SEQUENCE SEQ_FAQ_TYPE;
--DROP SEQUENCE SEQ_BANK;
--DROP SEQUENCE SEQ_SUPPORT;
--DROP SEQUENCE SEQ_SPONSOR;
--DROP SEQUENCE SEQ_SUPPORT_CATEGORY;
--DROP SEQUENCE SEQ_REVIEW;
--DROP SEQUENCE SEQ_BENEFICIARY;
--DROP SEQUENCE SEQ_SUPPORT_USE_PLAN;
--DROP SEQUENCE SEQ_REVIEW_IMAGE;
--DROP SEQUENCE SEQ_SUPPORT_IMAGE;
--DROP SEQUENCE SEQ_FUNDING_IMAGE;
--DROP SEQUENCE SEQ_FUNDING_REPLY;
--------------------------------------------

--------------     MEMBER 테이블	   ---------------
CREATE TABLE MEMBER(
	USER_ID VARCHAR2(30) PRIMARY KEY,
	USER_PWD VARCHAR2(100) NOT NULL,
	USER_NAME VARCHAR2(30) NOT NULL,
	USER_NICK VARCHAR2(30) NOT NULL,
	ADDRESS VARCHAR2(100)  NOT NULL,
	EMAIL VARCHAR2(100) UNIQUE NOT NULL,
	PHONE VARCHAR2(13) UNIQUE NOT NULL,
	BIRTHDATE DATE NOT NULL,
	USER_ROLE VARCHAR2(1) DEFAULT 'A' CHECK(USER_ROLE IN('A', 'B', 'C','D')),
	STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
    USER_CREATE_DATE DATE DEFAULT SYSDATE,
	MODIFY_DATE DATE DEFAULT SYSDATE,
    POINT NUMBER
);

COMMENT ON COLUMN MEMBER.USER_ID IS '아이디';
COMMENT ON COLUMN MEMBER.USER_PWD IS '비밀번호';
COMMENT ON COLUMN MEMBER.USER_NAME IS '이름';
COMMENT ON COLUMN MEMBER.USER_NICK IS '닉네임';
COMMENT ON COLUMN MEMBER.ADDRESS IS '주소';
COMMENT ON COLUMN MEMBER.EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.BIRTHDATE IS '생년월일';
COMMENT ON COLUMN MEMBER.USER_ROLE IS '역할';
COMMENT ON COLUMN MEMBER.STATUS IS '회원상태';
COMMENT ON COLUMN MEMBER.USER_CREATE_DATE IS '계정생성일';
COMMENT ON COLUMN MEMBER.MODIFY_DATE IS '계정수정일';
COMMENT ON COLUMN MEMBER.POINT IS '총포인트';

-----------     ATTENDANCE 테이블	   -----------
CREATE TABLE ATTENDANCE(
    ATT_ID NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(30) NOT NULL,
    ATT_POINT NUMBER,
    ATT_POPUP VARCHAR2(200) NOT NULL,
    ATT_CONTINUITY NUMBER,
    ATT_DATE DATE DEFAULT SYSDATE,
    ATT_DATETIME TIMESTAMP DEFAULT SYSTIMESTAMP - INTERVAL '1' minute,
    FOREIGN KEY (USER_ID) REFERENCES MEMBER(USER_ID)
);
COMMENT ON COLUMN ATTENDANCE.ATT_ID IS '출석ID번호';
COMMENT ON COLUMN ATTENDANCE.USER_ID IS '아이디';
COMMENT ON COLUMN ATTENDANCE.ATT_POINT IS '출석포인트';
COMMENT ON COLUMN ATTENDANCE.ATT_POPUP IS '출석팝업';
COMMENT ON COLUMN ATTENDANCE.ATT_CONTINUITY IS '연속출석일수';
COMMENT ON COLUMN ATTENDANCE.ATT_DATE IS '출석날짜';
COMMENT ON COLUMN ATTENDANCE.ATT_DATETIME IS '출석시간';


-- 이벤트 테이블
CREATE TABLE EVENT (
    EVENT_NO NUMBER PRIMARY KEY,
    EVENT_TITLE VARCHAR2(1000) NOT NULL,
    EVENT_CONTENT VARCHAR2(4000) NOT NULL,
    EVENT_START_DATE DATE,
    EVENT_LAST_DATE DATE,
    EVENT_STATUS CHAR DEFAULT 'Y' CHECK(EVENT_STATUS IN ('Y','N','D'))
);

COMMENT ON TABLE EVENT IS '이벤트';
COMMENT ON COLUMN EVENT.EVENT_NO IS '이벤트 번호';
COMMENT ON COLUMN EVENT.EVENT_TITLE IS '이벤트 제목';
COMMENT ON COLUMN EVENT.EVENT_CONTENT IS '이벤트 내용';
COMMENT ON COLUMN EVENT.EVENT_START_DATE IS '이벤트 시작일';
COMMENT ON COLUMN EVENT.EVENT_LAST_DATE IS '이벤트 마감일';
COMMENT ON COLUMN EVENT.EVENT_STATUS IS '이벤트 상태(Y/공개, N/비공개, D/지난이벤트)';

--이벤트 댓글 테이블
CREATE TABLE EVENT_REPLY (
    EV_REPLY_NO NUMBER PRIMARY KEY,
    EV_REF_NO NUMBER ,
    EV_REPLY_WRITER VARCHAR2(30) NOT NULL,
    EV_REPLY_CONTENT VARCHAR2(2000) NOT NULL,
    EV_REPLY_STATUS CHAR DEFAULT 'Y' CHECK(EV_REPLY_STATUS IN ('Y','N')),
    EV_REPLY_DATE DATE DEFAULT SYSDATE,
    FOREIGN KEY (EV_REF_NO) REFERENCES EVENT(EVENT_NO),
    FOREIGN KEY (EV_REPLY_WRITER) REFERENCES MEMBER(USER_ID)
);

COMMENT ON TABLE EVENT_REPLY IS '이벤트 댓글';
COMMENT ON COLUMN EVENT_REPLY.EV_REPLY_NO IS '댓글 번호';
COMMENT ON COLUMN EVENT_REPLY.EV_REF_NO IS '참조이벤트 번호';
COMMENT ON COLUMN EVENT_REPLY.EV_REPLY_WRITER IS '댓글 작성자';
COMMENT ON COLUMN EVENT_REPLY.EV_REPLY_CONTENT IS '댓글 내용';
COMMENT ON COLUMN EVENT_REPLY.EV_REPLY_DATE IS '댓글 작성일';
COMMENT ON COLUMN EVENT_REPLY.EV_REPLY_STATUS IS '댓글 상태(Y/공개, N/비공개)';

--이벤트 첨부파일 
CREATE TABLE EVENT_ATTACHMENT (
	EV_AT_FILENO NUMBER PRIMARY KEY,
    EV_AT_ORIGIN VARCHAR2(4000) NOT NULL,
    EV_AT_NEWNAME VARCHAR2(4000) NOT NULL,
    EV_AT_LOCATION VARCHAR2(4000) NOT NULL,
    EV_AT_STATUS CHAR DEFAULT 'Y' CHECK( EV_AT_STATUS  IN ('Y','N')),
    EV_AT_REF_NO NUMBER,
    FOREIGN KEY (EV_AT_REF_NO) REFERENCES EVENT(EVENT_NO)
);

COMMENT ON TABLE EVENT_ATTACHMENT IS '이벤트 첨부파일';
COMMENT ON COLUMN EVENT_ATTACHMENT.EV_AT_FILENO IS '첨부파일번호'; 
COMMENT ON COLUMN EVENT_ATTACHMENT.EV_AT_ORIGIN IS '파일원본명'; 
COMMENT ON COLUMN EVENT_ATTACHMENT.EV_AT_NEWNAME IS '파일새이름';
COMMENT ON COLUMN EVENT_ATTACHMENT.EV_AT_LOCATION IS '파일 경로';
COMMENT ON COLUMN EVENT_ATTACHMENT.EV_AT_STATUS IS '첨부파일 상태';
COMMENT ON COLUMN EVENT_ATTACHMENT.EV_AT_REF_NO IS '참조 인증글번호'; 

--선행활동 테이블
CREATE TABLE VOLUNTEER (
    VOL_NO NUMBER PRIMARY KEY,
    VOL_TITLE VARCHAR2(1000) NOT NULL,
    VOL_CONTENT VARCHAR2(4000) NOT NULL,
    VOL_WRITER VARCHAR2(30) ,
    VOL_DATE DATE DEFAULT SYSDATE,
    VOL_POINT NUMBER,
    VOL_STATUS CHAR DEFAULT 'Y' CHECK(VOL_STATUS IN ('Y','N','B')),
    VOL_CATEGORY VARCHAR2(255) NOT NULL,
    FOREIGN KEY (VOL_WRITER) REFERENCES MEMBER(USER_ID)
);

COMMENT ON TABLE VOLUNTEER IS '선행활동 인증글';
COMMENT ON COLUMN VOLUNTEER.VOL_NO IS '인증글 번호';
COMMENT ON COLUMN VOLUNTEER.VOL_TITLE IS '인증글 제목';
COMMENT ON COLUMN VOLUNTEER.VOL_CONTENT IS '인증글 내용';
COMMENT ON COLUMN VOLUNTEER.VOL_WRITER IS '인증글 작성자';
COMMENT ON COLUMN VOLUNTEER.VOL_DATE IS '인증글 작성일';
COMMENT ON COLUMN VOLUNTEER.VOL_POINT IS '인증 포인트';
COMMENT ON COLUMN VOLUNTEER.VOL_CATEGORY IS '카테고리';
COMMENT ON COLUMN VOLUNTEER.VOL_STATUS IS '인증글 상태(Y/공개, N/비공개, B/승인된 글)';

--선행활동 댓글 테이블
CREATE TABLE VOLUNTEER_REPLY (
    VOL_REPLY_NO NUMBER PRIMARY KEY,
    VOL_REF_NO NUMBER ,
    VOL_REPLY_WRITER VARCHAR2(30),
    VOL_REPLY_CONTENT VARCHAR2(2000),
    VOL_REPLY_STATUS CHAR DEFAULT 'Y' CHECK(VOL_REPLY_STATUS IN ('Y','N')),
    VOL_REPLY_DATE DATE DEFAULT SYSDATE,
    FOREIGN KEY (VOL_REF_NO) REFERENCES VOLUNTEER(VOL_NO),
    FOREIGN KEY (VOL_REPLY_WRITER) REFERENCES MEMBER(USER_ID)
);

COMMENT ON TABLE VOLUNTEER_REPLY IS '선행활동 인증 댓글';
COMMENT ON COLUMN VOLUNTEER_REPLY.VOL_REPLY_NO IS '댓글 번호';
COMMENT ON COLUMN VOLUNTEER_REPLY.VOL_REF_NO IS '참조인증글 번호';
COMMENT ON COLUMN VOLUNTEER_REPLY.VOL_REPLY_WRITER IS '댓글 작성자';
COMMENT ON COLUMN VOLUNTEER_REPLY.VOL_REPLY_CONTENT IS '댓글 내용';
COMMENT ON COLUMN VOLUNTEER_REPLY.VOL_REPLY_DATE IS '댓글 작성일';
COMMENT ON COLUMN VOLUNTEER_REPLY.VOL_REPLY_STATUS IS '댓글 상태(Y/공개, N/비공개)';

--선행활동 첨부파일 테이블 
CREATE TABLE VOL_ATTACHMENT (
	VOL_AT_FILENO NUMBER PRIMARY KEY,
    VOL_AT_ORIGIN VARCHAR2(4000) NOT NULL,
    VOL_AT_NEWNAME VARCHAR2(4000) NOT NULL,
    VOL_AT_LOCATION VARCHAR2(4000) NOT NULL,
    VOL_AT_STATUS CHAR DEFAULT 'Y' CHECK(VOL_AT_STATUS IN ('Y','N')),
    VOL_AT_REF_NO NUMBER,
    FOREIGN KEY (VOL_AT_REF_NO) REFERENCES VOLUNTEER(VOL_NO)
);

COMMENT ON TABLE VOL_ATTACHMENT IS '선행활동 첨부파일';
COMMENT ON COLUMN VOL_ATTACHMENT.VOL_AT_FILENO IS '첨부파일번호'; 
COMMENT ON COLUMN VOL_ATTACHMENT.VOL_AT_ORIGIN IS '파일원본명'; 
COMMENT ON COLUMN VOL_ATTACHMENT.VOL_AT_NEWNAME IS '파일새이름';
COMMENT ON COLUMN VOL_ATTACHMENT.VOL_AT_LOCATION IS '파일 경로';
COMMENT ON COLUMN VOL_ATTACHMENT.VOL_AT_STATUS IS '첨부파일 상태';
COMMENT ON COLUMN VOL_ATTACHMENT.VOL_AT_REF_NO IS '참조 인증글번호'; 

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

-- 공지사항 테이블 수정!!
ALTER TABLE NOTICE DROP(NO_STATUS);
ALTER TABLE NOTICE ADD(NO_ORIGIN VARCHAR(4000));
ALTER TABLE NOTICE ADD(NO_NEW VARCHAR(4000));

COMMENT ON COLUMN NOTICE.NO_ORIGIN IS '파일원이름';
COMMENT ON COLUMN NOTICE.NO_NEW IS '파일새이름';

--2 자주 묻는 질문 카테고리				
CREATE TABLE FAQ_TYPE (
	F_TYPENO	NUMBER	PRIMARY KEY,
	F_TYPENAME	VARCHAR2(30)	NOT NULL
);
--자주 묻는 질문 카테고리	 테이블 코멘트
COMMENT ON TABLE FAQ_TYPE IS '사진 첨부 파일';
COMMENT ON COLUMN FAQ_TYPE.F_TYPENO IS '질문 카테고리 번호'; 
COMMENT ON COLUMN FAQ_TYPE.F_TYPENAME IS '질문 카테고리 이름'; 

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

--7 은행
CREATE TABLE BANK (
	BANK_NO	NUMBER 	PRIMARY KEY,
	BANK_NAME	VARCHAR2(20)	NOT NULL
);
--은행 테이블 코멘트
COMMENT ON TABLE BANK IS '은행';
COMMENT ON COLUMN BANK.BANK_NO IS '은행번호'; 
COMMENT ON COLUMN BANK.BANK_NAME IS '은행명'; 

--사용자 테이블 외래키들
    ALTER TABLE NOTICE ADD CONSTRAINT FK_NOTICE FOREIGN KEY (NO_WRITER)REFERENCES MEMBER (USER_ID);
    ALTER TABLE ASK ADD CONSTRAINT FK_ASK FOREIGN KEY (ASK_ID)REFERENCES MEMBER (USER_ID);
    ALTER TABLE PAYMENT ADD CONSTRAINT FK_PAYMENT FOREIGN KEY (USER_ID)REFERENCES MEMBER (USER_ID);
    
-- 18. 물품 카테고리
CREATE TABLE GOODS_CATEGORY	(
    GOODS_CATEGORY_NO NUMBER  NOT NULL,
    GOODS_CATEGORY_NAME VARCHAR2(30)  NOT NULL,
    CONSTRAINT PK_GOODS_CATEGORY PRIMARY KEY(GOODS_CATEGORY_NO)
);
COMMENT ON TABLE GOODS_CATEGORY  IS '물품 카테고리';
COMMENT ON COLUMN GOODS_CATEGORY.GOODS_CATEGORY_NO IS '물품 카테고리 번호';
COMMENT ON COLUMN GOODS_CATEGORY.GOODS_CATEGORY_NAME IS '물품 카테고리 이름';

-- 36.펀딩프로젝트 카테고리				
CREATE TABLE FUNDING_CATEGORY (
    FUNDING_CATEGORY_NO NUMBER NOT NULL,
    FUNDING_CATEGORY_NAME VARCHAR2(30) NOT NULL,
    CONSTRAINT PK_FUNDING_CATEGORY_NO PRIMARY KEY(FUNDING_CATEGORY_NO)
);
COMMENT ON TABLE FUNDING_CATEGORY IS '펀딩프로젝트 카테고리';
COMMENT ON COLUMN FUNDING_CATEGORY.FUNDING_CATEGORY_NO IS '펀딩프로젝트 카테고리 번호';
COMMENT ON COLUMN FUNDING_CATEGORY.FUNDING_CATEGORY_NAME IS '펀딩 카테고리 이름';

-- 6_구호물품 
CREATE TABLE GOODS(
    GOODS_NO NUMBER NOT NULL,
    GOODS_NAME VARCHAR2(50) NOT NULL,
    GOODS_PRICE NUMBER NOT NULL,
    GOODS_CATEOGRY_NO NUMBER NOT NULL,
    CONTENT VARCHAR2(4000) NOT NULL,
    THUMBNAIL_ORIGIN_NAME VARCHAR2(1000),
    THUMBNAIL_CHANGE_NAME VARCHAR2(1000),
    HITS NUMBER DEFAULT 0 NOT NULL,
    CONSTRAINT PK_GOODS PRIMARY KEY(GOODS_NO)
);
COMMENT ON TABLE GOODS IS '구호물품';
COMMENT ON COLUMN GOODS.GOODS_NO IS '구호물품 번호';
COMMENT ON COLUMN GOODS.GOODS_NAME IS '구호물품명';
COMMENT ON COLUMN GOODS.GOODS_PRICE IS '가격';
COMMENT ON COLUMN GOODS.GOODS_CATEOGRY_NO IS '물품카테고리번호';
COMMENT ON COLUMN GOODS.CONTENT IS '구호 물품 내용';
COMMENT ON COLUMN GOODS.THUMBNAIL_ORIGIN_NAME IS '구호물품 대표사진 원래 이름';
COMMENT ON COLUMN GOODS.THUMBNAIL_CHANGE_NAME IS '구호물품 대표사진 바뀐 이름';
COMMENT ON COLUMN GOODS.HITS IS '구호물품 조회수';

------------------------------------------------------

--후원처 테이블
CREATE TABLE BENEFICIARY(
    BE_NO NUMBER PRIMARY KEY,
    BE_NAME VARCHAR2(100) NOT NULL,
    BE_TEL VARCHAR2(30) NOT NULL,
    BE_ADDRESS VARCHAR2(50) NOT NULL,
    BE_EMAIL VARCHAR2(30) NOT NULL,
    BE_REGISTRATION DATE DEFAULT SYSDATE NOT NULL 
);
COMMENT ON COLUMN BENEFICIARY.BE_NO IS '후원처번호';
COMMENT ON COLUMN BENEFICIARY.BE_NAME IS '후원처명';
COMMENT ON COLUMN BENEFICIARY.BE_TEL IS '전화번호';
COMMENT ON COLUMN BENEFICIARY.BE_ADDRESS IS '주소';
COMMENT ON COLUMN BENEFICIARY.BE_EMAIL IS '이메일';
COMMENT ON COLUMN BENEFICIARY.BE_REGISTRATION IS '등록일';

--------------------------------------
-- 7. 구호물품 구매 목록
CREATE TABLE GOODS_PURCHASE	(
    PURCHASE_NO NUMBER  NOT NULL,
    USER_ID VARCHAR2(30) NOT NULL,
    GOODS_NO NUMBER NOT NULL,
    BENEFICIARY_NO NUMBER NOT NULL, 
    PURCHASE_AMOUNT NUMBER NOT NULL,
    PURCHASE_PRICE NUMBER NOT NULL,
    PURCHASE_DATE DATE DEFAULT SYSDATE NOT NULL,
    PUCHASE_MEANS NUMBER NOT NULL,
    CONSTRAINT FK_GOODS_USER_ID_1 FOREIGN KEY(USER_ID) REFERENCES MEMBER(USER_ID) ON DELETE CASCADE,
    CONSTRAINT FK_GOODS_N_O FOREIGN KEY(GOODS_NO) REFERENCES GOODS(GOODS_NO) ON DELETE CASCADE,
    CONSTRAINT FK_BENEFICIARY_NO_1 FOREIGN KEY(BENEFICIARY_NO) REFERENCES BENEFICIARY(BE_NO) ON DELETE CASCADE,
    CONSTRAINT FK_PUCHASE_MEANS_1 FOREIGN KEY(PUCHASE_MEANS) REFERENCES PAYMENT(PAY_NO) ON DELETE CASCADE,
    CONSTRAINT PK_GOODS_PURCHASE PRIMARY KEY(PURCHASE_NO,USER_ID)
);		
COMMENT ON TABLE GOODS_PURCHASE IS '구호물품구매목록';
COMMENT ON COLUMN GOODS_PURCHASE.PURCHASE_NO IS '구매 목록 번호';
COMMENT ON COLUMN GOODS_PURCHASE.USER_ID IS '유저 ID';
COMMENT ON COLUMN GOODS_PURCHASE.GOODS_NO IS '구호물품 번호';
COMMENT ON COLUMN GOODS_PURCHASE.BENEFICIARY_NO IS '후원처 번호';
COMMENT ON COLUMN GOODS_PURCHASE.PURCHASE_AMOUNT IS '개수';
COMMENT ON COLUMN GOODS_PURCHASE.PURCHASE_PRICE IS '가격';
COMMENT ON COLUMN GOODS_PURCHASE.PURCHASE_DATE IS '구매 날짜';
COMMENT ON COLUMN GOODS_PURCHASE.PUCHASE_MEANS IS '결제 수단';

-- 17_후원처 필요 물품 카테고리	
CREATE TABLE REQUIRED_CATEGORY(
    GOODS_CATEGORY_NO NUMBER NOT NULL,
    BENEFICIARY_NO NUMBER NOT NULL,
    CONSTRAINT FK_REQUIRD_GOODS_CATEGORY_NO_1 FOREIGN KEY(GOODS_CATEGORY_NO) REFERENCES GOODS_CATEGORY(GOODS_CATEGORY_NO) ON DELETE CASCADE,
    CONSTRAINT FK_REQUIRED_BENEFICIARY_NO_1 FOREIGN KEY(BENEFICIARY_NO) REFERENCES BENEFICIARY(BE_NO) ON DELETE CASCADE,
    CONSTRAINT PK_GOODS_1 PRIMARY KEY(GOODS_CATEGORY_NO,BENEFICIARY_NO)
);
COMMENT ON TABLE REQUIRED_CATEGORY IS '후원처 필요 물품 카테고리';
COMMENT ON COLUMN REQUIRED_CATEGORY.GOODS_CATEGORY_NO IS '물품 카테고리';
COMMENT ON COLUMN REQUIRED_CATEGORY.BENEFICIARY_NO IS '후원처번호';

-- 구호물품 첨부파일
CREATE TABLE GOODS_IMAGE(
    GOODS_NO NUMBER NOT NULL,
    IMG_NO NUMBER NOT NULL,
    IMG_ORIGIN_NAME VARCHAR2(1000) NOT NULL,
    IMG_CHANGE_NAME VARCHAR2(1000) NOT NULL,
    CONSTRAINT FK_IMAGE_GOODS_NO FOREIGN KEY(GOODS_NO) REFERENCES GOODS(GOODS_NO) ON DELETE CASCADE,
    CONSTRAINT PK_IMAGE_GOODS_NO PRIMARY KEY(IMG_NO)
);
COMMENT ON TABLE GOODS_IMAGE IS '구호물품_첨부파일';
COMMENT ON COLUMN GOODS_IMAGE.GOODS_NO IS '구호물품 게시글 번호';
COMMENT ON COLUMN GOODS_IMAGE.IMG_NO IS '첨부파일 번호';
COMMENT ON COLUMN GOODS_IMAGE.IMG_ORIGIN_NAME IS '이미지 변경된 이름';
COMMENT ON COLUMN GOODS_IMAGE.IMG_CHANGE_NAME IS '이미지 기존 이름';

-- 펀딩프로젝트 
CREATE TABLE FUNDING_PROJECT (
    FP_NO NUMBER,
    FP_NAME VARCHAR2(100) NOT NULL,
    HOST_ID VARCHAR2(50) NOT NULL,
    GOAL NUMBER NOT NULL,
    RAISED NUMBER DEFAULT 0,
    START_DATE DATE NOT NULL,
    CLOSING_DATE DATE NOT NULL,
    CONTENT VARCHAR2(1000) NOT NULL,
    PAYMENT_DATE DATE NOT NULL,
    CATEGORY_NO NUMBER  NOT NULL,
    HITS NUMBER DEFAULT 0 NOT NULL,
    STATUS VARCHAR2(3) DEFAULT 'Y',
    THUMBNAIL_ORIGIN_NAME VARCHAR2(1000),
    THUMBNAIL_CHANGE_NAME VARCHAR2(1000),
	  NUMBER_SUPPORTER NUMBER DEFAULT 0,
    FP_WRITE_DATE DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT FK_FP_CATEGORY_NO FOREIGN KEY(CATEGORY_NO) REFERENCES FUNDING_CATEGORY(FUNDING_CATEGORY_NO) ON DELETE CASCADE,
    CONSTRAINT FK_FP_HOST_ID FOREIGN KEY(HOST_ID) REFERENCES MEMBER(USER_ID) ON DELETE CASCADE,
    CONSTRAINT PK_FUNDING_PROJECT PRIMARY KEY(FP_NO)
);
COMMENT ON TABLE FUNDING_PROJECT IS '펀딩 프로젝트';
COMMENT ON COLUMN FUNDING_PROJECT.FP_NO IS '프로젝트 번호';
COMMENT ON COLUMN FUNDING_PROJECT.FP_NAME IS '프로젝트 명';
COMMENT ON COLUMN FUNDING_PROJECT.HOST_ID IS '프로젝트 주최자';
COMMENT ON COLUMN FUNDING_PROJECT.GOAL IS '목표 금액';
COMMENT ON COLUMN FUNDING_PROJECT.RAISED IS '현재 금액';
COMMENT ON COLUMN FUNDING_PROJECT.START_DATE IS '프로젝트 시작일';
COMMENT ON COLUMN FUNDING_PROJECT.CLOSING_DATE IS '프로젝트 마감일';
COMMENT ON COLUMN FUNDING_PROJECT.CONTENT IS '프로젝트 내용';
COMMENT ON COLUMN FUNDING_PROJECT.PAYMENT_DATE IS '프로젝트 결제 예정 일자';
COMMENT ON COLUMN FUNDING_PROJECT.CATEGORY_NO IS '펀딩프로젝트 카테고리 번호';
COMMENT ON COLUMN FUNDING_PROJECT.HITS IS '프로젝트 조회수';
COMMENT ON COLUMN FUNDING_PROJECT.STATUS IS '상태';
COMMENT ON COLUMN FUNDING_PROJECT.NUMBER_SUPPORTER IS '후원자수';
COMMENT ON COLUMN FUNDING_PROJECT.THUMBNAIL_ORIGIN_NAME IS '프로젝트 대표이미지 기존 이름';
COMMENT ON COLUMN FUNDING_PROJECT.THUMBNAIL_CHANGE_NAME IS '프로젝트 대표이미지 바뀐 이름';

-- 펀딩 프로젝트 펀딩 품목
CREATE TABLE FUNDING_GOODS(
    FP_NO NUMBER NOT NULL,
    FG_NO NUMBER NOT NULL,
    FG_NAME VARCHAR2(500) NOT NULL,
    FG_CONTENT VARCHAR2(2000)  NOT NULL,
    FG_PRICE NUMBER NOT NULL,
    CONSTRAINT FK_FUNDING_GOODS_NO FOREIGN KEY(FP_NO) REFERENCES FUNDING_PROJECT(FP_NO) ON DELETE CASCADE,
    CONSTRAINT PK_FUNDING_GOODS_NO PRIMARY KEY(FP_NO,FG_NO)
);
COMMENT ON TABLE FUNDING_GOODS IS '펀딩 프로젝트 펀딩 품목';
COMMENT ON COLUMN FUNDING_GOODS.FP_NO IS '프로젝트 번호';
COMMENT ON COLUMN FUNDING_GOODS.FG_NO IS '펀딩 품목 번호';
COMMENT ON COLUMN FUNDING_GOODS.FG_NAME IS '펀딩 품목 이름';
COMMENT ON COLUMN FUNDING_GOODS.FG_CONTENT IS '펀딩 품목 내용';
COMMENT ON COLUMN FUNDING_GOODS.FG_PRICE IS '펀딩 품목 가격';

-- 펀딩 후원자 목록
CREATE TABLE FUNDING_SUPPORTER	(
    FS_NO NUMBER NOT NULL,
    FP_NO NUMBER NOT NULL,
    FP_SUPPORTER VARCHAR2(30) NOT NULL,
    FP_SUPPORT_DATE DATE NOT NULL ,
    FP_PRICE NUMBER  NOT NULL,
    FG_NO NUMBER  NOT NULL,
    TAKE_NAME VARCHAR2(20),
    TAKE_ADDRESS VARCHAR2(300),
    TAKE_PHONE VARCHAR2(30),
    TAKE_POSTCODE NUMBER,
    CONSTRAINT FK_FUNDING_FG_NO FOREIGN KEY(FG_NO,FP_NO) REFERENCES FUNDING_GOODS(FG_NO,FP_NO) ON DELETE CASCADE,
    CONSTRAINT FK_FUNDING_SUPPORTER FOREIGN KEY(FP_SUPPORTER) REFERENCES MEMBER(USER_ID) ON DELETE CASCADE,
    CONSTRAINT FK_FUNDING_ FOREIGN KEY(PAY_NO) REFERENCES PAYMENT(PAY_NO) ON DELETE CASCADE,
    CONSTRAINT PK_FS_NO PRIMARY KEY(FS_NO,FP_NO)
);

COMMENT ON TABLE FUNDING_SUPPORTER IS '펀딩 후원자 목록';
COMMENT ON COLUMN FUNDING_SUPPORTER.FS_NO IS '펀딩후원 번호';
COMMENT ON COLUMN FUNDING_SUPPORTER.FP_NO IS '펀딩 프로젝트 번호';
COMMENT ON COLUMN FUNDING_SUPPORTER.FP_SUPPORTER IS '펀딩 후원자';
COMMENT ON COLUMN FUNDING_SUPPORTER.FP_SUPPORT_DATE IS '펀딩 후원 일자';
COMMENT ON COLUMN FUNDING_SUPPORTER.FP_PRICE IS '후원 금액';
COMMENT ON COLUMN FUNDING_SUPPORTER.FG_NO IS '펀딩 품목 번호';
COMMENT ON COLUMN FUNDING_SUPPORTER.TAKE_NAME IS '받는이 이름';
COMMENT ON COLUMN FUNDING_SUPPORTER.TAKE_ADDRESS IS '받는이 주소';
COMMENT ON COLUMN FUNDING_SUPPORTER.TAKE_PHONE IS '받는이 전화번호';
COMMENT ON COLUMN FUNDING_SUPPORTER.TAKE_POSTCODE IS '받는이 우편번호';
COMMENT ON COLUMN FUNDING_SUPPORTER.PAY_NO IS '결제 수단 번호';

-- 펀딩프로젝트 첨부파일
CREATE TABLE FUNDING_IMAGE(
    FP_NO NUMBER NOT NULL,
    IMG_NO NUMBER NOT NULL,
    IMG_ORIGIN_NAME VARCHAR2(1000) NOT NULL,
    IMG_CHANGE_NAME VARCHAR2(1000) NOT NULL,
    CONSTRAINT FK_IMAGE_FP_NO FOREIGN KEY(FP_NO) REFERENCES FUNDING_PROJECT(FP_NO) ON DELETE CASCADE,
    CONSTRAINT PK_IMG_NO PRIMARY KEY(IMG_NO,FP_NO)
);
COMMENT ON TABLE FUNDING_IMAGE IS '펀딩프로젝트_첨부파일';
COMMENT ON COLUMN FUNDING_IMAGE.FP_NO IS '펀딩프로젝트 게시글 번호';
COMMENT ON COLUMN FUNDING_IMAGE.IMG_NO IS '첨부파일 번호';
COMMENT ON COLUMN FUNDING_IMAGE.IMG_ORIGIN_NAME IS '이미지 변경된 이름';
COMMENT ON COLUMN FUNDING_IMAGE.IMG_CHANGE_NAME IS '이미지 기존 이름';

-- 펀딩 프로젝트 댓글
CREATE TABLE FUNDING_REPLY(
    REPLY_NO NUMBER,
    REPLY_WRITER VARCHAR2(30),
    REF_FUNDING_NO NUMBER,
    CREATE_DATE DATE,
    REPLY_CONTENT VARCHAR2(1000),
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN ('Y','N')),
    CONSTRAINT FK_REF_BNO FOREIGN KEY(REF_FUNDING_NO) REFERENCES FUNDING_PROJECT(FP_NO) ON DELETE CASCADE,
    CONSTRAINT FK_REPLY_WRITER FOREIGN KEY(REPLY_WRITER) REFERENCES MEMBER(USER_ID) ON DELETE CASCADE,
    CONSTRAINT PK_FP_REPLY_NO PRIMARY KEY(REPLY_NO)
);
COMMENT ON TABLE  FUNDING_REPLY IS '펀딩 프로젝트 댓글';
COMMENT ON COLUMN FUNDING_REPLY.REPLY_NO IS '댓글 번호';
COMMENT ON COLUMN FUNDING_REPLY.REPLY_WRITER IS '작성자';
COMMENT ON COLUMN FUNDING_REPLY.REF_FUNDING_NO IS '게시글 번호';
COMMENT ON COLUMN FUNDING_REPLY.CREATE_DATE IS '댓글 작성일';
COMMENT ON COLUMN FUNDING_REPLY.REPLY_CONTENT IS '댓글 내용';
COMMENT ON COLUMN FUNDING_REPLY.STATUS IS '댓글 상태';


--후원카테고리 테이블
CREATE TABLE SUPPORT_CATEGORY(
    SU_CATEGORY_NO NUMBER PRIMARY KEY,
    SU_CATEGORY_NAME VARCHAR2(100) NOT NULL
);
COMMENT ON COLUMN SUPPORT_CATEGORY.SU_CATEGORY_NO IS '후원카테고리 번호';
COMMENT ON COLUMN SUPPORT_CATEGORY.SU_CATEGORY_NAME IS '후원카테고리명';

-----------------------------------------

--후원후기 테이블
CREATE TABLE REVIEW(
    RE_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(30) NOT NULL,
    RE_TITLE VARCHAR2(100) NOT NULL,
    RE_CONTENT VARCHAR2(1000) NOT NULL,
    RE_DATE DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT FK_USER_ID FOREIGN KEY (USER_ID) REFERENCES MEMBER(USER_ID)
);
COMMENT ON COLUMN REVIEW.RE_NO IS '후기번호';
COMMENT ON COLUMN REVIEW.USER_ID IS '작성자';
COMMENT ON COLUMN REVIEW.RE_TITLE IS '후기제목';
COMMENT ON COLUMN REVIEW.RE_CONTENT IS '후기내용';
COMMENT ON COLUMN REVIEW.RE_DATE IS '작성일';
 
--------------     REVIEW_COMMENT 테이블	   -----------------------
CREATE TABLE REVIEW_COMMENT (
    RE_NO NUMBER PRIMARY KEY,
    RE_CONTENT VARCHAR2(400),
    RE_BNO NUMBER,
    RE_WRITER VARCHAR2(255) NOT NULL,
    RE_CREATE_DATE DATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
    FOREIGN KEY (RE_BNO) REFERENCES REVIEW(RE_NO),
    FOREIGN KEY (RE_WRITER) REFERENCES MEMBER(USER_ID)
);
COMMENT ON COLUMN REVIEW_COMMENT.RE_NO IS '후원후기 댓글번호';
COMMENT ON COLUMN REVIEW_COMMENT.RE_CONTENT IS '후원후기 댓글내용';
COMMENT ON COLUMN REVIEW_COMMENT.RE_BNO IS '게시글 번호';
COMMENT ON COLUMN REVIEW_COMMENT.RE_WRITER IS '작성자';
COMMENT ON COLUMN REVIEW_COMMENT.RE_CREATE_DATE IS '댓글 작성일';
COMMENT ON COLUMN REVIEW_COMMENT.STATUS IS '댓글 상태';
--------------------------------------------
--후원프로젝트 
CREATE TABLE SUPPORT (
    SU_NO NUMBER PRIMARY KEY,
    SU_TITLE VARCHAR2(100) NOT NULL,
    SU_WRITER VARCHAR2(30) NOT NULL,
    SU_START DATE NOT NULL,
    SU_LAST DATE NOT NULL,
    SU_DATE DATE DEFAULT SYSDATE NOT NULL,
    SU_CONTENT VARCHAR2(4000) NOT NULL,
    SU_TARGET VARCHAR2(100) NOT NULL,
    SU_BSTART DATE NOT NULL,
    SU_BLAST DATE NOT NULL,
    THUMBNAILORIGIN VARCHAR2(1000) NOT NULL,
    THUMBNAILCHANGE VARCHAR2(1000) NOT NULL,
    SU_CATEGORY NUMBER NOT NULL,
    SU_SATUTS VARCHAR2(5) DEFAULT 'Y' NOT NULL,
    CONSTRAINT CK_SU_SATUTS CHECK(SU_SATUTS IN('Y','N')),
    CONSTRAINT FK_SU_CATEGORY FOREIGN KEY (SU_CATEGORY) REFERENCES SUPPORT_CATEGORY(SU_CATEGORY_NO)
);
COMMENT ON COLUMN SUPPORT.SU_NO IS '후원프로젝트 번호';
COMMENT ON COLUMN SUPPORT.SU_TITLE IS '후원프로젝트 제목';
COMMENT ON COLUMN SUPPORT.SU_WRITER IS '주최자';
COMMENT ON COLUMN SUPPORT.SU_START IS '후원 시작일';
COMMENT ON COLUMN SUPPORT.SU_LAST IS '후원 마감일';
COMMENT ON COLUMN SUPPORT.SU_DATE IS '작성일';
COMMENT ON COLUMN SUPPORT.SU_CONTENT IS '내용';
COMMENT ON COLUMN SUPPORT.SU_TARGET IS '사업대상';
COMMENT ON COLUMN SUPPORT.SU_BSTART IS '사업시작일';
COMMENT ON COLUMN SUPPORT.SU_BLAST IS '사업마감일';
COMMENT ON COLUMN SUPPORT.THUMBNAILORIGIN IS '썸네일변경전';
COMMENT ON COLUMN SUPPORT.THUMBNAILCHANGE IS '썸네일변경후';
COMMENT ON COLUMN SUPPORT.SU_CATEGORY IS '후원카테고리 번호';
COMMENT ON COLUMN SUPPORT.SU_SATUTS IS '활성화 여부';

--기부금 사용계획서 테이블
CREATE TABLE SUPPORT_USE_PLAN(
    SU_NO NUMBER NOT NULL,
    UP_NO NUMBER NOT NULL,
    UP_CONTENT VARCHAR2(1000) NOT NULL,
    UP_AMOUNT NUMBER NOT NULL,
    CONSTRAINT FK_SUPPORT_USE_PLAN FOREIGN KEY(SU_NO) REFERENCES SUPPORT(SU_NO) ON DELETE CASCADE,
    CONSTRAINT PK_SUPPORT_USE_PLAN PRIMARY KEY(SU_NO, UP_NO)
);
COMMENT ON COLUMN SUPPORT_USE_PLAN.UP_NO IS '사용계획번호';
COMMENT ON COLUMN SUPPORT_USE_PLAN.UP_CONTENT IS '상세내용';
COMMENT ON COLUMN SUPPORT_USE_PLAN.UP_AMOUNT IS '사용금액';

--------------     SUPPORT_COMMENT 테이블	   -------------------
CREATE TABLE SUPPORT_COMMENT (
    SP_NO NUMBER PRIMARY KEY,
    SP_CONTENT VARCHAR2(400),
    SP_BNO NUMBER,
    SP_WRITER VARCHAR2(255) NOT NULL,
    SP_CREATE_DATE DATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
    FOREIGN KEY (SP_BNO) REFERENCES SUPPORT(SU_NO),
    FOREIGN KEY (SP_WRITER) REFERENCES MEMBER(USER_ID)
);
COMMENT ON COLUMN SUPPORT_COMMENT.SP_NO IS '후원프젝 댓글번호';
COMMENT ON COLUMN SUPPORT_COMMENT.SP_CONTENT IS '후원프젝 댓글내용';
COMMENT ON COLUMN SUPPORT_COMMENT.SP_BNO IS '게시글 번호';
COMMENT ON COLUMN SUPPORT_COMMENT.SP_WRITER IS '작성자';
COMMENT ON COLUMN SUPPORT_COMMENT.SP_CREATE_DATE IS '댓글 작성일';
COMMENT ON COLUMN SUPPORT_COMMENT.STATUS IS '댓글 상태';

-------------------------------------------------------
--후원프로젝트 첨부파일 테이블
CREATE TABLE SUPPORT_IMAGE(
    IMG_NO NUMBER PRIMARY KEY,
    SU_NO NUMBER NOT NULL,
    IMG_ORIGIN_NAME VARCHAR2(1000) NOT NULL,
    IMG_CHANGE_NAME VARCHAR2(1000) NOT NULL,
    CONSTRAINT FK_SU_NO FOREIGN KEY (SU_NO) REFERENCES SUPPORT(SU_NO) ON DELETE CASCADE
);
COMMENT ON COLUMN SUPPORT_IMAGE.SU_NO IS '후원게시글 번호';
COMMENT ON COLUMN SUPPORT_IMAGE.IMG_NO IS '첨부파일 번호';
COMMENT ON COLUMN SUPPORT_IMAGE.IMG_ORIGIN_NAME IS '이미지 변경된 이름';
COMMENT ON COLUMN SUPPORT_IMAGE.IMG_CHANGE_NAME IS '이미지 기존 이름';


----------------------------------------------

--후원후기 첨부파일 테이블
CREATE TABLE REVIEW_IMAGE(
    IMG_NO NUMBER PRIMARY KEY,
    RE_NO NUMBER NOT NULL,
    IMG_ORIGIN_NAME VARCHAR2(1000) NOT NULL,
    IMG_CHANGE_NAME VARCHAR2(1000) NOT NULL,
    CONSTRAINT FK_RE_NO FOREIGN KEY (RE_NO) REFERENCES REVIEW(RE_NO) ON DELETE CASCADE
);
COMMENT ON COLUMN REVIEW_IMAGE.RE_NO IS '후원후기 번호';
COMMENT ON COLUMN REVIEW_IMAGE.IMG_NO IS '첨부파일 번호';
COMMENT ON COLUMN REVIEW_IMAGE.IMG_ORIGIN_NAME IS '이미지 변경된 이름';
COMMENT ON COLUMN REVIEW_IMAGE.IMG_CHANGE_NAME IS '이미지 기존 이름';

-------------------------------------

--후원인 목록 테이블
CREATE TABLE SPONSOR(
    USER_ID VARCHAR2(30) NOT NULL,
    SU_NO NUMBER NOT NULL,
    PAY_NO NUMBER NOT NULL,
    PAY_AMOUNT NUMBER NOT NULL,
    CONSTRAINT FK_USER_ID_1 FOREIGN KEY (USER_ID) REFERENCES MEMBER(USER_ID),
    CONSTRAINT FK_SU_NO_1 FOREIGN KEY (SU_NO) REFERENCES SUPPORT(SU_NO),
    CONSTRAINT FK_PAY_NO_1 FOREIGN KEY (PAY_NO) REFERENCES PAYMENT(PAY_NO) 
);
COMMENT ON COLUMN SPONSOR.USER_ID IS '후원인';
COMMENT ON COLUMN SPONSOR.SU_NO IS '후원프로젝트 번호';
COMMENT ON COLUMN SPONSOR.PAY_NO IS '결제번호';
COMMENT ON COLUMN SPONSOR.PAY_AMOUNT IS '후원금액';

---------------------------------------


-- 후원프로젝트 테이블 시퀀스
CREATE SEQUENCE SEQ_SUPPORT
INCREMENT BY 1
START WITH 1
CACHE 20;


-- 후원인 테이블 시퀀스
CREATE SEQUENCE SEQ_SPONSOR
INCREMENT BY 1
START WITH 1
CACHE 20;

-- 후원카테고리 테이블 시퀀스
CREATE SEQUENCE SEQ_SUPPORT_CATEGORY
INCREMENT BY 1
START WITH 1
CACHE 20;

-- 후기 테이블 시퀀스
CREATE SEQUENCE SEQ_REVIEW
INCREMENT BY 1
START WITH 1
CACHE 20;

-- 후원처 테이블 시퀀스
CREATE SEQUENCE SEQ_BENEFICIARY
INCREMENT BY 1
START WITH 1
CACHE 20;

-- 기부금 사용계획서 테이블 시퀀스
CREATE SEQUENCE SEQ_SUPPORT_USE_PLAN
INCREMENT BY 1
START WITH 1
CACHE 20;

-- 후원후기 첨부파일 테이블 시퀀스
CREATE SEQUENCE SEQ_REVIEW_IMAGE
INCREMENT BY 1
START WITH 1
CACHE 20;

-- 후원프로젝트 첨부파일 테이블 시퀀스
CREATE SEQUENCE SEQ_SUPPORT_IMAGE
INCREMENT BY 1
START WITH 1
CACHE 20;

--은행 테이블 시퀀스
CREATE SEQUENCE SEQ_BANK
INCREMENT BY 1
START WITH 1
CACHE 100;

--공지사항 테이블 시퀀스
CREATE SEQUENCE SEQ_NOTICE
INCREMENT BY 1
START WITH 1
CACHE 100;

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

--자주 묻는 질문 테이블 시퀀스
CREATE SEQUENCE SEQ_ASK
INCREMENT BY 1
START WITH 1
CACHE 100;

--결제수단 테이블 시퀀스
CREATE SEQUENCE SEQ_PAYMENT
INCREMENT BY 1
START WITH 1
CACHE 100;

-- 펀딩프로젝트 게시글 번호
CREATE SEQUENCE SEQ_FUNDING_PROJECT
INCREMENT BY 1
START WITH 1
CACHE 20;

-- 구호물품 게시글 번호
CREATE SEQUENCE SEQ_GOODS
INCREMENT BY 1
START WITH 1
CACHE 20;

-- 펀딩프로젝트 카테고리 번호
CREATE SEQUENCE SEQ_FUNDING_CATEGORY
INCREMENT BY 1
START WITH 1
CACHE 20;

-- 구호물품 카테고리 번호
CREATE SEQUENCE SEQ_GOODS_CATEGORY
INCREMENT BY 1
START WITH 1
CACHE 20;

--펀딩프로젝트 댓글 번호
CREATE SEQUENCE SEQ_FUNDING_REPLY
INCREMENT BY 1
START WITH 1
CACHE 20;

-- 펀딩프로젝트 첨부파일 번호
CREATE SEQUENCE SEQ_FUNDING_IMAGE
INCREMENT BY 1
START WITH 1
CACHE 20;


CREATE SEQUENCE SEQ_EV NOCACHE;
CREATE SEQUENCE SEQ_EV_REPLY NOCACHE;
CREATE SEQUENCE SEQ_EV_ATTA NOCACHE;
CREATE SEQUENCE SEQ_VOL NOCACHE;
CREATE SEQUENCE SEQ_VOL_REPLY NOCACHE;
CREATE SEQUENCE SEQ_VOL_ATTA NOCACHE;

CREATE SEQUENCE SEQ_ATT NOCACHE;
CREATE SEQUENCE SEQ_SPC NOCACHE;
CREATE SEQUENCE SEQ_REC NOCACHE;


-- -------------------------- TRIGGER --------------------------------

-- 각 펀딩 프로젝트 후원 총액 트리거
CREATE OR REPLACE TRIGGER TRG_FUNDING_RAISED
AFTER
INSERT ON FUNDING_SUPPORTER
FOR EACH ROW
BEGIN
    UPDATE FUNDING_PROJECT SET RAISED =:NEW.FP_PRICE + RAISED WHERE FP_NO=:NEW.FP_NO;
END;
/

-- 각 펀딩 프로젝트 후원자 명수
CREATE OR REPLACE TRIGGER TRG_FUNDING_NUMBER_SUPPORTER
AFTER
INSERT ON FUNDING_SUPPORTER
FOR EACH ROW
BEGIN
    UPDATE FUNDING_PROJECT SET NUMBER_SUPPORTER = NUMBER_SUPPORTER+1 WHERE FP_NO=:NEW.FP_NO;
END;
/
commit;