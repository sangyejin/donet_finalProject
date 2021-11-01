-- FUNDING INSERT


insert into funding_category values(SEQ_FUNDING_CATEGORY.NEXTVAL,'기타');
insert into funding_category values(SEQ_FUNDING_CATEGORY.NEXTVAL,'동물');
insert into funding_category values(SEQ_FUNDING_CATEGORY.NEXTVAL,'재난');
insert into funding_category values(SEQ_FUNDING_CATEGORY.NEXTVAL,'고아');


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
insert into FUNDING_GOODS(FP_NO, FG_NO, FG_NAME, FG_CONTENT, FG_PRICE)
values (i,1,'엽서','엽서 2장 및 강아지 간식', 2000);
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
FOR i in 100..116
LOOP
insert into GOODS
values (SEQ_GOODS.NEXTVAL,i||'밸런스 애견사료 3kg',5500,4,'보호소의 추운 겨울에 사료마저 부족어쩌구 <br> 밸런스 애견사료는 어쩌구저쩌구 <br> 보호소에 따뜻한 어쩌구가 되어주세요','12345678.jpg','12345678.jpg',default,default,default,TO_DATE('21-08-10','YY-MM-DD'));
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
SELECT MAX(PURCHASE_NO) FROM GOODS_PURCHASE WHERE USER_ID='admin';
commit;