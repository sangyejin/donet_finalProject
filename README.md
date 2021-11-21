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

- 후원 프로젝트 목록 조회
	- 1-1. 게시글 등록일 순서로 목록 조회
	- 1-2. 카테고리별 조회
	- 1-3. 최신순/조회순/누적금액순/목표금액순 정렬
- 후원 프로젝트 상세조회 
	- 2-1. 게시글 등록 시 입력한 정보 조회
	- 2-2. 댓글 조회/작성/수정/삭제
	- 2-3. 해당 프로젝트 후원자 목록 조회
- 후원하기
- 후원 프로젝트 작성/삭제
- 프로젝트 소개 > 통계조회
	- 5-1. 구글차트 API 활용

---
[![코드리뷰 및 시연 영상_상예진](https://i9.ytimg.com/vi_webp/-goBmRarZyI/hqdefault.webp?v=619aad45&sqp=CMjY6owG&rs=AOn4CLAbNKaSKTR3z0jF-KzqutSZLqwtsw)](https://youtu.be/-goBmRarZyI?t=0s) 

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

- 프로젝트 타이틀은 게시글 div의 너비를 넘어가면 '...'와 함께 줄임표시가 되도록 했습니다.(상세보기에서는 줄바꿈후 오른쪽 정렬이 되도록 구현했습니다.)
```
	.supportTitle{
		margin-left:5%;
		width:265px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
```

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
- 달성률에 의한 progressbar는 두 개의 span을 겹쳐서 내부 span의 너비를 위에서 계산한 달성률 값으로 주어 구현했습니다.
```
	<c:if test="${!empty list}">
		<c:forEach items="${ list }" var="s" varStatus="status">
			<div class="supportList"
				onclick="location.href = 'detail.do?suNo=${s.suNo}'">
				<span class="supportOne">
					<div>
						<fmt:formatDate value="${s.suDate}" var="suDate"
							pattern="yyyy-MM-dd" />
						<span style="float: left; margin-left: 2%; color:black;"><b>작성일 ㅣ
								${suDate }</b></span> <span style="float: right; margin-right: 2%; color:black;"><b>조회수
								ㅣ ${s.hits }</b></span>
					</div>
					<div class="thumbnailImg">
						<img alt="" id="thumbnailImg"
							src="${ pageContext.servletContext.contextPath}/resources/upload_files/donation/${s.thumbnailChange}">
					</div>
					<div class="supportTitle">
						<b style="font-size:20px;color:black;">${s.suTitle}</b>
					</div>
					<div class="supportWriter">
						<b style="font-size:15px;color:black;">${s.suWriter}</b>
					</div>
					<div class="supportTerm">
						<fmt:formatDate value="${s.suStart}" var="suStart" pattern="yyyy-MM-dd" />
						<fmt:formatDate value="${s.suLast}" var="suLast" pattern="yyyy-MM-dd" />
						<b style="font-size:15px;color:black;">${suStart } ~ ${suLast } </b>
					</div>
					<div class="participation">
						<span>
							<img alt="" id="person"
								src="${ pageContext.servletContext.contextPath}/resources/imgs/donation/person.png">후원자수 ${s.total } 명
						</span>
						<fmt:formatNumber var="goalPersent" value="${(s.totalamount/s.goal)*100 }" pattern="0"/>
						<span style="float:right; margin-left:35%;">달성률: ${goalPersent} %</span>
					</div>

				<div class="progressBar">
					<span class="progressbar">
						<span class="gauge" style="width:${goalPersent}%;"></span>	
					</span>
				</div>
					<div class="totalAmount">
						<b style="margin-right:2%; font-size:18px;color:black;">누적 ${s.totalamount } 원</b>
					</div>

				</span>
			</div>
		</c:forEach>
	</c:if>
```

- 게시글은 3x3으로, 노출되는 페이지 수는 5개로 컨트롤러에서 페이징처리하여 출력해 주었습니다.
```
		<div class="pageOuter">
			<ul class="pagination" style="margin-left:40%;">
				<c:choose>
					<c:when test="${ pi.currentPage ne 1 }">
						<li class="page-item"><a class="page-link"
							href="list.do?currentPage=${ pi.currentPage-1 }"><</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled"><a class="page-link" href=""><</a></li>
					</c:otherwise>
				</c:choose>

				<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
					<c:choose>
						<c:when test="${ pi.currentPage ne p }">
							<li class="page-item"><a class="page-link"
								href="list.do?currentPage=${ p }">${ p }</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>


				<c:choose>
					<c:when test="${ pi.currentPage ne pi.maxPage }">
						<li class="page-item"><a class="page-link"
							href="list.do?currentPage=${ pi.currentPage+1 }">></a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled"><a class="page-link"
							href="list.do?currentPage=${ pi.currentPage+1 }">></a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
```

__1-2. 카테고리별 목록 조회__

후원 프로젝트 목록에 있는 카테고리 버튼 클릭 시 해당 버튼의 name 값을 RequestParam으로 받아와 mapper에서 받아온 카테고리명을 where절의 옵션으로 주어 목록을 출력했습니다.
```
	@RequestMapping("select.ca")
	public String selectCategory(Model model,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name = "suCategoryName", required = false) String suCategoryName) {

		SupportCategory suCategory = new SupportCategory();
		
		int listCount = donationService.selectDonationCaListCount(suCategory);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 9);
		
		List<Support> list = donationService.selectDonationCaList(pi, suCategory);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "donation/donationMain";
	}
```

__1-3. 최신순/조회순/누적금액순/목표금액순 정렬__

카테고리별 조회와 유사한 방식으로 셀렉트박스의 선택한 value 값을 mapper에 order by 옵션으로 주어 정렬했습니다.

---

__2-1. 게시글 등록 시 입력한 정보 상세조회__

후원 프로젝트에서 게시글 클릭 시 해당 프로젝트의 프로젝트 번호를 매개변수로 받아 게시글 상세조회를 할 수 있습니다. 프로젝트 상세조회 시 해당 게시글의 조회수가 증가합니다. 
```
//DonationController
	@RequestMapping("detail.do")
	public ModelAndView donationDetail(int suNo, ModelAndView mv){
		Support s = donationService.selectDonation(suNo);
		Sponsor p = donationService.selectSponsor(suNo);
		List<SupportUsePlan> u = donationService.selectSupportUsePlan(suNo);
		List<Sponsor> pList = donationService.selectSponsorList(suNo);
		List<SupportImage> ImgList = donationService.selectImageList(suNo);
		
		mv.addObject("s", s).setViewName("donation/donationDetail");
		mv.addObject("p", p).setViewName("donation/donationDetail");
		mv.addObject("u", u).setViewName("donation/donationDetail");
		mv.addObject("pList", pList).setViewName("donation/donationDetail");
		mv.addObject("ImgList", ImgList).setViewName("donation/donationDetail");

		return mv;
	}
```
```
// DonationServiceImpl
	@Override
	public Support selectDonation(int suNo) {
		Support s = null;
		int result = supportDao.increaseCount(sqlSession, suNo); //조회수 증가
		
		if (result < 0) {
			throw new CommException("조회수 증가 실패");
		} else {
			s = supportDao.selectBoard(sqlSession, suNo); //게시글 조회
		}

		return s;
	}
```

- 해당 프로젝트의 support(후원테이블) 객체를 불러와 목록에 노출된 썸네일과 프로젝트 정보를 조회 할 수 있습니다.
- 프로젝트 등록 시 썸네일은 support객체에 저장하고 그 외에 첨부한 이미지는 saveFile메소드를 통해 supportImage객체에 저장하여 이미지 슬라이더로 구현했습니다. 이미지 슬라이더는 css로 3초 후 자동으로 넘어가게 했으면 좌우 버튼을 클릭해서 페이지를 넘길 수 있도록 구현했습니다.
```
<!-- 이미지 슬라이더 jsp-->
<div class="slider-1">
	<div class="slides">
		<c:forEach items="${ ImgList }" var="ImgList" varStatus="status">
			<c:choose>
				<c:when test="${ status.index==0 }">
					<div class="active"
						style="background-image:url(${ pageContext.servletContext.contextPath}/resources/upload_files/donation/${ImgList.imgChangeName }?auto=compress,format);"></div>
				</c:when>
				<c:otherwise>
					<div
						style="background-image:url(${ pageContext.servletContext.contextPath}/resources/upload_files/donation/${ImgList.imgChangeName }?auto=compress,format);"></div>
				</c:otherwise>
			</c:choose>

		</c:forEach>
	</div>
	<div class="page-btns">
		<c:forEach items="${ ImgList }" var="ImgList" varStatus="status">
			<c:choose>
				<c:when test="${ status.index==0 }">
					<div class="active"></div>
				</c:when>
				<c:otherwise>
					<div></div>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
	<div class="side-btns">
		<div>
			<span class="fas fa-angle-left"><</span>
		</div>
		<div>
			<span class="fas fa-angle-right">></span>
		</div>
	</div>
</div>

	<script>
		$('.slider-1 > .page-btns > div').click(function() {
			var $this = $(this);
			var index = $this.index();

			$this.addClass('active');
			$this.siblings('.active').removeClass('active');

			var $slider = $this.parent().parent();

			var $current = $slider.find(' > .slides > div.active');

			var $post = $slider.find(' > .slides > div').eq(index);

			$current.removeClass('active');
			$post.addClass('active');
		});

		// 좌/우 버튼 추가 슬라이더
		$('.slider-1 > .side-btns > div').click(function() {
			var $this = $(this);
			var $slider = $this.closest('.slider-1');

			var index = $this.index();
			var isLeft = index == 0;

			var $current = $slider.find(' > .page-btns > div.active');
			var $post;

			if (isLeft) {
				$post = $current.prev();
			} else {
				$post = $current.next();
			}
			;

			if ($post.length == 0) {
				if (isLeft) {
					$post = $slider.find(' > .page-btns > div:last-child');
				} else {
					$post = $slider.find(' > .page-btns > div:first-child');
				}
			}
			;

			$post.click();
		});

		setInterval(function() {
			$('.slider-1 > .side-btns > div').eq(1).click();
		}, 3000);
	</script>
	
```
__2-2. 댓글 조회/작성/수정/삭제__

프로젝트 상세조회 시 해당 프로젝트 마다 댓글 기능을 구현했습니다. 댓글 조회는 공통기능으로 모두 가능하나 댓글 작성/수정/삭제는 로그인한 유저만 이용가능합니다. 해당 기능은 ajax를 활용하여 비동기식 처리했습니다. 때문에 프로젝트를 새로고침하지 않아도 해당 정보 조회나 변경된 사항을 부분적으로 바로바로 조회 할 수 있습니다. 

- 프로젝트 로드 시 해당 프로젝트 댓글객체 정보를 받아오도록 작성했고, 댓글 작성/수정/삭제 시에는 댓글조회 메소드를 실행하도록 하여 부분적으로 데이터를 받아오도록 했습니다. 댓글조회 시 로그인유저와 댓글작성자가 일치할 경우 수정과 삭제 버튼이 활성화됩니다.
```
function selectReplyList() {

	var suNo = "${s.suNo}";

	$.ajax({
		url : "list.re",
		data : {suNo : suNo},
		type : "get",
		success : function(commentList) {
			$("#rcount").text(commentList.length);


			var num = commentList.length
			var value = "";
			$.each(commentList, function(i, obj) {
				value += "<tr>"
					+ "<td>"+ num--+ "</td>"
					+ "<td>"+ obj.createDate+ "</td>"
					+ "<td colspan='1'>"+ obj.replyWriter+ "</td>"
					+ "<td colspan='6' style='text-align:left;'>"+ obj.replyContent+ "</td>"

				if ("${loginUser.userId}" == obj.replyWriter) {
					value += "<td colspan='2' style='border-top: 1px solid #808080;'>"
					+ "<div>"
						+ "<span style='margin-left:60px;'><input type='submit' id='delete' value='삭제' onclick='deleteReply("+ obj.replyNo+ ")'></span>"
						+ "<span style='display:inline-block; float:right;'><button id='update' data-toggle='modal' data-target='#modifyModal'>수정</button></span>"
					+ "</div>"
					+ "</td>";
				} else {
					value += "<td></td><td></td>";
				}
				value += "<td style='visibility:hidden; border-bottom: 1px solid #808080;'>"+ obj.replyNo+ "</td></tr>";
			});
			$("#replyArea tbody").html(value);
		},
		error : function() {
			console.log("댓글 리스트조회용 ajax 통신 실패");
		}
	});
}
```

- 프로젝트 수정은 modal을 활용하여 구현해보았습니다. 수정 버튼을 클릭하면 해당 댓글의 정보를 modal에 받아오고 댓글내용만 수정이 가능하도록 하여 ajax 처리 해주었습니다.
```
	<div class="modal fade" id="modifyModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="reply_no">댓글 번호</label> <input class="form-control"
							id="reply_no" name="reply_no" readonly>
					</div>
					<div class="form-group">
						<label for="reply_date">댓글 작성일</label> <input class="form-control"
							id="reply_date" name="reply_date" readonly>
					</div>
					<div class="form-group">
						<label for="reply_text">댓글 내용</label> <input class="form-control"
							id="reply_text" name="reply_text" placeholder="댓글 내용을 입력해주세요">
					</div>
					<div class="form-group">
						<label for="reply_writer">댓글 작성자</label> <input
							class="form-control" id="reply_writer" name="reply_writer"
							readonly>
					</div>
					<div class="form-group" style="visibility: hidden;">
						<label for="reply_rno">댓글 고유번호</label> <input class="form-control"
							id="reply_rno" name="reply_rno" readonly>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default pull-left"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-success modalModBtn"
						onclick="updateReply();">수정</button>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		$(document).on("click", "#update", function() {
			var row = $(this).parent().parent().parent().parent();
			var tr = row.children();

			var replyNo = tr.eq(0).text();
			var createDate = tr.eq(1).text();
			var replyWriter = tr.eq(2).text();
			var replyContent = tr.eq(3).text();
			var replyRno = tr.eq(5).text();

			$(".modal-body #reply_no").val(replyNo);
			$(".modal-body #reply_date").val(createDate);
			$(".modal-body #reply_writer").val(replyWriter);
			$(".modal-body #reply_text").val(replyContent);
			$(".modal-body #reply_rno").val(replyRno);
		});

		function updateReply() {
			if (confirm("댓글을 수정하시겠습니까?(Y/N)")) {
				const suNo = "${s.suNo}";
				console.log(suNo);
				const content = $('#reply_text').val();
				console.log(content);
				const replyNo = $('#reply_rno').val();
				console.log(replyNo);

				$.ajax({
					url : "update.re/" + suNo + "/" + replyNo,
					type : "post",
					data : {
						replyContent : content
					},
					success : function() {
						alert("댓글이 수정되었습니다");
						selectReplyList();
					},
					error : function() {
						console.log("댓글 리스트조회용 ajax 통신 실패");
					}
				});
			}

		}
	</script>
```

- 댓글 조회는 해당 프로젝트의 댓글의 status가 'Y'인 값만 가져오도록 했습니다. 따라서 댓글 삭제는 해당 댓글의 status를 'Y'에서 'N'으로 변경하여 댓글 조회 할 수 없도록 하였습니다.
```
//Controller
	@ResponseBody
	@RequestMapping(value="delete.re/{replyNo}")
	public String deleteReply(@PathVariable("replyNo")int replyNo) {
		int result = donationService.deleteReply(replyNo);
		System.out.println(replyNo);
		System.out.println(result);
		
		return String.valueOf(result);
	}
	
//support-mapper
	<update id="deleteReply" parameterType="_int">
		UPDATE SUPPORT_COMMENT
		SET SC_STATUS='N'
		WHERE SC_NO=#{replyNo}
	</update>
```
---

__3. 후원하기__

프로젝트 상세조회 시 해당 프로젝트를 후원할 수 있습니다. 후원하기는 로그인한 유저만 이용가능하며 로그인하지 않은 회원은 로그인 페이지로 화면이 전환됩니다. 또한, 후원기간이 만료된 프로젝트는 후원하기 버튼이 비활성화되도록 구현하였습니다.

- 후원하기는 0원 이상의 후원금액을 입력하고 약관동의에 체크를 한 경우만 후원이 가능합니다. 이 때, 입력한 후원금액이 보유한 포인트보다 적은 경우는 포인트 충전 페이지로 화면이 전환됩니다. 
```
			$("#supportBtn").click(function(){
				if($("#agree").is(":checked")==true){
					var amount = $("#addPrice").val();
					if(amount!=0){
						
						if(Number("${loginUser.point}")<Number($("#addPrice").val())){
							alert("포인트 충전 후 후원이 가능합니다.");
							location.href="point.me";
						}else {
								var suNo = "${p.suNo}";
								

									$.ajax({
										url : "supportCharity?suNo="+suNo,
										type : "post",
										data : {
											amount : amount,
											suNo : suNo,
											userId : "${loginUser.userId}"
										},
										success : function(result) {
												alert("후원 성공!!");
												location.href="list.do";
												
										},
										error : function() {
											console.log("댓글 작성 ajax 통신 실패");
										}
									});


						}
					}else{
						alert("후원금액을 입력해주세요.");
					}
				}else{
					alert("유료이용약관에 동의해주세요.");					
				}
			});
```

- 무사히 후원을 한 후에는 sponsor(후원자테이블)에 해당 유저를 insert 처리하고 해당 프로젝트의 후원자목록과 후원자수, 누적후원금을 업데이트 합니다.(Trigger, 위에서 설명) 또한, 세션에 반영해주어 로그인 유저의 보유포인트에서 해당 후원금액만큼 차감해주었습니다. 
```
		@SessionAttributes("loginUser") 
		
		@RequestMapping(value="supportCharity")
		public String insertSupportCharity(int suNo, Sponsor s, Model model) {
			s.setUserId(((Member)model.getAttribute("loginUser")).getUserId());
			s.setSuNo(suNo);
			donationService.insertSupportCharity(s);
			
			Member loginUser = memberService.selectThisUser((Member)model.getAttribute("loginUser"));
			model.addAttribute("loginUser", loginUser);
			return "redirect:/list.do";
		}
```

---

__4. 후원 프로젝트 작성/삭제__

관리자로 로그인하면 프로젝트 등록과 삭제하기 버튼이 활성화 됩니다.

- 프로젝트 등록 시, 첨부한 이미지파일이 썸네일일 경우는 해당 프로젝트의 support객체에 저장하여 목록에서 볼 수 있게 하고, 그 외에 첨부한 이미지들은 supportImage객체에 저장하여 이미지 슬라이더로 상세보기 시 조회 가능하도록 구현하였습니다.
```
	@RequestMapping("insert.bo")
	public String insertBoard(Support support, HttpServletRequest request, MultipartHttpServletRequest multipartRequest
			,@ModelAttribute SupportUsePlanList supportUsePlan, Model model)
			throws Exception {
		List<SupportUsePlan> list= supportUsePlan.getSupportUsePlan();
		
		Map<String, MultipartFile> mMap= multipartRequest.getFileMap(); 
		List<SupportImage> imgList = new ArrayList<>(); 
		
		Map<String, List<MultipartFile>> paramMap = multipartRequest.getMultiFileMap();
		for (Entry<String, List<MultipartFile>> entry : paramMap.entrySet()) {
			
			List<MultipartFile> fileList=entry.getValue(); 
			
			for(int i=0; i<fileList.size();i++) {
				String fileName=fileList.get(i).getOriginalFilename();
				if(fileName!="") { 
					String originName = fileList.get(i).getOriginalFilename();
					String changeName = saveFile(fileList.get(i),request);
					System.out.println("change "+changeName);
					if( (entry.getKey()).equals("thumbFile")) { 
						support.setThumbnailOrigin(originName);
						support.setThumbnailChange(changeName);
					}
					else { 
						SupportImage img=new SupportImage();
						img.setImgChangeName(changeName);
						img.setImgOriginName(originName); 
						img.setImgNo(Integer.valueOf( (entry.getKey()).substring((entry.getKey()).length()-1)));
						imgList.add(img);
					}
				}
			}
			
		}
		
		
		donationService.insertBoard(support,imgList,list);
		
		return "redirect:/list.do";
	}
		private String saveFile(MultipartFile file, HttpServletRequest request) {
			String resources = request.getSession().getServletContext().getRealPath("resources");
			String savePath = resources+"/upload_files/donation/";

			String originName = file.getOriginalFilename();
			String ext = originName.substring(originName.lastIndexOf("."));
			String changeName =System.currentTimeMillis() + "_" + (int)( Math.random() * 10000000) + ext;
			try {
				file.transferTo(new File(savePath+changeName));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				throw new CommException("파일 업로드 실패");
			}
			return changeName;
		}
```

- 프로젝트 등록 시 기부사용계획서의 행을 추가/삭제하여 해당 객체를 여러 개 등록 할 수 있습니다.(따라서, 위의 controller에 기부사용계획서의 객체를 list로 받아주고 있습니다.)
```
<script type="text/javascript">
        $('#addRow').click(function () {
            const table = document.getElementById('useplan');
            const totalRowCnt = table.rows.length;
            const len = String(table.tBodies[0].rows.length + 1);
           	
            var html = `<tr>
            			<td name='tdUpNo' style='vertical-align:middle'>`+len+`<input class='useplanTd' type='hidden' name='upNo' value=`+len+`>
            			</td><td><input class='useplanTd' type='text' name='division' placeholder='구분' required></td>
                    	<td><input class='useplanTd' type='text' name='content' placeholder='상세내용' required></td>
                    	<td><input class='useplanTd' type='number' name='amount' min='1000' step='100' placeholder='사용금액' required></td>
                    	<td><button class='btnDelete'  name='btnDelete'>삭제</button></td>
                		</tr>`;
              
            $("#useplan tbody").append(html);
            
        });
	 	
	    
	    //삭제 버튼
	    $(document).on("click","button[name=btnDelete]",function(){
	        
	        var trHtml = $(this).parent().parent();
	        
	        trHtml.remove();
	        
	    });
	    
	    $("#submit").click(function(){
		$("#useplan tbody tr").each( function (index) {
	        $(this).find("input[name=upNo]").attr("name", "supportUsePlan[" + index + "].upNo");
	        $(this).find("input[name=division]").attr("name", "supportUsePlan[" + index + "].division");
	        $(this).find("input[name=content]").attr("name", "supportUsePlan[" + index + "].content");
	        $(this).find("input[name=amount]").attr("name", "supportUsePlan[" + index + "].amount");
	        console.log(index);
	    });
		$("#insertForm").submit();
	});
</script>
```

- 후원기간과 사업기간 입력 시, 마감일은 시작일보다 이전 날짜는 선택할 수 없도록 구현하였습니다.
```
    <script>
	    var start1 = document.getElementById('start');
	    var end1 = document.getElementById('end');
	
	    start1.addEventListener('change', function() {
	        if (start1.value)
	            end1.min = start1.value;
	    }, false);
	    end1.addEventLiseter('change', function() {
	        if (end1.value)
	            start1.max = end1.value;
	    }, false);

	    var start2 = document.getElementById('bstart');
	    var end2 = document.getElementById('bend');
	
	    start2.addEventListener('change', function() {
	        if (start2.value)
	            end2.min = start2.value;
	    }, false);
	    end2.addEventLiseter('change', function() {
	        if (end2.value)
	            start2.max = end2.value;
	    }, false);
   </script>
```

---

__5. 통계조회(구글차트 API 활용)__

구글차트API를 활용하여 받아온 데이터를 JSON형태로 변경하여 저장하고 차트옵션을 지정하여 마크업한 부분에 draw해주었습니다.
```
<!-- google chart -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawMultSeries1);
google.charts.setOnLoadCallback(drawMultSeries2);
google.charts.setOnLoadCallback(drawMultSeries3);
google.charts.setOnLoadCallback(drawMultSeries4);
 
function drawMultSeries1() {

	 var data = google.visualization.arrayToDataTable([
	 		["title", "누적금액","목표금액" ],
	    	
	 		<c:forEach items="${s}" var="list" varStatus="status"> 
		 		["${list.suTitle}",Number("${list.totalamount}"), Number("${list.goal}")],
		 		
		 		<c:if test="${status.end}">
		 			["${list.suTitle}",Number("${list.totalamount}"), Number("${list.goal}")]
		 		</c:if>
			</c:forEach>
	]);
	
	var view = new google.visualization.DataView(data);
	view.setColumns([0,1,2]);

	var options = {
	  title: "후원 프로젝트 별 누적금액 차트",
	  colors: ['GoldenRod','ForestGreen']
	};
	
	var chart = new google.visualization.BarChart(document.getElementById("column_chart_div1"));
	chart.draw(view, options);
}

 
function drawMultSeries2() {
    
	var data = google.visualization.arrayToDataTable([
		["title","달성률"],
		<c:forEach items="${s}" var="list" varStatus="status">  
 			["${list.suTitle}",Number("${list.totalamount/list.goal}")],
 			
 			<c:if test="${status.end}">
 				["${list.suTitle}",Number("${list.totalamount/list.goal}")]
 			</c:if>
		</c:forEach>
	]);
 
	var options = {
        title: '후원프로젝트 별 달성률 차트',
        hAxis: {
          title: '달성률',
          minValue: 0
        },
        vAxis: {
          title: '후원 프로젝트'
        },
        colors: ['ForestGreen']
      };
 
	var chart = new google.visualization.ColumnChart(document.getElementById('column_chart_div2'));
	chart.draw(data, options);
}	
```

---



소감
---

가장 기본적인 CRUD를 위주로 게시판을 만드는 것이지만 실제로 사이트가 쓰이게 된다면 어떨지 고민하면서 구현을 하다보니까 이것저것 신경 쓸 것이 더 많았던거 같습니다. 프로젝트를 하면서 학원에서 배운 것이 어떻게 쓰이게 될지, 취업을 한다면 어떤 식으로 개발을 하게 될지 고민할 점이 많아지는 프로젝트였습니다.
아쉬운 부분이 있다면, 프로젝트 정렬 시 셀렉트박스의 value를 submit한 후 내용이 초기화 되어 무사히 정렬은 적용되지만 어떻게 정렬한 것인지 알 수 없어 사용자가 헷갈릴 수 있다는 점입니다. 이는 해당 value를 submit처리하는 것이 아니라 onchange처리하고 목록의 내용을 ajax로 받아오면 해결할 수 있을 거 같아 다음에 꼭 적용해 보고 싶습니다. 그리고 부트스트랩 사용이 익숙하지 않아 공통 템플릿을 정해 놓고도 전체 UI를 통일하지 못한 점이 아쉬웠습니다.
팀원들과 모르는 문제를 소통하면서 함께 해결하고 무언가 다같이 만들어간다는 소속감이 정말 만족스러웠습니다. 다음에는 더욱 완성도 있는 프로젝트를 만들고 싶은 좋은 자극제가 되었습니다.
