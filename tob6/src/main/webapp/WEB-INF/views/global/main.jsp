<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
	
	
	<div class="preloader">
		<img src="${normal}/img2/loader.gif" alt="Preloader image">
	</div>
	
	
	<!-- ************************* 네비게이션 바 **************************** -->
	<nav class="navbar">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${context}/"><img src="${normal}/img2/logo.png" data-active-url="${normal}/img2/logo-active.png" alt=""></a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			
			
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right main-nav">
					<li><a href="#info">Info</a></li>
					<li><a href="#book_section">BOOK</a></li>
					<li><a href="#best_section">BEST-SELLER</a></li>
					<li><a href="#week_section">WEEK-BOOK</a></li>
					<li><a href="#event_section">EVENT</a></li>
			<c:if test="${empty sessionScope.user}">
			<!-- 로그인 안한 상태 -->
			<li><a href="${context}/admin/main">Admin</a></li>
			<li><a href="#" data-toggle="modal" data-target="#modal1" class="btn btn-blue">Sign In</a></li>
			<li style="float: right"><a href="${context}/member/joinForm" id="join">회원가입</a></li>
			</c:if>
			<c:if test="${not empty sessionScope.user}">
			<li style="float: right; padding-right: 10px;"><a href="#mypage_section" id="mypage">마이페이지</a></li>
			<li style="float: right;"><a class="page-scroll" href="#cart_section" id="my_cart">장바구니</a></li>
			<li style="float: right;"><a href="${context}/member/logout">Log out</a></li>
			</c:if>
					
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	
	
	<!-- ******************헤더 인트로********************* -->
	<header id="info">
		<div class="container">
			<div class="table">
				<div class="header-text">
					<div class="row">
						<div class="col-md-12 text-center">
							<h3 class="light white">Take care of your body.</h3>
							<h1 class="white typed">It's the only place you have to live.</h1>
							<span class="typed-cursor">|</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	
	
	
	<!-- *********************** 섹션(컨텐트) ************************** -->
	
	
	<section id="book_section" class="section section-padded">
		<div class="container">
			<div class="row text-center title">
				<label id="book_more"><img src="${img}/book.png" alt="" /></label>
			</div>
			<div class="row services">
				<div class="col-md-4">
					<div class="service">
						<div class="icon-holder">
							<img src="${normal}/img2/icons/heart-blue.png" alt="" class="icon">
						</div>
						<h4 class="heading">멈추면 보여요</h4>
						<p class="description">이세상 최고의 명품옷은 바로 자신감을 입는 것 입니다.
						- 멈추면, 비로소 보이는 것들 中
						 </p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="service">
						<div class="icon-holder">
							<img src="${normal}/img2/icons/guru-blue.png" alt="" class="icon">
						</div>
						<h4 class="heading">If I'm moon</h4>
						<p class="description">​내가 만약 달이 된다면
							지금 그 사람의 창가에도
							아마 몇 줄기는 내려지겠지<br>
							-김소월 '첫사랑'-
						</p>
					</div>
				</div>
				<div class="col-md-4">
					<div class="service">
						<div class="icon-holder">
							<img src="${normal}/img2/icons/weight-blue.png" alt="" class="icon">
						</div>
						<h4 class="heading">Power Training</h4>
						<p class="description">A elementum ligula lacus ac quam ultrices a scelerisque praesent vel suspendisse scelerisque a aenean hac montes.</p>
					</div>
				</div>
			</div>
		</div>
		<div class="cut cut-bottom"></div>
	</section>
	

	<section id="best_section" class="section gray-bg">
		<div class="container">
			<div class="row title text-center">
				<label id="best_more"><img src="${img}/bstseller.png" alt="" /></label>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="team text-center">
						<div class="cover" style="background:url('${normal}/img2/team/team-cover1.jpg'); background-size:cover;">
							<div class="overlay text-center">
								<h3 class="white">$69.00</h3>
								<h5 class="light light-white">1 - 5 sessions / month</h5>
							</div>
						</div>
						<img src="${normal}/img2/team/team3.jpg" alt="Team Image" class="avatar">
						<div class="title">
							<h4>Ben Adamson</h4>
							<h5 class="muted regular">Fitness Instructor</h5>
						</div>
						<button data-toggle="modal" data-target="#modal1" class="btn btn-blue-fill">Sign Up Now</button>
					</div>
				</div>
				<div class="col-md-4">
					<div class="team text-center">
						<div class="cover" style="background:url('${normal}/img2/team/team-cover2.jpg'); background-size:cover;">
							<div class="overlay text-center">
								<h3 class="white">$69.00</h3>
								<h5 class="light light-white">1 - 5 sessions / month</h5>
							</div>
						</div>
						<img src="${normal}/img2/team/team1.jpg" alt="Team Image" class="avatar">
						<div class="title">
							<h4>Eva Williams</h4>
							<h5 class="muted regular">Personal Trainer</h5>
						</div>
						<a href="#" data-toggle="modal" data-target="#modal1" class="btn btn-blue-fill ripple">Sign Up Now</a>
					</div>
				</div>
				<div class="col-md-4">
					<div class="team text-center">
						<div class="cover" style="background:url('${normal}/img2/team/team-cover3.jpg'); background-size:cover;">
							<div class="overlay text-center">
								<h3 class="white">$69.00</h3>
								<h5 class="light light-white">1 - 5 sessions / month</h5>
							</div>
						</div>
						<img src="${normal}/img2/team/team2.jpg" alt="Team Image" class="avatar">
						<div class="title">
							<h4>John Phillips</h4>
							<h5 class="muted regular">Personal Trainer</h5>
						</div>
						<a href="#" data-toggle="modal" data-target="#modal1" class="btn btn-blue-fill ripple">Sign Up Now</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	
	<section id="week_section" class="section">
		<div class="container">
			<div class="row title text-center">
				<label id="week_more"><img src="${img}/week.png" alt="" /></label>
			</div>
			<div class="row no-margin">
				<div class="col-md-7 no-padding col-md-offset-5 pricings text-center">
					<div class="pricing">
						<div class="box-main active">
						<label id="you"><img alt="참 좋은 당신을 만났습니다." src="${img}/weekday1.jpg" style="width: 141px; height: 203px;">
						</label>
						</div>
						<div class="box-second active">
							<label id="happy"><img src="${img}/weekday2.jpg"
						alt="나는 이제 좀 행복해져야겠다." style="width: 141px; height: 203px;"></label>
						</div>
					</div>
					<div class="pricing">
						<div class="box-main">
							<label id="story"><img src="${img}/recome1.jpg"
						alt="내 스물아홉 이야기" style="width: 141px; height: 203px;"></label>
							
						</div>
						<div class="box-second">
							<ul class="white-list text-left">
								<li>이 주의 책 추천은</li>
								<li>출판사가 추천하는 </li>
								<li>한 주간의 책입니다.</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	<section id="event_section" class="section section-padded blue-bg">
		<div class="container">
			<div class="row">
				<label id="event_more"><img src="${img}/event.png" alt="" /></label>
				<div class="col-md-8 col-md-offset-2">
					<div class="owl-twitter owl-carousel">
						<div class="item text-center">
							<i class="icon fa fa-twitter"></i><br />
							<label id="event_tag">
							<h1 class="white light">EVENT 댓글로직 확인</h1>
							</label>
						</div>
						<div class="item text-center">
							<i class="icon fa fa-twitter"></i><br />
							<img src="${img}/E003.jpg" alt="소프트 스킬 리뷰어 이벤트">
								<div class="caption">
									<h4 class="white light">소프트 스킬 리뷰어 이벤트</h4>
									<p class="white light">2016/01/01~2016/01/31</p>
									<label id="soft" class="btn btn-primary">더보기</label>
						</div>
						</div>
						<div class="item text-center">
							<i class="icon fa fa-twitter"></i><br />
							<h4 class="white light">계속해서 개발중이오니 불편하시더라도 기다려주세요. Thank you!</h4></h4>
							<h4 class="light-white light">Now Loading....</h4>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	<section id="event_submain"></section>
	<section id="mypage_section"></section>
	<section id="cart_section"></section>
	<section id="join_section"></section>
	<section id="pur_section"></section>

