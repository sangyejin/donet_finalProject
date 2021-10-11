CREATE TABLE SUPPORT_USE_PLAN(
    UP_NO VARCHAR2(30) PRIMARY KEY,
    UP_CONTENT VARCHAR2(1000) NOT NULL,
    UP_AMOUNT NUMBER NOT NULL
);
--DROP TABLE SUPPORT_USE_PLAN;

COMMENT ON COLUMN SUPPORT_USE_PLAN.UP_NO IS '사용계획번호';
COMMENT ON COLUMN SUPPORT_USE_PLAN.UP_CONTENT IS '상세내용';
COMMENT ON COLUMN SUPPORT_USE_PLAN.UP_AMOUNT IS '사용금액';

--------------------------------

CREATE TABLE BENEFICIARY(
    BE_NO VARCHAR2(30) PRIMARY KEY,
    BE_NAME VARCHAR2(100) NOT NULL,
    BE_TEL VARCHAR2(30) NOT NULL,
    BE_ADDRESS VARCHAR2(50) NOT NULL,
    BE_EMAIL VARCHAR2(30) NOT NULL,
    BE_REGISTRATION DATE DEFAULT SYSDATE NOT NULL 
);

--DROP TABLE BENEFICIARY;

COMMENT ON COLUMN BENEFICIARY.BE_NO IS '후원처번호';
COMMENT ON COLUMN BENEFICIARY.BE_NAME IS '후원처명';
COMMENT ON COLUMN BENEFICIARY.BE_TEL IS '전화번호';
COMMENT ON COLUMN BENEFICIARY.BE_ADDRESS IS '주소';
COMMENT ON COLUMN BENEFICIARY.BE_EMAIL IS '이메일';
COMMENT ON COLUMN BENEFICIARY.BE_REGISTRATION IS '등록일';

--------------------------------------

CREATE TABLE REVIEW(
    RE_NO VARCHAR2(30) PRIMARY KEY,
    USER_ID VARCHAR2(30) NOT NULL,
    RE_TITLE VARCHAR2(100) NOT NULL,
    RE_CONTENT VARCHAR2(1000) NOT NULL,
    RE_DATE DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT FK_USER_ID FOREIGN KEY (USER_ID) REFERENCES MEMBER(USER_ID)
);

--DROP TABLE REVIEW;

COMMENT ON COLUMN REVIEW.RE_NO IS '후기번호';
COMMENT ON COLUMN REVIEW.USER_ID IS '작성자';
COMMENT ON COLUMN REVIEW.RE_TITLE IS '후기제목';
COMMENT ON COLUMN REVIEW.RE_CONTENT IS '후기내용';
COMMENT ON COLUMN REVIEW.RE_DATE IS '작성일';

--------------------------------------------

CREATE TABLE SUPPORT_IMAGE(
    SU_NO VARCHAR2(30) NOT NULL,
    IMG_ID VARCHAR2(30) NOT NULL,
    CONSTRAINT FK_SU_NO FOREIGN KEY (SU_NO) REFERENCES SUPPORT(SU_NO),
    CONSTRAINT FK_IMG_ID FOREIGN KEY (IMG_ID) REFERENCES IMAGE(IMG_ID)
);

--DROP TABLE REVIEW;

COMMENT ON COLUMN SUPPORT_IMAGE.SU_NO IS '후원게시글 번호';
COMMENT ON COLUMN SUPPORT_IMAGE.IMG_ID IS '첨부파일 번호';

----------------------------------------------

CREATE TABLE REVIEW_IMAGE(
    RE_NO VARCHAR2(30) NOT NULL,
    IMG_ID VARCHAR2(30) NOT NULL,
    CONSTRAINT FK_RE_NO FOREIGN KEY (RE_NO) REFERENCES REVIEW(RE_NO),
    CONSTRAINT FK_IMG_ID FOREIGN KEY (IMG_ID) REFERENCES IMAGE(IMG_ID)
);

--DROP TABLE REVIEW_IMAGE;

COMMENT ON COLUMN REVIEW_IMAGE.RE_NO IS '후원후기 번호';
COMMENT ON COLUMN REVIEW_IMAGE.IMG_ID IS '첨부파일 번호';

-------------------------------------

