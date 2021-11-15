-- FUNDING INSERT
insert into funding_category values(SEQ_FUNDING_CATEGORY.NEXTVAL,'기타');
insert into funding_category values(SEQ_FUNDING_CATEGORY.NEXTVAL,'동물');
insert into funding_category values(SEQ_FUNDING_CATEGORY.NEXTVAL,'재난');
insert into funding_category values(SEQ_FUNDING_CATEGORY.NEXTVAL,'고아');
BEGIN
FOR i in 1..5
LOOP
insert into funding_project 
values (SEQ_FUNDING_PROJECT.NEXTVAL,i||'크아아악','admin',100000000,100000,
        to_date('2021-9-02'),to_date('2021-10-13'),'난민들의 고통을 어쩌구 <br>도와주세요 <br>', sysdate,
        3,default,default,'2020.jpg'
        ,'2020.jpg',default,sysdate);
END LOOP;
END;
/
BEGIN
FOR i in 1..20
LOOP
insert into funding_project 
values (SEQ_FUNDING_PROJECT.NEXTVAL,'유기견을 향한 마음','admin',1000000,2400000,
        to_date('2021-10-02'),to_date('2021-11-13'),'유기견을 보호하기위한 어쩌구 내용 캠페인 어쩌구', sysdate,
        1,default,default,'github.png'
        ,'github.png',default,sysdate);
END LOOP;
END;
/
BEGIN
FOR i in 1..20
LOOP
insert into funding_project 
values (SEQ_FUNDING_PROJECT.NEXTVAL,i||'유기묘를 향한 마음, 따뜻한 겨울 보내기 프로젝트','admin',i||'1000'||i||'000',i||'200000',
         To_DATE('21-09-'||i), To_DATE('21-11-'||i),'유기묘를 보호하기 위한 펀딩 프로젝트입니다. <br> 겨울철 간단하게 설치할 수 있는 숨숨집을 준비해보았습니다. 데운 물병을 오랫동안 따뜻함을 유지시켜줄 파우치도 계획했습니다. <br> 겨울에 우리의 잊혀진 이웃들이 함께 따뜻한 겨울을 보낼 수 있도록 도와주세요. ',
        1,default,default,'github.png'
        ,'github.png',default, To_DATE('21-08-'||i));
END LOOP;
END;
/
BEGIN
FOR i in 7..20
LOOP
insert into FUNDING_GOODS(FP_NO, FG_NO, FG_NAME, FG_CONTENT, FG_PRICE)
values (i,3,'파우치, 담요 스티로폼 숨숨집','스티로폼 숨숨집과 숨숨집을 따뜻하게 해줄 담요, 데운 물병을 오랫동안 유지시켜줄 파우치', i||'000');
END LOOP;
END;
/

BEGIN
FOR i in 1..20
LOOP
INSERT INTO FUNDING_SUPPORTER(FS_NO,FP_NO,FP_SUPPORTER,FP_SUPPORT_DATE,FP_PRICE,FG_NO
						,TAKE_NAME,TAKE_ADDRESS,TAKE_PHONE,TAKE_POSTCODE)
		VALUES(NVL((SELECT MAX(FS_NO) FROM FUNDING_SUPPORTER WHERE FP_NO=i),0)+1,i,'admin',sysdate,23424,1,'sdf','gggg','010-0234-2134',1234);
END LOOP;
END;
/



-- GOODS INSERT

insert into goods_category values(SEQ_GOODS_CATEGORY.NEXTVAL,'펫용품');
insert into goods_category values(SEQ_GOODS_CATEGORY.NEXTVAL,'음식');
insert into goods_category values(SEQ_GOODS_CATEGORY.NEXTVAL,'침구');
insert into goods_category values(SEQ_GOODS_CATEGORY.NEXTVAL,'의류');

BEGIN
FOR i in 1..10
LOOP
insert into GOODS
values (SEQ_GOODS.NEXTVAL,i||'밸런스 애견사료 3kg',8900,3,'보호소의 추운 겨울에 사료마저 부족어쩌구 <br> 밸런스 애견사료는 어쩌구저쩌구 <br> 보호소에 따뜻한 어쩌구가 되어주세요','12345678.jpg','12345678.jpg',default,default,default,TO_DATE('21-10-30','YY-MM-DD'));
END LOOP;
END;
/

