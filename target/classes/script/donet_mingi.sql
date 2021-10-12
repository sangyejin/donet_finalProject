-- 테이블 리셋 
DROP TABLE EVENT;               --이벤트 테이블
DROP TABLE EVENT_REPLY;         --이벤트 댓글 
DROP TABLE EVENT_ATTACHMENT;    --이벤트 첨부파일
DROP TABLE VOLUNTEER;           --선행활동 테이블
DROP TABLE VOLUNTEER_REPLY;     --선행활동 댓글
DROP TABLE VOL_ATTACHMENT;      --선행활동 첨부파일


DROP SEQUENCE SEQ_EV NOCACHE;
DROP SEQUENCE SEQ_EV_REPLY NOCACHE;
DROP SEQUENCE SEQ_EV_ATTA NOCACHE;
DROP SEQUENCE SEQ_VOL NOCACHE;
DROP SEQUENCE SEQ_VOL_REPLY NOCACHE;
DROP SEQUENCE SEQ_VOL_ATTA NOCACHE;



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
COMMENT ON COLUMN EVENT_REPLY.EV_EVENT_NO IS '참조이벤트 번호';
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
    EV_AT_STATUS CHAR DEFAULT 'Y' CHECK(VOL_AT_STATUS IN ('Y','N')),
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
    FOREIGN KEY (VOL_WRITER) REFERENCES MEMBER(USER_ID)
);

COMMENT ON TABLE VOLUNTEER_REPLY IS '선행활동 인증 댓글';
COMMENT ON COLUMN VOLUNTEER_REPLY.VOL_REPLY_NO IS '댓글 번호';
COMMENT ON COLUMN VOLUNTEER_REPLY.VOL_VOL_NO IS '참조인증글 번호';
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

CREATE SEQUENCE SEQ_EV NOCACHE;
CREATE SEQUENCE SEQ_EV_REPLY NOCACHE;
CREATE SEQUENCE SEQ_EV_ATTA NOCACHE;
CREATE SEQUENCE SEQ_VOL NOCACHE;
CREATE SEQUENCE SEQ_VOL_REPLY NOCACHE;
CREATE SEQUENCE SEQ_VOL_ATTA NOCACHE;