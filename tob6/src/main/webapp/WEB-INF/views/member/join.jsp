<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<div class="회원가입">
	<div class="container" style="width: 30%; background-color: zoom: 500; filter: alpha(opacity = 1000); opacity: 0.6;">
		<div class="jumbotron">
			<h1><span class="label label-default" style="background-color: black;">&nbsp;&nbsp;&nbsp;회원가입&nbsp;&nbsp;&nbsp;</span></h1>
			<br />
			<form class="form-horizontal" role="form">
				<div class="form-group">
					<label class="control-label col-sm-3" for="email">아이디</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="userid" placeholder="아이디를 입력해주세요">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="pwd">비밀번호</label>
					<div class="col-sm-9">
						<input type="password" class="form-control" id="password" placeholder="비밀번호를 입력해주세요">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="text">이름</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="name" placeholder="이름을 입력해주세요">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="text">생년월일</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="birth" placeholder="생년월일을 입력해주세요">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="text">성별</label>
					<div class="col-sm-9">
						<label class="radio-inline"> <input type="radio" name="optradio" value="남" checked>남 </label> 
						<label class="radio-inline"> <input type="radio"name="optradio" value="여">여</label>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="text">이메일</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="email" placeholder="이메일을 입력해주세요">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="text">전화번호</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="phone" placeholder="전화번호를 입력해주세요">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3" for="text">주소</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="addr" placeholder="주소를 입력해주세요">
					</div>
				</div>
				<div class="container">
					<div class="col-sm-offset-3 col-sm-10">
						<div class="checkbox">
							<label><input type="checkbox" id="joinAgree">정보활용에 동의합니다.</label>
						</div>
					</div>
					<label class="control-label col-sm-offset-2 col-sm-9" for="text" style="white-space: nowrap;">
						<button type="button" class="joinConfirm" id="joinConfirm">
							<h6><strong>&nbsp;&nbsp;&nbsp;회원가입완료&nbsp;&nbsp;&nbsp;</strong></h6>
						</button>
						<button type="button" class="btn btn-default">
							<h6><strong>&nbsp;&nbsp;&nbsp;회원가입취소&nbsp;&nbsp;&nbsp;</strong></h6>
						</button>
					</label>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
	$(function() {
		$("#joinConfirm").click(function() {
			alert('가입버튼클릭');
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
			if ($("#name").val() == "") {
				alert("이름을 입력하세요.");
				$("name").focus();
				return false;
			}
			if ($("#birth").val() == "") {
				alert("생년월일을 입력하세요.");
				$("birth").focus();
				return false;
			}
			if ($("#email").val() == "") {
				alert("이메일을 입력하세요.");
				$("email").focus();
				return false;
			}
			if ($("#phone").val() == "") {
				alert("전화번호를 입력하세요.");
				$("phone").focus();
				return false;
			}
			if ($("#addr").val() == "") {
				alert("주소를 입력하세요.");
				$("addr").focus();
				return false;
			}
			if ($("#joinAgree").is(":checked") == false) {
				alert("정보이용에 동의해주세요.");
				return false;
			}
			joinus.join();
		});
	});
	var joinus = {
		join : function() {
			var member = {
				"userid" : $('#userid').val(),
				"password" : $('#password').val(),
				"name" : $('#name').val(),
				"birth" : $('#birth').val(),
				"gender" : $(':radio:checked').val(),
				"email" : $('#email').val(),
				"phone" : $('#phone').val(),
				"addr" : $('#addr').val(),
			};
			alert('join진입');
			$.ajax({
				url : "${context}/member/join",
				data : JSON.stringify(member),
				dataType : "json",
				type: 'post',
				contentType : "application/json",
				mimeType : "application/json",
				async : false,
				success : function(data) {
					if (data != null) {
						alert(data.name + "님 회원가입 가입되었습니다.");
						location.href = "${context}/";
					} else {
						alert("회원가입 중 오류가 발생했습니다.");
						return false;
					}
				},
				error : function(e) {
					alert("에러");
				}
			});
		}
	};
</script>