<section id="team_section">
	<div class="container" style="padding-top: 20px; padding-bottom: 20px;">
		<div class="row title text-center">
			<label> <img src="${img}/team.png" alt="" /></label>
			<div class="row" style="margin-top: 10px;">
				<div class="col-sm-4">
					<div class="team-member">
						<div class="team text-center">
							<div class="cover"
								style="background:url('${normal}/img2/team/team-cover1.jpg'); background-size:cover;">
								<div class="overlay text-center">
									<h3 class="white">Hwang YoungJu</h3>
									<h5 class="light light-white">Team Leader</h5>
								</div>
							</div>
							<img src="${normal}/img2/team/team3.jpg" alt="Team Image"
								class="avatar">
							<div class="title">
								<h4>Hwang YoungJu</h4>
								<h5 class="muted regular">Team Leader</h5>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="team-member">
						<div class="team text-center">
							<div class="cover"
								style="background:url('${normal}/img2/team/team-cover1.jpg'); background-size:cover;">
								<div class="overlay text-center">
									<h3 class="white">"Admin"</h3>
									<h5 class="light light-white">JAVA, Ajax, Spring et...</h5>
								</div>
							</div>
							<img src="${normal}/img2/team/team3.jpg" alt="Team Image"
								class="avatar">
							<div class="title">
								<h4>Kim Sumin</h4>
								<h5 class="muted regular">Admin</h5>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="team text-center">
						<div class="cover"
							style="background:url('${normal}/img2/team/team-cover3.jpg'); background-size:cover;">
							<div class="overlay text-center">
								<h3 class="white">BOOK and Android</h3>
								<h5 class="light light-white">JAVA,Android Studio,Spring et...</h5>
							</div>
						</div>
						<img src="${normal}/img2/team/team2.jpg" alt="Team Image"
							class="avatar">
						<div class="title">
							<h4>Seong YonWoo</h4>
							<h5 class="muted regular">BOOK AND ANDROID</h5>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="team text-center">
						<div class="cover" style="background:url('${normal}/img2/team/team-cover2.jpg'); background-size:cover;">
							<div class="overlay text-center">
								<h3 class="white">EVNET</h3>
								<h5 class="light light-white">JAVA, Ajax, Spring et...</h5>
							</div>
						</div>
						<img src="${normal}/img2/team/team1.jpg" alt="Team Image" class="avatar">
						<div class="title">
							<h4>Lee JeongMin</h4>
							<h5 class="muted regular">EVNET</h5>
						</div>
					</div>
				</div>
			<div class="col-md-4">
					<div class="team text-center">
						<div class="cover" style="background:url('${normal}/img2/team/team-cover2.jpg'); background-size:cover;">
							<div class="overlay text-center">
								<h3 class="white">Main UI</h3>
								<h5 class="light light-white">JAVA, Ajax, Spring et...</h5>
							</div>
						</div>
						<img src="${normal}/img2/team/team1.jpg" alt="Team Image" class="avatar">
						<div class="title">
							<h4>Lee HyeSuk</h4>
							<h5 class="muted regular">Main UI</h5>
						</div>
					</div>
				</div>
			<div class="col-sm-4">
					<div class="team-member">
						<div class="team text-center">
							<div class="cover"
								style="background:url('${normal}/img2/team/team-cover1.jpg'); background-size:cover;">
								<div class="overlay text-center">
									<h3 class="white">"MEMBER"</h3>
									<h5 class="light light-white">JAVA, Ajax, Spring et...</h5>
								</div>
							</div>
							<img src="${normal}/img2/team/team3.jpg" alt="Team Image"
								class="avatar">
							<div class="title">
								<h4>Hong HyeongDong</h4>
								<h5 class="muted regular">MEMBER</h5>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>
