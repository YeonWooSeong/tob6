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
				<a class="navbar-brand" href="${context}/"><img src="${img}/tob_after.png" data-active-url="${img}/tob.png" alt=""></a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			
			
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right main-nav">
					<li><a href="#book_section">BOOK</a></li>
					<!-- <li><a href="#week_section">WEEK-BOOK</a></li> -->
					<li><a href="#event_section">EVENT</a></li>
					<li><a href="#team_section">TEAM</a></li>
					<li><a href="${context}/admin/main">Admin</a></li>
			<c:if test="${empty sessionScope.user}">
			<!-- 로그인 안한 상태 -->
			<li><a href="#" data-toggle="modal" data-target="#modal1" class="btn btn-blue">Sign In</a></li>
			<li style="float: right"><a href="#" data-toggle="modal" data-target="#modal2">Sign Up</a></li>
			</c:if>
			<c:if test="${not empty sessionScope.user}">
			<li style="float: right; padding-right: 10px;"><a href="#" data-toggle="modal" data-target="#modal3" >마이페이지</a></li>
			<li style="float: right;"><a class="page-scroll" href="${context}/cart/Cart" id="my_cart">장바구니</a></li>
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
							<h3 class="light white">Welcome to homepage.</h3>
							<h1 class="white typed">You can easily buy the book.</h1>
							<span class="typed-cursor">|</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	
	
	
	<!-- *********************** 섹션(컨텐트) ************************** -->
	
	
	<section id="book_section" class="section section-padded" >
		<div class="container">
			<%-- <div class="row text-center title">
				<label id="book_more"><img src="${img}/book.png" alt="" /></label>
			</div> --%>
			<div class="row services">
				<div class="col-md-4" id="book_more">
					<div class="service">
						<div class="icon-holder">
							<img src="${img}/book_icon_2.png" alt="" class="icon">
						</div>
						<h2 class="heading">BOOK</h2>
					</div>
				</div>
				<div class="col-md-4" id="music_more">
					<div class="service">
						<div class="icon-holder">
							<img src="${img}/book_icon_2.png" alt="" class="icon">
						</div>
						<h2 class="heading">MUSIC</h2>
					</div>
				</div>
				<div class="col-md-4" id="old_more">
					<div class="service">
						<div class="icon-holder">
							<img src="${img}/book_icon.png" alt="" class="icon">
						</div>
						<h3 class="heading">Old Market</h3>
					</div>
				</div>
			</div>
		</div>
		<div id="submain"></div>
	</section>



	
	
	<section id="event" class="section section-padded blue-bg" style="padding-top: 5%;">
		<div class="container" id="event_section">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div class="owl-twitter owl-carousel">
						<div class="item text-center">
							<i class="icon fa fa-twitter"></i><br />
							<label id="event_more">
							<h1 class="white light">EVENT</h1>
							<p class="white light">검색하러 가기</p>
							</label>
						</div>
						<div class="item text-center">
							<i class="icon fa fa-twitter"></i><br />
							<img src="${img}/E003.jpg" alt="소프트 스킬 리뷰어 이벤트">
								<div class="caption">
									<h4 class="white light">소프트 스킬 리뷰어 이벤트</h4>
									<p class="white light">2016/01/01~2016/01/31</p>
									<label id="event_tag" class="btn btn-primary">더보기</label>
						</div>
						</div>
						</div>
				</div>
			</div>
		</div>
		<div id="event_submain" class="container" style="margin-bottom: 100px;"></div>
		<div id="event_Reply"></div>
	</section>
	
	
<section id="team_section" style="background: linear-gradient(to bottom, #00a8ff 0%,#29d2db 23%,#5dfcd4 55%,#ffffff 86%);">
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
									<h3 class="white">Cart & Purchase</h3>
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
									<h3 class="white">Admin</h3>
									<h5 class="light light-white">JAVA, Ajax, Spring etc...</h5>
								</div>
							</div>
							<img src="${normal}/img2/team/sumin.jpg" alt="Team Image"
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
								<h5 class="light light-white">JAVA,Android Studio,Spring etc...</h5>
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
								<h3 class="white">EVENT</h3>
								<h5 class="light light-white">JAVA, Ajax, Spring etc...</h5>
							</div>
						</div>
						<img src="${normal}/img2/team/team1.jpg" alt="Team Image" class="avatar">
						<div class="title">
							<h4>Lee JeongMin</h4>
							<h5 class="muted regular">EVENT</h5>
						</div>
					</div>
				</div>
			<div class="col-md-4">
					<div class="team text-center">
						<div class="cover" style="background:url('${normal}/img2/team/team-cover2.jpg'); background-size:cover;">
							<div class="overlay text-center">
								<h3 class="white">Main UI</h3>
								<h5 class="light light-white">JAVA, Ajax, Spring etc...</h5>
							</div>
						</div>
						<img src="${normal}/img2/team/hyesuk.jpg" alt="Team Image" class="avatar">
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
									<h5 class="light light-white">JAVA, Ajax, Spring etc...</h5>
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


