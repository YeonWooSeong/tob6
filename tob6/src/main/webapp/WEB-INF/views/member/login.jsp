<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<div class="로그인">
	<div class="container" style="width: 30%; background-color: zoom: 500; filter: alpha(opacity = 1000); opacity: 0.6;">
		<div class="jumbotron">
			<h1><span class="label label-default" style="background-color: black;">&nbsp;&nbsp;&nbsp;한빛문고&nbsp;&nbsp;&nbsp;</span></h1>
			<br />
			<form class="form-horizontal" role="form">
				<div class="form-group">
					<label class="control-label col-sm-4" for="text">아이디</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="userid" placeholder="아이디를 입력해주세요">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-4" for="pwd">비밀먼호</label>
					<div class="col-sm-8">
						<input type="password" class="form-control" id="password" placeholder="비밀번호를 입력해주세요">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-10">
						<div class="checkbox">
							<label><input type="checkbox" > 로그인 상태유지</label>
						</div>
					</div>
				</div>
				<div class="container">
					<label class="control-label col-sm-offset-6 col-sm-7" for="text">
						<button type="button" class="loginConfirm" id="loginConfirm">
							<h6><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로그인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></h6>
						</button>
					</label>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
	$(function() {
		$('#loginConfirm').click(function() {
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
			member.login();
		});
	});
	var member = {
		login : function() {
			$.ajax({
				url : '${context}/member/login',
				data : {
					userid : $('#userid').val(),
					password : $('#password').val()
				},
				type : 'get',
				datatype : 'json',
				success : function(data) {
					if (data.userid === $('#userid').val()) {
						alert('로그인 성공'+data.userid);
						location.href = "${context}/";
					} else {
						alert('비밀번호 틀림');
					}
				},
				error : function() {
					alert('에러');
				}
			});
		}
	};
</script>