</section>






<div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content modal-popup">
				<a href="#" class="close-link"><i class="icon_close_alt2"></i></a>
				<h3 class="white">Sign In</h3>
				<form action="" class="popup-form">
					<input type="text" class="form-control form-white" placeholder="ID">
					<input type="text" class="form-control form-white" placeholder="Password">
					<div class="checkbox-holder text-left">
						<div class="checkbox">
							<input type="checkbox" value="None" id="squaredOne" name="check" />
							<label for="squaredOne"><span>I Agree to the <strong>Terms &amp; Conditions</strong></span></label>
						</div>
					</div>
					<button type="button" class="btn btn-submit"><a href="${context}/member/loginForm">Log In</a></button>
					<!-- <button type="submit" class="btn btn-submit">Submit</button> -->
				</form>
			</div>
		</div>
	</div>
	
	
	
	
	
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-sm-6 text-center-mobile">
					
					<h5 class="light regular light-white">Shape your body and improve your health.</h5>
					<a href="#" class="btn btn-blue ripple trial-button">Start Free Trial</a>
				</div>
				<div class="col-sm-6 text-center-mobile">
					<h3 class="white">Call please<span class="open-blink"></span></h3>
					<div class="row opening-hours">
						<div class="col-sm-6 text-center-mobile">
							<h5 class="light-white light">Mon - Fri</h5>
							<h3 class="regular white">9:00 - 21:00</h3>
						</div>
						<div class="col-sm-6 text-center-mobile">
							<h5 class="light-white light">Sat - Sun</h5>
							<h3 class="regular white">10:00 - 21:00</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row bottom-footer text-center-mobile">
				<div class="col-sm-8">
					<p>&copy; 2015 All Rights Reserved. Powered by <a href="http://www.phir.co/">PHIr</a> exclusively for <a href="http://tympanus.net/codrops/">Codrops</a></p>
				</div>
				<div class="col-sm-4 text-right text-center-mobile">
					<ul class="social-footer">
						<li><a href="http://www.facebook.com/pages/Codrops/159107397912"><i class="fa fa-facebook"></i></a></li>
						<li><a href="http://www.twitter.com/codrops"><i class="fa fa-twitter"></i></a></li>
						<li><a href="https://plus.google.com/101095823814290637419"><i class="fa fa-google-plus"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
	<!-- Holder for mobile navigation -->
	<div class="mobile-nav">
		<ul>
		</ul>
		<a href="#" class="close-link"><i class="arrow_up"></i></a>
	</div>
	
<script type="text/javascript">
	$(function() {
		$('#book_more').click(function() {
			alert('섹션의 유저아이디 : '+'${user.userid}');
			book.all('${user.userid}');
		});
		$('#event_more').click(function() {
			Event.event('${user.userid}');
		});
		$('#event_tag').click(function() {
			Event.eventPage();
		});
		$('#mypage').click(function() {
			Member.detail(context+'/member/detail/${user.userid}');
		});
		$('#my_cart').click(function() {
			Cart.list('${user.userid}');
		});
		$('#pur_list').click(function() {
			Purchase.list(context);
		});
		
	});
</script>


