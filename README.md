# DonetDotCom_finalProject
목차
---
- 프로젝트 소개 및 기획의도
- 유사프로그램 분석
- 요구사항 및 주요기능
- ERD
- 개발일정 및 개발환경
- 역할분담
- 코드리뷰_상예진
- 소감



프로젝트 소개 및 기획의도
---
![image](https://user-images.githubusercontent.com/84160329/142774405-76bddc60-d379-4666-8c9d-7e4d41d424a5.png)
> https://www.hankookilbo.com/News/Read/201912221551392334 한국일보 "기부하지 않는 이유 못 믿어서 크게 늘었다."

기부는 선의의 좋은 행동이다라는 것은 모두 인지하고 있지만 기부를 습관처럼 하는 사람은 보기 힘듭니다. 좋은 기부를 왜 안 할까요?
설문조사에 따르면 경제적 여력이 없음을 제외하고 대부분의 사람들이 기부를 하지 않는 이유는 후원단체에 신뢰가 가지 않아서, 기부하는 방법을 몰라서, 기부에 관심이 없어서 등 기부에 대한 무지와 관심에 대한 부재에 의해 파생되었습니다.


이러한 문제점에 착안하여 접근하기 어려운 기부에 대한 인식을 새로이 도모하고 돈을 기부하는 것 뿐만 아닌 사소한 행동으로도  따듯한 나무이 될 수 있는, 쉽게 기부에 접근할 수 있는 환경을 굴축하여 __"직접차여하는 기부 문화"__ 를 만드는 것을 목표로 프로젝트를 시작했습니다.




유사프로그램 분석
---
1. 해피빈
    - 다양한 후원목록을 조회해 해피콩으로 기부
2. 녹녹 펀딩
    - 환경을 주제로 특정 캠페인을 정해 지정 금액을 펀딩 
3. 그린피스
    - 정기/일시 후원금액을 결제해 후원


__도넷닷컴의 차별성__
1. 사용자의 능동적인 참여
    - 이벤트, 출석 등 다양한 컨텐츠로 사용자가 직접 만들어가는 후원사이트
2. 재미있고 색다른 후원방식
    - 포인트를 획득하는 다양한 방법
3. 사용자 친화적인 UI/UX
4. 후원에 대한 편리한 접근성



요구사항 및 주요기능
---
- 공통기능
  - 로그인, 로그아웃, 개인정보수정, 탈퇴
  - 게시글 목록조회/상세보기
- 회원
  - 고객센터 이용
    - FAQ 조회, 공지게시판 조회, 문의게시판 작성/수정/삭제
  - 후원하기
  - 선행활동게시글, 후원후기 작성/수정/삭제
  - 출석, 이벤트 참여
- 관리자
  - 선행활동 인증 후 포인트 지급
  - 펀딩, 구호물품 게시글 작성/수정/삭제
  - 후원 게시글 작성/삭제
  - 문의게시글 답변



ERD
---
![image](https://user-images.githubusercontent.com/84160329/142772832-4c13920b-edad-457c-b645-7775cc0dcfd1.png)

개발일정 및 개발환경
---
- 개발일정
![image](https://user-images.githubusercontent.com/84160329/142773930-18e7d16d-354b-4cbd-9135-d1d30cbfcc14.png)

- 개발환경
    - 운영체제 : Window 10
    - 개발도구 : Spring Framework
    - DBMS : Oracle DB - sqldeveloper
    - Server : Apache Tomcat 8.5
    - Language : Java, HTML5, CSS3, Javascript, JQuery, Servlet, JSP


역할분담
---
- 상예진(팀장)
  - 프로젝트 소개
  - 통계차트
  - 후원 페이지
- 김민기(팀원)
  - 이벤트 페이지
  - 선행활동 페이지
- 방태현(팀원)
  - 로그인/로그아웃
  - 마이페이지 및 회원페이지
  - 후원후기 페이지
- 왕수빈(팀원)
  - 메뉴바
  - 포인트 결제 기능
  - 고객센터 페이지
- 이윤정(팀원)
  - 메인 페이지
  - 구호물품 페이지
  - 펀딩 페이지
  
  
  
코드리뷰_상예진
---
__코드 리뷰에 앞서.. 제가 담당한 파트는..?__

1. 후원 프로젝트 목록 조회
  1-1. 게시글 등록일 순서로 목록 조회
  1-2. 카테고리별 조회
  1-3. 최신순/조회순/누적금액순/목표금액순 정렬
2. 후원 프로젝트 상세조회 
  2-1. 게시글 등록 시 입력한 정보 조회
  2-2. 댓글 조회/작성/수정/삭제
  2-3. 해당 프로젝트 후원자 목록 조회
3. 후원하기
4. 후원 프로젝트 작성/삭제
5. 프로젝트 소개 > 통계조회
  5-1. 구글차트 API 활용

---
__1-1. 후원 프로젝트 목록 조회__

메인페이지의 메뉴바에서 후원프로젝트 항목을 클릭하면 후원프로젝트의 목록을 조회할 수 있습니다. RequestMapping("list.do")에 연결된 컨트롤러로 목록 조회 요청이 들어오면 내부 로직 처리가 진행된 후 연결된 JSP에 필요한 값을 가져와 화면을 띄워주도록 했습니다.
```
    @RequestMapping("list.do")
	public String donationList(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage, Model model) {
		
		int listCount = donationService.selectDonationListCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 9);
		
		List<Support> list = donationService.selectDonationList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "donation/donationMain";
	}
```

![image](https://user-images.githubusercontent.com/84160329/142774007-96d9993d-e5fe-49b2-9e3f-3fc5d86e20c4.png)

- 프로젝트 타이틀은 게시글 div의 너비를 넘어가면 '...'와 함께 줄임표시가 되도록 했습니다.(상세보기에서는 줄바꿈후 오른쪽 정렬이 되도록 구현했습니다.)
- 후원목록에서는 후원자수와 누적후원금, 목표금액을 조회할 수 있도록 했는데, 이는 Trigger를 사용해서 프로젝트 등록 시 Support(후원테이블)에 바로바로 넣어주도록 했습니다.
```
    -- 프로젝트 후원 후 후원 누적금액 업데이트
    CREATE OR REPLACE TRIGGER TRG_SUPPORT_RAISED
    AFTER
    INSERT ON SPONSOR
    FOR EACH ROW
    BEGIN
        UPDATE SUPPORT SET TOTALAMOUNT =:NEW.PAY_AMOUNT + TOTALAMOUNT WHERE SU_NO=:NEW.SU_NO;
    END;
    /
    
    -- 프로젝트 후원 후 후원자수 업데이트
    CREATE OR REPLACE TRIGGER TRG_SUPPORT_TOTAL
    AFTER
    INSERT ON SPONSOR
    FOR EACH ROW
    BEGIN
        UPDATE SUPPORT SET TOTAL = 1 + TOTAL WHERE SU_NO=:NEW.SU_NO;
    END;
    /

    - 프로젝트 등록 시 기부사용계획서의 사용금액 누적금을 해당 프로젝트의 목표금액으로 
    CREATE OR REPLACE TRIGGER TRG_SUPPORT_GOAL
    AFTER
    INSERT ON SUPPORT_USE_PLAN
    FOR EACH ROW
    BEGIN
        UPDATE SUPPORT SET GOAL =:NEW.UP_AMOUNT + GOAL WHERE SU_NO=:NEW.SU_NO;
    END;
    /
```
- sql 내에서는 getsystemtime함수를 이용하여 date 타입으로 저장하므로 월일연도평일시분초 형태로 저장됩니다. fmt:formatdate를 활용해서 date 타입을 원하는 패턴(yyyy-MM-dd)형태로 출력해주었습니다. 달성률 또한 fmt:fornatNumber를 이용해서 "(누적금액/목표금액)*100"으로 계산해서 출력했습니다.
- 달성률에 의한 프로그래스바는 두 개의 span을 겹쳐서 내부 span의 너비를 위에서 계산한 달성률 값으로 주어 구현했습니다.


__1-2. 카테고리별 목록 조회__