BEGIN
FOR i in 15..20
LOOP
insert into GOODS
values (SEQ_GOODS.NEXTVAL,i||'밸런스 애견사료 3kg',11500,2,'보호소의 추운 겨울에 사료마저 부족어쩌구 <br> 밸런스 애견사료는 어쩌구저쩌구 <br> 보호소에 따뜻한 어쩌구가 되어주세요','12345678.jpg','12345678.jpg',default,default,default,TO_DATE('21-10-31','YY-MM-DD'));
END LOOP;
END;
/
BEGIN
FOR i in 20..36
LOOP
insert into GOODS
values (SEQ_GOODS.NEXTVAL,i||'밸런스 애견사료 3kg',11500,4,'보호소의 추운 겨울에 사료마저 부족어쩌구 <br> 밸런스 애견사료는 어쩌구저쩌구 <br> 보호소에 따뜻한 어쩌구가 되어주세요','12345678.jpg','12345678.jpg',default,default,default,TO_DATE('21-09-20','YY-MM-DD'));
END LOOP;
END;
/
BEGIN
FOR i in 1..10
LOOP
insert into GOODS
values (SEQ_GOODS.NEXTVAL,i||'유기견 사료 3kg',5500,4,'보호소의 추운 겨울에 사료마저 부족어쩌구 <br> 밸런스 애견사료는 어쩌구저쩌구 <br> 보호소에 따뜻한 어쩌구가 되어주세요','12345678.jpg','12345678.jpg',default,default,default,TO_DATE('21-08-10','YY-MM-DD'));
END LOOP;
END;
/
BEGIN
FOR i in 11..18
LOOP
insert into GOODS
values (SEQ_GOODS.NEXTVAL,i||'두툼한 이불',i||'1500',3,'<p>추운 겨울이 다가오고있습니다.</p><p>그들은 겨울이 두렵습니다.</p><p>찬바람에 얼어죽지않기위해서 옹기종기 모여앉아 추위를 이겨내려합니다.</p><p>그들에게 따뜻함을 기부해주세요.</p><p><img src="/donet/resources/upload_files/goods/b7810c29-b82f-49e8-9968-19a6529f3e37.jpg" style="width: 788.522px; height: 525.458px;"></p><p><br></p><p><br></p><p><br></p>','1636637882473_273930.jpg','1636637882473_273930.jpg',default,default,default,TO_DATE('21-11-10','YY-MM-DD'));
END LOOP;
END;
/


BEGIN
FOR i in 1..20
LOOP
insert into beneficiary(BE_NO, BE_NAME, BE_TEL, BE_ADDRESS, BE_EMAIL, BE_REGISTRATION)
values(seq_beneficiary.nextval,'동물협회'||i,'02-1234-3456','서울특별시','ddd@gmail.com',TO_DATE('21-10-30','YY-MM-DD'));
END LOOP;
END;
/
BEGIN
FOR i in 1..5
LOOP
insert into beneficiary(BE_NO, BE_NAME, BE_TEL, BE_ADDRESS, BE_EMAIL, BE_REGISTRATION)
values(seq_beneficiary.nextval,'아동복지'||i,'02-1234-3456','서울특별시','ddd@gmail.com',TO_DATE('21-10-30','YY-MM-DD'));
END LOOP;
END;
/
BEGIN
FOR i in 1..5
LOOP
insert into beneficiary(BE_NO, BE_NAME, BE_TEL, BE_ADDRESS, BE_EMAIL, BE_REGISTRATION)
values(seq_beneficiary.nextval,'난민지원'||i,'02-1234-3456','서울특별시','ddd@gmail.com',TO_DATE('21-10-30','YY-MM-DD'));
END LOOP;
END;
/
commit;

select rownum,a.* from(select * from goods 
where status='Y'
order by hits) a
where rownum<3;

select rownum,a.* from(select * from FUNDING_PROJECT
where status='Y'
order by hits) a
where rownum<=3;

select rownum,a.* from
(select * from event
where event_status='Y'
order by event_last_date)
a
where rownum<3;

select rownum, a.* 
from(select * from NOTICE
        order by no_date desc) a
where rownum<3;

select rownum, a.*
from(select * from support
        where SU_SATUTS='Y'
        order by SU_LAST desc
    ) a
where rownum<3;
insert into notice
values(SEQ_NOTICE.nextval,'공지사항2','공지사항 내용입니다2',sysdate,'admin',default,default,default,default);
insert into event
values(SEQ_EV.nextval, '이벤트제목 3','이벤트 내용입니다 <br> 이벤트내용',sysdate,sysdate,default);
delete from support;
insert into support
values(seq_support.nextval,'후원프로젝트2','admin',sysdate,sysdate,sysdate,'후원프로젝트내용입니다2','사업대상',sysdate,sysdate,'1636036915241_9063796.jpg','1636036915241_9063796.jpg',1,default,default,default,default,'30000');
select FP_NO, FP_NAME, B.USER_NAME, GOAL,RAISED, START_DATE, CLOSING_DATE,A.FP_WRITE_DATE
    		, A.CATEGORY_NO, HITS, THUMBNAIL_ORIGIN_NAME
    		, THUMBNAIL_CHANGE_NAME, C.FUNDING_CATEGORY_NAME,CLOSING_DATE-START_DATE AS "D_Day"
		from FUNDING_PROJECT A
			join MEMBER B on A.HOST_ID=B.USER_ID
			join FUNDING_CATEGORY C on A.CATEGORY_NO = C.FUNDING_CATEGORY_NO
            where A.STATUS='Y'
            ORDER BY FP_WRITE_DATE DESC;

commit;