<section></section>
<section id="cart_section" style="margin-top: 5%; margin-bottom: 10%;">	</section>
<section id="mypage" style="margin-top: 5%; margin-bottom: 10%;">	</section>


	<div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content modal-popup">
				<a href="#" class="close-link"><i class="icon_close_alt2"></i></a>
				<h3 class="white">Sign In</h3>
				<form class="popup-form" method="post">
					<input type="text" name="userid" id="userid" class="form-control form-white" placeholder="ID">
					<input type="password" name="password" id="password" class="form-control form-white" placeholder="Password">
					<div class="checkbox-holder text-left">
						<div class="checkbox">
							<input type="checkbox" value="None" id="squaredOne" name="check" />
							<label for="squaredOne"><span><strong>Remember Me</strong></span></label>
						</div>
					</div>
					<button type="button" class="btn btn-submit" id="btn_login">Log In</button>
					<!-- <button type="submit" class="btn btn-submit">Submit</button> -->
				</form>
			</div>
		</div>
	</div>
	
	
	<div class="modal fade" id="modal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content modal-popup">
				<a href="#" class="close-link"><i class="icon_close_alt2"></i></a>
				<h3 class="white">Sign Up</h3>
				<form class="popup-form" method="post">
					<input type="text" name="up_userid" id="up_userid" class="form-control form-white" placeholder="ID">
					<input type="password" name="up_password" id="up_password" class="form-control form-white" placeholder="Password">
					<input type="text" name="up_name" id="up_name" class="form-control form-white" placeholder="NAME">
					<input type="text" name="up_birth" id="up_birth" class="form-control form-white" placeholder="BIRTH">
					<div class="radiobox-holder text-left">
						<div>
							<label><input type="radio" value="None" value="Man" name="optradio" checked/> Man</label>
							<label><input type="radio" value="None" value="Woman" name="optradio" />Woman</label>
						</div>
					</div>
					<input type="text" name="up_email" id="up_email" class="form-control form-white" placeholder="EMAIL">
					<input type="text" name="up_phone" id="up_phone" class="form-control form-white" placeholder="PHONE">
					<input type="text" name="up_addr" id="up_addr" class="form-control form-white" placeholder="ADDRESS">
					<button type="button" class="btn btn-submit" id="btn_Sign_up">Sign up</button>
					<!-- <button type="submit" class="btn btn-submit">Submit</button> -->
				</form>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="modal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content modal-popup">
				<a href="#" class="close-link"><i class="icon_close_alt2"></i></a>
				<h3 class="white">정보 수정</h3>
				<form class="popup-form" method="post" id="form_mem_change" >
					<input type="text" name="ch_userid" id="ch_userid" class="form-control form-white" placeholder="${user.userid}" readonly/>
					<input type="password" name="ch_password" id="ch_password" class="form-control form-white" placeholder="${user.password}">
					<input type="text" name="ch_name" id="ch_name" class="form-control form-white" placeholder="${user.name}">
					<input type="text" name="ch_birth" id="ch_birth" class="form-control form-white" placeholder="${user.birth}">
					<div class="radiobox-holder text-left">
						<div>
							<label><input type="radio" value="None" value="Man" name="optradio" checked/> Man</label>
							<label><input type="radio" value="None" value="Woman" name="optradio" />Woman</label>
						</div>
					</div>
					<input type="text" name="ch_email" id="ch_email" class="form-control form-white" placeholder="${user.email}">
					<input type="text" name="ch_phone" id="ch_phone" class="form-control form-white" placeholder="${user.phone}">
					<input type="text" name="ch_addr" id="ch_addr" class="form-control form-white" placeholder="${user.addr}">
					<button type="button" class="btn btn-submit" id="btn_change">정보 수정하기</button>
					<!-- <button type="submit" class="btn btn-submit">Submit</button> -->
				</form>
			</div>
		</div>
	</div>
	
<script type="text/javascript">
	$(function() {
		$('#btn_login').click(function() {
			if ($("#userid").val() == "") {
				alert("아이디를 입력하세요.");
				$("#userid").focus();
				return false;
			}
			if ($("#password").val() == "") {
				alert("비밀번호를 입력하세요.");
				$("#password").focus();
				return false;
			}
			Member.login(context);
		});
		
		$('#btn_Sign_up').click(function() {
			if ($("#up_userid").val() == "") {
				alert("아이디를 입력하세요.");
				$("#up_userid").focus();
				return false;
			}
			if ($("#up_password").val() == "") {
				alert("비밀번호를 입력하세요.");
				$("#up_password").focus();
				return false;
			}
			if ($("#up_name").val() == "") {
				alert("이름을 입력하세요.");
				$("#up_name").focus();
				return false;
			}
			if ($("#up_birth").val() == "") {
				alert("생년월일을 입력하세요.");
				$("#up_birth").focus();
				return false;
			}
			if ($("#up_email").val() == "") {
				alert("이메일을 입력하세요.");
				$("#up_up_email").focus();
				return false;
			}
			if ($("#phone").val() == "") {
				alert("전화번호를 입력하세요.");
				$("#up_phone").focus();
				return false;
			}
			if ($("#up_addr").val() == "") {
				alert("주소를 입력하세요.");
				$("#up_addr").focus();
				return false;
			}
			Member.join(context);
		});
		
		$('#btn_change').click(function() {
			Member.change(context);
		});
		
		$('#book_more').click(function() {
			book.all('${user.userid}');
		});
		$('#music_more').click(function() {
			alert('준비중입니다.');
		});
		$('#old_more').click(function() {
			alert('준비중입니다.');
		});
		$('#event_more').click(function() {
			Event.event('${user.userid}');
		});
		
		$('#mypage').click(function() {
			Member.detail(context+'/member/detail/${user.userid}');
		});
		
		
	});
</script>
<%-- 
$('#my_cart').click(function() {
			/* Cart.main(context, '${user.userid}'); */
			Cart.list('${user.userid}');
		
		}); --%>