CREATE TABLE SPONSOR(
    USER_ID VARCHAR2(30) NOT NULL,
    SU_NO VARCHAR2(30) NOT NULL,
    PAY_NO VARCHAR2(30) NOT NULL,
    PAY_AMOUNT NUMBER NOT NULL,
    CONSTRAINT FK_USER_ID FOREIGN KEY (USER_ID) REFERENCES MEMBER(USER_ID),
    CONSTRAINT FK_SU_NO FOREIGN KEY (SU_NO) REFERENCES SUPPORT(SU_NO),
    CONSTRAINT FK_PAY_NO FOREIGN KEY (PAY_NO) REFERENCES PAYMENT(PAY_NO) 
);

--DROP TABLE SPONSOR;

COMMENT ON COLUMN SPONSOR.USER_ID IS '후원인';
COMMENT ON COLUMN SPONSOR.SU_NO IS '후원프로젝트 번호';
COMMENT ON COLUMN SPONSOR.PAY_NO IS '결제번호';
COMMENT ON COLUMN SPONSOR.PAY_AMOUNT IS '후원금액';

---------------------------------------

CREATE TABLE SUPPORT_CATEGORY(
    SU_CATEGORY_NO VARCHAR2(30) PRIMARY KEY,
    SU_CATEGORY_NAME VARCHAR2(100) NOT NULL
);

--DROP TABLE SUPPORT_CATEGORY;

COMMENT ON COLUMN SUPPORT_CATEGORY.SU_CATEGORY_NO IS '후원카테고리 번호';
COMMENT ON COLUMN SUPPORT_CATEGORY.SU_CATEGORY_NAME IS '후원카테고리명';

-----------------------------------------

CREATE TABLE SUPPORT(
    SU_NO VARCHAR2(30) PRIMARY KEY,
    SU_TITLE VARCHAR2(100) NOT NULL,
    SU_START DATE NOT NULL,
    SU_LAST DATE NOT NULL,
    SU_CONTENT VARCHAR2(4000) NOT NULL,
    SU_ATTACH VARCHAR2(30),
    SU_WRITER VARCHAR2(30) NOT NULL,
    SU_DATE DATE DEFAULT SYSDATE NOT NULL,
    SU_SATUTS CHAR DEFAULT 'Y' NOT NULL,
    SU_THUMBNAIL VARCHAR2(1000) NOT NULL,
    SU_USEPLAN VARCHAR2(30) NOT NULL,
    SU_TARGET VARCHAR2(100) NOT NULL,
    SU_BSTART DATE NOT NULL,
    SU_BLAST DATE NOT NULL,
    SU_CATEGORY VARCHAR2(100) NOT NULL,
    CONSTRAINT FK_SU_ATTACH FOREIGN KEY (SU_ATTACH) REFERENCES SUPPORT_IMAGE(SU_NO),
    CONSTRAINT CK_SU_SATUTS CHECK(SU_SATUTS IN('Y','N')),
    CONSTRAINT FK_SU_USEPLAN FOREIGN KEY (SU_USEPLAN) REFERENCES SUPPORT_USE_PLAN(UP_NO),
    CONSTRAINT FK_SU_CATEGORY FOREIGN KEY (SU_CATEGORY) REFERENCES SUPPORT_CATEGORY(SU_CATEGORY_NO)
);

--DROP TABLE SUPPORT;

COMMENT ON COLUMN SUPPORT.SU_NO IS '후원프로젝트 번호';
COMMENT ON COLUMN SUPPORT.SU_TITLE IS '후원프로젝트 제목';
COMMENT ON COLUMN SUPPORT.SU_START IS '후원 시작일';
COMMENT ON COLUMN SUPPORT.SU_LAST IS '후원 마감일';
COMMENT ON COLUMN SUPPORT.SU_CONTENT IS '내용';
COMMENT ON COLUMN SUPPORT.SU_ATTACH IS '첨부파일 번호';
COMMENT ON COLUMN SUPPORT.SU_WRITER IS '주최자';
COMMENT ON COLUMN SUPPORT.SU_DATE IS '작성일';
COMMENT ON COLUMN SUPPORT.SU_SATUTS IS '활성화 여부';
COMMENT ON COLUMN SUPPORT.SU_THUMBNAIL IS '대표사진';
COMMENT ON COLUMN SUPPORT.SU_USEPLAN IS '기부금 사용계획표 번호';
COMMENT ON COLUMN SUPPORT.SU_TARGET IS '사업대상';
COMMENT ON COLUMN SUPPORT.SU_BSTART IS '사업시작일';
COMMENT ON COLUMN SUPPORT.SU_BLAST IS '사업마감일';
COMMENT ON COLUMN SUPPORT.SU_CATEGORY IS '후원카테고리 번호';



