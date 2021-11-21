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

---

__3. 후원하기__

---

__4. 후원 프로젝트 작성/삭제__

---

__5. 통계조회(구글차트 API 활용)__
	
---



소감
---

