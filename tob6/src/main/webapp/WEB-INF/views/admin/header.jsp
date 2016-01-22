<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>



<jsp:useBean id="now" class="java.util.Date"/>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header" style="margin-left: 30px;" >
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
      data-target="#bs-example-navbar-collapse-1" aria-expanded="false" >
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="${context}/">
      	<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
      </a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="margin-left: 30px;">
      <ul class="nav navbar-nav">
        <li class="active" style="width: 100px;"><a href="${context}/admin/main" >관리자 홈<span class="sr-only">(current)</span></a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">회원관리 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#" id="main_memberReg">회원 및 관리자 등록</a></li>
            <li><a href="#" id="main_memberList">전체회원목록 및 수정&삭제</a></li>
          </ul>
        </li>	   
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">책 관리 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#" id="main_bookReg">책 등록</a></li>
            <li><a href="#" id="main_bookList">전체 책 목록</a></li>
            <li><a href="#" id="main_todayBook">이주의 책 선정</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">주문 관리 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#" id="cart_list">전체 주문 목록</a></li>
            <li><a href="#" id="calenderList">날짜별 주문 목록</a></li>
            <%-- <li><a href="${context}/admin/test" >테스트 페이지</a></li> --%>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">이벤트 관리 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">이벤트 등록</a></li>
            <li><a href="#">전체 이벤트 목록</a></li>
          </ul>
        </li>
      </ul>
      
      <form id="search_form" action="javascript:search_query();" method="post" class="navbar-form navbar-left">
      
      <select class="form-control" id=searchType style="margin-left: 100px;">
                <option value="all">전체 검색</option>
                <option value="title">제목 검색</option>
                <option value="keyword">주제어 검색</option>
                <option value="publisher">출판사 검색</option> 
            </select> 
              
            <div class="form-group" style="margin-left: 20px;">
            <input type="text" class="form-control" placeholder="책 검색" size="10" id="query" name="query"/></div>
            <button type="submit" id="main_search" class="btn btn-default">DAUM 검색</button>  
		</form>
     
    </div>
  </div>
</nav>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<script type="text/javascript">
/* =================== 검색 ====================== */	

 function search_query() {      
	var query = $("#query").val();
	var category = $("#category").val();
	var searchType = $("#searchType").val();
	var url = "http://apis.daum.net/search/book"
	url += "?output=json";
	url += "&searchType=" + searchType;
	url += "&apikey=53e2827500534f733c75dadaccfdbaa2"
	url += "&q=" + query;
	url += "&callback=?";
	
	$.getJSON(url,function(data) {
		result = "<div class='panel panel-default' style='width: 80%; margin: auto;'>"
			+"<div class='panel-heading'>"
			+"<div style='color: #7fb3b3; font-size: 30px; font-family: 굴림; margin-left: 500px; font-weight:bold' >"
			+"결과 목록</div></div>"
			+"<table class='table'>"
		result += "<tr>";
		result += "<th WIDTH=20%>제목</th><th WIDTH=10%>저자</th><th WIDTH=10%>카테고리</th><th WIDTH=10%>출판사</th>";
		result += "<th WIDTH=10%>출판일</th><th WIDTH=10%>판매가격</th><th WIDTH=10%>상세보기</th>";
		result += "</tr>";
		for (var i in data.channel.item)
		{
			result += "<tr>";
			result += "<td width=20%>"+data.channel.item[i].title+"</td>";
			result += "<td width=10%>"+data.channel.item[i].author+"</td>";
			result += "<td width=10%>"+data.channel.item[i].category+"</td>";
			result += "<td width=10%>"+data.channel.item[i].pub_nm+"</td>";
			result += "<td width=10%>"+data.channel.item[i].pub_date+"</td>";
			result += "<td width=10%>"+data.channel.item[i].sale_price+"</td>";
			result += "<td width=10%><a onclick='daumBook.link("+"\""+data.channel.item[i].link+"\""+")'>"+data.channel.item[i].link+"</a></td>";
			result += "</tr>";
		} 
		result += "</table>";
	}).error(function(XMLHttpRequest, textStatus, errorThrown)
	{          
		result = textStatus;
	}).complete(function(){
		$(".mainView").html(result);                                    
	});
} 

/* =========================================== */
 
	$(function() {

		
		$('#main_memberReg').click(function() {
			AdminMemberReg.init();
		});
		
		$('#main_memberList').click(function() {
			AdminMemberList.list('1'); 
		});
		
		$('#main_bookReg').click(function() {
			adminBook.init3(); 
		});
		
		$('#main_bookList').click(function() {
			AdminBookList.list('1'); 
		});
		
		$('#main_todayBook').click(function() {
			AdminBook.inputBookId(); 
		});
		
		$('#cart_list').click(function() {
			adminPurchase.purList(context); 
		});
		
		$('#calenderList').click(function() {
			AdminPurchase2.calender(); 
		});
	
	});

	/* ============== 다음 책 정보 사이트 이동 ================= */
	
	var daumBook = {
			link : function(url) {
				window.open(url);
			}	
	}
	
	
	/* ============== 관리자 및 회원 등록 ====================== */
	
	var AdminMemberReg = {
			init : function(url) {
				$.getJSON(url, function(data) {
					var reg = '<div class="container"><div class="row">'
					+'<div class="col-md-6 col-md-offset-3"><div class="panel panel-login">'
					+'<div class="panel-heading"><div class="row"><div class="col-xs-6">'
					+'<a href="#"class="active"id="login-form-link">관리자등록</a></div>'
					+'<div class="col-xs-6"><a href="#"id="register-form-link">회원 등록</a></div></div><hr></div>'
					+'<div class="panel-body"><div class="row">'
					+'<div class="col-lg-12">'
					+'<form id="login-form"role="form"style="display: block;">'
					+'<div class="form-group"><label></label>'
					+'<input type="text"class="form-control"placeholder="ID"id="admin_id"></div>'
					+'<div class="form-group"><label></label>'
					+'<input type="password"class="form-control"placeholder="password"id="admin_password"></div>'
					+'<div class="form-group"><label></label>'
					+'<input type="email"class="form-control"placeholder="Email"id="admin_email"></div>'
					+'<div class="form-group"style="width: 300px; float: left;"><label></label>'
					+'<input type="text"name="form-control"id="confirm_num"tabindex="2"class="form-control"placeholder="인증번호"></div>'
					+'<button type="button"id="btn_confirm" style="margin-top:5%; margin-left: 5%; font-size: 12px; width: 100px; border-radius: 10px; float: left;"class="btn btn-primary btn-block">인증번호 발송</button>'
					+'<div class="row"style="float: left; margin-top: 20px;">'
					+'<div class="col-xs-4 col-sm-3 col-md-3" style="width: 100%"><span class="button-checkbox">'
					+'<label><span class="hide">규정사항 동의</span><input type="checkbox" name="agree" value="agree" /><span class="protxt"> 이용약관에 동의합니다.</span></label>'
					+'<input type="checkbox"name="t_and_c"id="t_and_c"class="hidden"value="1"></span></div>'
					+'<div class="col-xs-8 col-sm-9 col-md-9"style="font-size: 14px; margin-top: 5px;">'
					+'<strong class="label label-primary">관리자 등록</strong> 을 하기전에<a href="#"data-toggle="modal"data-target="#t_and_c_m"> 규정사항</a>을 확인하십시오</div></div>'
					+'<div class="form-group"style="margin-top: 10px;"><div class="row">'
					+'<div class="col-sm-6 col-sm-offset-3"style="margin-top: 20px;">'
					+'<input type="button"name="register-submit"id="admin_join"tabindex="4"class="form-control btn btn-register"value="Register Now"></div></div></div></form>'
					+'<form id="register-form"style="display: none; ">'
					+'<div class="form-group">'
					+'<input type="text"name="userid"id="userid"tabindex="1"class="form-control"placeholder="사용자ID"value=""></div>'
					+'<div class="form-group"><input type="password"name="password"id="password"tabindex="2"class="form-control"placeholder="비밀번호"></div>'
					+'<div class="form-group"><input type="text"name="name"id="name"tabindex="1"class="form-control"placeholder="이름"value=""></div>'
					+'<div class="form-group"><input type="text"name="birth"id="birth"tabindex="1"class="form-control"placeholder="생일"value=""></div>'
					+'<div class="form-group"><input type="text"name="gender"id="gender"tabindex="1"class="form-control"placeholder="성별"value=""></div>'
					+'<div class="form-group"><input type="text"name="email"id="email"tabindex="1"class="form-control"placeholder="이메일"value=""></div>'
					+'<div class="form-group"><input type="text"name="phone"id="phone"tabindex="1"class="form-control"placeholder="Phone(  -없이 입력해주세요)"value=""></div>'
					+'<div class="form-group"><input type="text"name="addr"id="addr"tabindex="1"class="form-control"placeholder="주소"value=""></div>'
					+'<div class="form-group"style="margin-top: 0px;"><div class="row">'
					+'<div class="col-sm-6 col-sm-offset-3">'
					+'<input type="button"name="login-submit"id="member_join"tabindex="4"class="form-control btn btn-login"value="Register Now"></div></div></div></form></div></div></div></div></div></div></div>'
					+'<div class="modal fade"id="t_and_c_m"tabindex="-1"role="dialog"aria-labelledby="myModalLabel"aria-hidden="true">'
					+'<div class="modal-dialog modal-lg"><div class="modal-content"><div class="modal-header">'
					+'<button type="button"class="close"data-dismiss="modal"aria-hidden="true">×</button><h4 class="modal-title"id="myModalLabel">사내 규정사항</h4></div>'
					+'<div class="modal-body"><p>제 1 조 (목적)'
					+'<p>공정거래 자율준수프로그램 운영지침(이하 “지침”"이라고 함)은 공정거래 자율준수프로그램 운영규정 (이하 “규정”이라고 함)을 효율적으로 운영하기 위하여 규정에서 지침에 위임한 사항 및 자율준수관리자에게 위임된 사항을 세부적으로 정하여 시행함을 그 목적으로 한다.</p>'
					+'<p>제 2 조 (용어의 정의)</p>'
					+'<p>규정에서 정하는 용어 외에 이 지침에서 사용하는 용어의 정의는 다음 각 호와 같다.</p>'
					+'<p>1. 사전검증이라 함은 경쟁법 위반소지가 있는 행위를 사전에 조사, 검토하고, 관련부서장이 자율준수관리자와 협의하여 필요한 조치를 취함으로써 법위반 행위를 예방하는 것을 말한다.</p>'
					+'<p>2. 모니터링이라 함은 현장점검, 체크리스트, 보고서 등을 통해 법위반 행위와 공정거래 자율준수 프로그램의 운영의 적절성 등을 점검조사 하는 것을 말한다.</p>'
					+'<p>3. 제재조치라 함은 임직원의 구조적반복적으로 발생하는 경쟁법 위반 행위에 대하여 엄정히 징계 등 조치함으로써 임직원에게 공정거래 자율준수의식을 고취시키는 행위를 말한다.</p>'
					+'<p>4. 문서관리라 함은 업무 수행 중에 발생하는 문서의 보관, 보존, 폐기 등 전 과정을 관리하는 것을 말한다.</p></div><div class="modal-footer">'
					+'<button type="button"class="btn btn-primary"data-dismiss="modal">I Agree</button></div></div></div></div>';
				
					$('.mainView').html(reg);
					style.style();
					
					
					/* ============ 회원 & 관리자 화면 전환 ============ */
					$('#register-form-link').click(function(e) {
						$("#register-form").delay(100).fadeIn(100);
				 		$("#login-form").fadeOut(100);
						$('#login-form-link').removeClass('active');
						$(this).addClass('active');
						e.preventDefault();
					});
					
					$('#login-form-link').click(function(e) {
						$("#login-form").delay(100).fadeIn(100);
				 		$("#register-form").fadeOut(100);
						$('#register-form-link').removeClass('active');
						$(this).addClass('active');
						e.preventDefault();
					});
					
					/* ========================================== */
					
					
					$("#btn_confirm").click(function(){
						AdminReg.join_Auth();
						$("#btn_confirm").remove();
					});

					
					$("#admin_join").click(function(){
 
						var admin_id = $("#admin_id").val();
						var admin_password = $("#admin_password").val();
						var admin_email = $("#admin_email").val();
						var agree = $("input:checkbox:checked").val();
						if (admin_id === "") {
							alert('공란을 채워주세요.');
						} 
						else if(admin_password === "") {
							alert('공란을 채워주세요.');
						} 
						else if(admin_email === "") {
							alert('공란을 채워주세요.');
						}
						else if(agree != "agree") {
							alert('이용약관에 동의해주십시오');
						}
						else {
							AdminReg.join();
						}
						
					});
					
					$("#member_join").click(function(){
						var userid = $("#userid").val();
						var password = $("#password").val();
						var name = $("#name").val();
						var birth = $("#birth").val();
						var gender = $("#gender").val();
						var email = $("#email").val();
						var phone = $("#phone").val();
						var addr = $("#addr").val();

						if (userid === "") {
							alert('공란을 채워주세요.');
						} 
						else if(password === "") {
							alert('공란을 채워주세요.');
						} 
						else if(name === "") {
							alert('공란을 채워주세요.');
						} 
						else if(birth === "") {
							alert('공란을 채워주세요.');
						} 
						else if(gender === "") {
							alert('공란을 채워주세요.');
						} 
						else if(email === "") {
							alert('공란을 채워주세요.');
						}
						else if(phone === "") {
							alert('공란을 채워주세요.');
						} 
						else if(addr === "") {
							alert('공란을 채워주세요.');
						} else {
							MemberReg.join2();	
						}
						
					});
			
					/* =============== 이용약관 부분 ================= */
					
					$('.button-checkbox').each(function(){

				        // Settings
				        var $widget = $(this),
				            $button = $widget.find('button'),
				            $checkbox = $widget.find('input:checkbox'),
				            color = $button.data('color'),
				            settings = {
				                on: {
				                    icon: 'glyphicon glyphicon-check'
				                },
				                off: {
				                    icon: 'glyphicon glyphicon-unchecked'
				                }
				            };
			
				        // Event Handlers
				        $button.on('click', function () {
				            $checkbox.prop('checked', !$checkbox.is(':checked'));
				            $checkbox.triggerHandler('change');
				            updateDisplay();
				        });
				        
				        $checkbox.on('change', function () {
				            updateDisplay();
				        });

				        
				        
				        // Actions
				        function updateDisplay(){
				            var isChecked = $checkbox.is(':checked');

				            // Set the button's state
				            $button.data('state', (isChecked) ? "on" : "off");

				            // Set the button's icon
				            $button.find('.state-icon')
				                .removeClass()
				                .addClass('state-icon ' + settings[$button.data('state')].icon);

				            // Update the button's color
				            if (isChecked) {
				                $button
				                    .removeClass('btn-default')
				                    .addClass('btn-' + color + ' active');
				            }
				            else {
				                $button
				                    .removeClass('btn-' + color + ' active')
				                    .addClass('btn-default');
				            }
				        }
				        //Action end

				        // Initialization
				        function init() {

				            updateDisplay();

				            // Inject the icon if applicable
				            if ($button.find('.state-icon').length == 0) {
				                $button.prepend('<i class="state-icon ' + settings[$button.data('state')].icon + '"></i>');
				            }
				        }
				        /*  init end line */
				    });
					/* 이용약관부분 */
	
				});
			}			
		};
 
/* =================  AdminMemberReg End Line  =================  */

 	var style = {
 			style : function() {
				$('.panel-login').css('border-color','#ccc').css('-webkit-box-shadow','0px 2px 3px 0px rgba(0,0,0,0.2)')
				.css('-moz-box-shadow','0px 2px 3px 0px rgba(0,0,0,0.2)').css('box-shadow','0px 2px 3px 0px rgba(0,0,0,0.2)');
				$('.panel-login>.panel-heading').css('color','#00415d').css('background-color','#fff')
				.css('border-color','#fff').css('text-align','center');
			    $('.panel-login>.panel-heading a').css('text-decoration','none').css('color','#666')
				.css('font-weight','bold').css('font-size','15px').css('-webkit-transition','all 0.1s linear')
				.css('-moz-transition','all 0.1s linear').css('transition','all 0.1s linear');
				$('.panel-login>.panel-heading a.active').css('color','#029f5b').css('font-size','18px');
				$('.panel-login>.panel-heading hr').css('margin-top','10px').css('margin-bottom','0px')
				.css('clear','both').css('border','0').css('height','1px').css('background-image','-webkit-linear-gradient(left,rgba(0, 0, 0, 0),rgba(0, 0, 0, 0.15),rgba(0, 0, 0, 0))')
				.css('background-image','-moz-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0))')
				.css('background-image','-ms-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0))')
				.css('background-image','-o-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));');
				$('.panel-login input[type="text"],.panel-login input[type="email"],.panel-login input[type="password"] ')
				.css('height','45px').css('border','1px solid #ddd').css('font-size','16px')
				.css('-webkit-transition','all 0.1s linear').css('-moz-transition','all 0.1s linear')
				.css('transition','all 0.1s linear');
				$('.panel-login input:hover').add('.panel-login input:focus').css('outline','none')
				.css('-webkit-box-shadow','none').css('-moz-box-shadow','none').css('box-shadow','none')
				.css('border-color','#ccc');
				$('.btn-login').css('background-color','#59B2E0').css('outline','none')
				.css('color','#fff').css('font-size','14px').css('height','auto').css('font-weight','normal')
				.css('padding','14px 0').css('border-color','#59B2E6');
				$('.btn-login:hover').add('.btn-login:focus').css('color','#fff').css('background-color','#53A3CD')
				.css('border-color','#53A3CD');
				$('.forgot-password').css('text-decoration','underline').css('color','#888');
				$('.forgot-password:hover').add('.forgot-password:focus').css('text-decoration','underline').css('color','#666');
				$('.btn-register').css('background-color','#1CB94E').css('outline','none')
				.css('color','#fff').css('font-size','14px').css('height','auto').css('font-weight','normal')
				.css('padding','14px 0').css('text-transform','uppercase').css('border-color','#1CB94A');
				$('.btn-register:hover').add('.btn-register:focus').css('color','#fff').css('background-color','#1CA347')
				.css('border-color','#1CA347'); 
				
		}
 	};	
	
	var AdminReg = {
			join_Auth : function() {
				$.ajax(context + "/admin/join_auth",{	
					data : {"id" : $("#admin_id").val(),
							"adminEmail" :$("#admin_email").val()
					},
					type : "post",
					success : function(data) {
						//이메일이 발송.
						if(data.success == "success"){
							alert("인증번호가 이메일로 발송되었습니다.");
						} else{
						//이미 가입되어 있는 아이디일 경우(컨트롤러에서 체크)
							alert("이미 가입되어 있는 아이디 입니다.");
						}
					},
					error : function() {
					}
				});
			},
			
			join : function() {
				var join_Admin = {
					"id" :$("#admin_id").val(),
					"adminEmail" :$("#admin_email").val(),
					"password" :$("#admin_password").val(),
					"confirm_num" :$("#confirm_num").val()

				};
				$.ajax(context + "/admin/admin_join",{
					
					data : JSON.stringify(join_Admin),
					dataType : "json",
					type : 'post',
					contentType : "application/json;",
					mimeType: "application/json;",
					async : false,
					success : function(data) {
						if(data.result == "success"){
							alert(data.id+"님 관리자로 등록되었습니다.");
							AdminMemberReg.init();
							
						}
						if(data.result == "fail"){
							alert("관리자 등록을 실패하였습니다. 다시 시도해주세요.");
							AdminMemberReg.init();
						}
						if(data.result == "not_Agreement"){
							alert("인증번호가 일치하지 않습니다. 인증을 다시 해주세요.");
							AdminMemberReg.init();
						}
					},
					
					error : function(xhr, status, msg) {
						alert('에러발생상태 : '+status +', 내용 :'+msg);
						AdminMemberReg.init();
					}
				});
			}
	};
	
var MemberReg = {
		join2 : function() {
			var join_member = {
				"userid" :$("#userid").val(),
				"password" :$("#password").val(),
				"name" :$("#name").val(),
				"birth" :$("#birth").val(),
				"gender" :$("#gender").val(),
				"email" :$("#email").val(),
				"phone" :$("#phone").val(),
				"addr" :$("#addr").val()

			};
			$.ajax(context + "/admin/join_member",{
				
				data : JSON.stringify(join_member),
				dataType : "json",
				type : 'post',
				contentType : "application/json;",
				mimeType: "application/json;",
				async : false,
				success : function(data) {
					
					if(data.result == "success"){
						alert(data.name+" 님 회원가입 성공");
						AdminMemberReg.init();
						
					}
					if(data.result == "fail"){
						alert("실패");
						AdminMemberReg.init();
					}
				},
				
				error : function(xhr, status, msg) {
					alert('에러발생상태 : '+status +', 내용 :'+msg);
					AdminMemberReg.init();
				}
	
			});

		}
	}; 
	
/* ============================================================ */

 
	$("#reg_member_btn").click(function() {
		if($("#userid").val() == "") {
			alert("사용자 아이디를 입력하세요.");
			$("#userid").focus();
			return false;
		}
		if($("#password").val() == "") {
			alert("비밀번호를 입력하세요.");
			$("#password").focus();
			return false;
		}
		if($("#name").val() == "") {
			alert("사용자 이름을 입력하세요.");
			$("#name").focus();
			return false;
		}
		if($("#gender").val() == "") {
			alert("성별을 입력하세요.");
			$("gender").focus();
			return false;
		}
		if($("#email").val() == "") {
			alert("이메일을 입력하세요.");
			$("email").focus();
			return false;
		}
		if($("#phone").val() == "") {
			alert("핸드폰 번호를 입력하세요.");
			$("phone").focus();
			return false;
		}
		if($("#addr").val() == "") {
			alert("주소를 입력하세요.");
			$("addr").focus();
			return false;
		}
		
		$.ajax({
			type:"post",
			data:$("#regMemberForm").serialize(),
			dataType:"json",
			url:"${context}/admin/member_reg",
			success: function(data) {
				if(data.result == "success") { 
					alert(data.name+"님 회원가입이 완료 되었습니다.");
					AdminMemberReg.init();
					
				} else if(data.result == "chk") { 
					alert("이미 가입된 ID 입니다.");
					return false;
				} else { 
					alert("회원가입 중 오류가 발생했습니다.");
					return false;
				}
			},
			error: function(e) {
				alert(e);
				AdminMemberReg.init();
			}
		});
		
	});	
	
	
	$("#dup_member_btn").click(function() {
		if($("#userid").val() == "") {
			alert("아이디를 입력하세요.");
			$("#userid").focus();
			return false;
		}	
		
		$.ajax({
			type:"post",
			data:{userid:$("#userid").val()},
			dataType:"json",
			url:"${context}/admin/member_reg_chk",
			success: function(data) {
				if(data.result == "fail") { 
					alert("이미 가입된 아이디입니다.");
					return false;
				} else {
					alert("회원가입 가능한 ID입니다.");
					$("#name").focus();
				}
			},
			error: function(e) {
				alert(e);
			}
		});
		
		
	});
	
	/* ============== 회원 리스트 및 수정 & 삭제부분 ============== */
	
	var AdminMemberList = {
		 list : function(pageNo) {
			 
				$.getJSON(context+'/admin/member_list/'+pageNo ,function(data) {
					var count = data.count;
					var pageNo = data.pageNo; 
					var startPage = data.startPage;
					var groupSize = data.groupSize;
					var lastPage = data.lastPage;
					var totalPage = data.totalPage;
					
					var table = "<div class='panel panel-default' style='width: 80%; margin: auto;'>"
					+"<div class='panel-heading'>"
					+"<div style='color: #7fb3b3; font-size: 30px; font-family: 굴림; margin-left: 500px; font-weight:bold' >"
					+"전체 회원 목록</div></div>"
					+"<table class='table'>"
					+"<TR ALIGN=CENTER><TD WIDTH=7%><B>번호</B></TD>"
					+"<TD WIDTH=15%><B>아이디</B></TD>"
					+"<TD WIDTH=15%><B>회원명</B></TD>"
					+"<TD WIDTH=20%><B>전화번호</B></TD>"
					+"<TD WIDTH=20%><B>주소</B></TD>"
					+"<TD WIDTH=20%><B>비고</B></TD></TR>";
					
					$.each(data.list, function(index, value) {
				 table +='<TR><TD WIDTH=7% ALIGN=CENTER>'+(index+1)+'</TD>'
						+'<TD WIDTH=15% ALIGN=CENTER>'+this.userid+'</a></TD>'
						+'<TD WIDTH=15% ALIGN=CENTER>'+this.name+'</A></TD>'
						+'<TD WIDTH=20% ALIGN=CENTER>'+this.phone+'</TD>'
						+'<TD WIDTH=20% ALIGN=CENTER>'+this.addr+'</TD>'
						+'<TD WIDTH=20% ALIGN=CENTER>'
						+'<A style="margin-right: 5px" id="'+this.userid+'" onclick="AdminMember.detail('+'\''+this.userid+'\''+')">수정</A>'
						+'<A style="margin-left: 5px" onclick="AdminMember.remove('+'\''+this.userid+'\''+')">삭제</A></TD></TR>';
												
					});
					
					table += '</TABLE></div>';
					
					 $('.mainView').html(table);
					
					var pagination ='<TABLE id="pagination">'
					+'<TR>'
					+'</TD>'
					+'<TD WIDTH=320 ALIGN=CENTER>';

					if (startPage != 1) {
						pagination += 
						'<a href="#" onclick="AdminMemberList.list(1)">'
						+'<IMG style="margin-right: 5px;" SRC="${img}/admin/btn_bf_block.gif">&nbsp;'
						+'</a>'
						+'<a href="#" onclick="AdminMemberList.list('+(startPage-groupSize)+')">'
						+'<IMG style="margin-right: 5px;"SRC="${img}/admin/btn_bf_page.gif">&nbsp;'
						+'</a>'
					}
					
					for (var i = startPage; i <= lastPage; i++) {
						if (i == pageNo ) {
							pagination +=
								'<font style="color:red;font-size: 30px">'+i+'</font>';
						} else {
							pagination +=
								'<a href="#" onclick="AdminMemberList.list('+i+')">'
								+'<font style="font-size: 20px; margin-right: 5px;">'+i+'</font>'
								+'</a>';
						}
					}
					
					if (lastPage != totalPage) {
						pagination +=
						    '<a href="#" onclick="AdminMemberList.list('+(startPage + groupSize)+')">'
		    	            +'<IMG style="margin-left: 5px;" SRC=" ${img}/admin/btn_nxt_page.gif"> &nbsp;'
		           			+'</a>'
		           			+'<a href="#" onclick="AdminMemberList.list('+(totalPage - ((totalPage-1) % groupSize))+')">'
		                	+'<IMG style="margin-left: 5px;" SRC=" ${img}/admin/btn_nxt_block.gif"> &nbsp;'
		           			+'</a>';
					}
					pagination +='</TD></TR></TABLE>';
					
					table += pagination;
					$('.mainView').html(table);
										
					AdminMemberList.style();
					
				});
		},
		
		style : function(){

			$('#pagination').css('width','70%').css('height','50px')
			.css('margin','auto')
			.css('CELLSPACING','0').css('CELLPADDING','1px').css('ALIGN','CENTER');

		}, 
	
		 
	memberNotExist : function() {
		var table ='<h1>회원목록</h1><table id="tab_member"><tr><th>아이디</th>';
			table += '<th>이름</th><th>성별</th><th>생년원일</th><th>전화번호</th><th>이메일</th></tr>';
			table += '<tr><td colspan="6"><h2>회원목록이 없습니다.</h2></td></tr></table>';
			$('.mainView').html(table);
	}
 };
 
var AdminMember = {
		detail : function(userid) {

			$.getJSON(context+'/admin/member_profile/'+userid ,
					function(data) {
				$('<form action="${context}/admin/member_update" id="memberFrm" method="post" >')
				.appendTo($('.mainView').empty());
			var table = '<div class="panel panel-default" style="width: 25%; margin: auto;">'
				+'<div class="panel-heading" style="width: 100%;">'
				+'<div style="color: #7fb3b3; font-size: 20px; font-family: 굴림; font-weight:bold; margin-left: 120px;" >'
				+'개인 정보 수정</div></div>'
				+'<table class="table" style="width: 100%;">'
				+'<tr><th>아이디</th><td id="data_id">'+data.userid+'</td></tr>'
				+'<tr><th>비밀번호</th><td id="data_password">'+data.password+'</td></tr>'
				+'<tr><th>이름</th><td id="data_name">'+data.name+'</td></tr>'
				+'<tr><th>생년</th><td id="data_birth">'+data.birth+'</td></tr>'
				+'<tr><th>전화번호</th><td id="data_phone">'+data.phone+'</td></tr>'
				+'<tr><th>이메일</th><td><input type="text" id="email" name="email" value="'+data.email+'"></td></tr>'
				+'<tr><th>성별</th><td id="data_gender">'+data.gender+'</td></tr>'
				+'<tr><th>주소</th><td id="data_addr">'+data.addr+'</td></tr>'
				+'<td colspan="2"><button id="confirm" style="width:100px; margin-left: 150px;">정보수정</button></td></tr>'
				+'</table>';
				
			$('#memberFrm').html(table);
			
			$('#confirm').click(function() {
				
				$('#memberFrm').submit(function(e) {
					e.preventDefault(); 
					/* 기본 폼태그의 서브밋을 막아라. 자스의 서브밋을 실행해라 */
					var postData = new FormData($('#memberFrm')[0]);
					$.ajax('${context}/admin/member_update',{
						type : 'post',
						data : postData,
						async : true, // 비동기로 할 지 여부, 기본값  true, 생략가능
						dataType : 'json',
						mimeType : 'multipart/form-data',
						contentType : false,
						processData : false,
						success : function(data) {
							
							var table = '<div class="panel panel-default" style="width: 25%; margin: auto;">'
								+'<div class="panel-heading" style="width: 100%;">'
								+'<div style="color: #7fb3b3; font-size: 20px; font-family: 굴림; font-weight:bold; margin-left: 120px;" >'
								+'수정 결과</div></div>'
								+'<table class="table" style="width: 100%;">'
								+'<tr><th>아이디</th><td id="data_id">'+data.userid+'</td></tr>'
								+'<tr><th>비밀번호</th><td id="data_password">'+data.password+'</td></tr>'
								+'<tr><th>이름</th><td id="data_name">'+data.name+'</td></tr>'
								+'<tr><th>생년</th><td id="data_birth">'+data.birth+'</td></tr>'
								+'<tr><th>전화번호</th><td id="data_phone">'+data.phone+'</td></tr>'
								+'<tr><th>이메일</th><td id="data_email">'+data.email+'</td></tr>'
								+'<tr><th>성별</th><td id="data_gender">'+data.gender+'</td></tr>'
								+'<tr><th>주소</th><td id="data_addr">'+data.addr+'</td></tr>'
								+'<td colspan="2"><button id="confrm" style="width:100px; margin-left: 150px;">확인</button></td></tr>'
								+'</table>';
					
							$('.mainView').html(table);
							$('#confrm').click(function() {
								AdminMemberList.list('1');
							});
							
						},
						error : function(xhr, status, msg) {
							alert('에러발생상태 : '+status +', 내용 :'+msg);
							// error 는 파라미터 갯수와 위치로 그 역할을 결정하기 때문에
							// xhr 은 자리를 지키고 있어야, status 와 msg 가 작동한다.
						}
					});
				});
			});
			});
		},
		
		remove : function(userid) {
			$.ajax('${context}/admin/member_delete/'+userid,{
				data : {
					userid : userid
				},
				dataType : 'json',
				success : function(data) {
					alert('회원을 삭제하였습니다.');
					AdminMemberList.list('1');
				},
				error : function(xhr, status, msg) {
					alert('에러발생상태 : '+status +', 내용 :'+msg);
				}
			});
		}
};


	/* ================== 책 등록 ====================== */
	
var adminBook ={
	init3 : function(url) {
		$.getJSON(context+'/admin/book_reg',
		function(data) {
	var table ='<div class="container"><div class="row">'
	+'<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">'
	+'<h2 style="margin-left: 220px;">책 등록</h2><hr class="colorgraph">'
	+'<div class="row"><div class="col-xs-12 col-sm-6 col-md-6"><div class="form-group">'
	+'<input type="text" name="bookId" id="bookId" class="form-control input-lg" placeholder="책 아이디" tabindex="1" style="width: 450px;">'
	+'</div></div>'
	+'<div class="row"><div class="col-xs-12 col-md-6">'
	+'<a href="#" id="duplication" class="btn btn-success btn-block btn-lg" style="width: 100px; float: right; margin-right: 15px;">중복확인</a>'
	+'</div></div></div>'
	+'<div class="form-group">'
	+'<input type="text" name="bookName" id="bookName" class="form-control input-lg" placeholder="책 이름" tabindex="3"></div>'
	+'<div class="form-group">'
	+'<input type="text" name="bookPrice" id="bookPrice" class="form-control input-lg" placeholder="가격" tabindex="4"></div>'
	+'<div class="form-group">'
	+'<input type="text" name="writer" id="writer" class="form-control input-lg" placeholder="작가" tabindex="5"></div>'
	+'<div class="form-group">'
	+'<input type="text" name="grade" id="grade" class="form-control input-lg" placeholder="평점" tabindex="6"></div>'
	+'<div class="form-group" >'
	+'<input type="text" name="stockSeq" id="stockSeq" class="form-control input-lg" placeholder="재고량" tabindex="7"></div>'
	+'<div class="row" style="width: 50%; height: 20%; font-size: 20px; margin-left: 1%; float:left;">'
	+'<p style="float: left; font-size: 20px; color:grey;">옵션</p>'
	+'<div class="btn-group" data-toggle="buttons" style="margin-right:10%; float: right">'
	+'<label class="btn btn-default">'
	+'<input  name="option" value="free" checked="checked" type="radio">free</label>'
	+'<label class="btn btn-default">'
	+'<input  name="option" value="var" type="radio">var </label>'
	+'<label class="btn btn-default">'
	+'<input  name="option" value="foo" type="radio">foo</label>'
	+'<label class="btn btn-default">'
	+'<input  name="option" value="md" type="radio">md'
	+'</label>'
	+'</div></div>'
	+'<select class="form-control" name="genre" id="genre" style="width: 50%; float: right">'
	+'<option name="genre" value="">장르</option>'
	+'<option name="genre" value="fiction">소설</option>'
	+'<option name="genre" value="cartoon">만화</option>'
	+'<option name="genre" value="essay">에세이</option>'
	+'<option name="genre" value="it">IT</option>'
	+'<option name="genre" value="classic">고전</option>'
	+'<option name="genre" value="poem">시</option></select>'
	+'<div class="row"><div class="col-xs-4 col-sm-3 col-md-3"><span class="button-checkbox">'
	+'<input type="checkbox" name="t_and_c" id="t_and_c" class="hidden" value="1"></span></div>'
	+'<div class="col-xs-8 col-sm-9 col-md-9">'
	+'</div></div><hr class="colorgraph">'
	+'<div class="row"><div class="col-xs-12 col-md-6">'
	+'<input type="button" id="reg_book_btn" value="책 등록" class="btn btn-primary btn-block btn-lg" tabindex="2" style="margin-left: 180px; width: 200px;">'
	+'</div></div></div></div>'
	+'<div class="modal fade" id="t_and_c_m" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'
	+'<div class="modal-dialog modal-lg"><div class="modal-content"><div class="modal-header">'
	+'<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>'
	+'<h4 class="modal-title" id="myModalLabel">규정사항</h4></div><div class="modal-body"><p>규정사항 솰라솰라솰라</p></div>'
	+'<div class="modal-footer"><button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>'
	+'</div></div></div></div></div>'
	
	$('.mainView').html(table);
	
	adminBook.style();
	
	$('#duplication').click(function() {
		var dupleId = $('#bookId').val();
		bookReg.duplication(dupleId);
		
	});
	
	$("#reg_book_btn").click(function(){
		var bookId = $("#bookId").val();
		var bookName = $("#bookName").val();
		var bookPrice = $("#bookPrice").val();
		var writer = $("#writer").val();
		var grade = $("#grade").val();
		var bookseq = $("#bookseq").val();
		var optionBook = $("input:radio[name=option]:checked").val();
		var genreId = $("select[name=genre] option:selected").val();
		
		if (bookId === "") {
			alert('공란을 채워주세요.');
		} 
		else if(bookName === "") {
			alert('공란을 채워주세요.');
		} 
		else if(bookPrice === "") {
			alert('공란을 채워주세요.');
		} 
		else if(writer === "") {
			alert('공란을 채워주세요.');
		} 
		else if(grade === "") {
			alert('공란을 채워주세요.');
		}
		else if(stockSeq === "") {
			alert('공란을 채워주세요.');
		} 
		else if(optionBook === "") {
			alert('공란을 채워주세요.');
		} 
		else if(genreId === "") {
			alert('공란을 채워주세요.');
		} else {
			bookReg.bookJoin();	
		}
		
	});
	
	var bookReg = {
			 duplication: function(dupleId) {
				 $.ajax(context + "/admin/duplication/" +dupleId,{
						data : {
							"dupleId" : dupleId
						},
						dataType : "json",
						async : false,
						success : function(data) {
							if(data.result == "success"){
								alert("등록 가능한 ID 입니다.");
							}
							if(data.result == "fail"){
								alert("중복되었습니다. 다시 시도해주세요.");
							}
						},
						error : function(xhr, status, msg) {
						}
				 });
			 },

			bookJoin : function() {
				var join_book = {
					"bookId" :$("#bookId").val(),
					"bookName" :$("#bookName").val(),
					"bookPrice" :$("#bookPrice").val(),
					"writer" :$("#writer").val(),
					"grade" :$("#grade").val(),
					"stockSeq" :$("#stockSeq").val(),
					"optionBook" :$("input:radio[name=option]:checked").val(),
					"genreId" :$("select[name=genre] option:selected").val()
				};
				
				$.ajax(context + "/admin/book_join",{
					data : JSON.stringify(join_book),
					dataType : "json",
					type : 'post',
					contentType : "application/json;",
					mimeType: "application/json;",
					async : false,
					success : function(data) {
						if(data.result == "success"){
							alert(data.bookName+" 책 등록 완료되었습니다.");
							adminBook.init3();
						}
						if(data.result == "fail"){
							alert("책 등록 실패하였습니다. 다시 시도해주세요.");
						}
					},
					error : function(xhr, status, msg) {
					}
					
				});
				
				
			}
	};	
	});
	},
	style : function() {
		$('.colorgraph').css('height','5px').css('border-top','0')
		.css('background','#c4e17f').css('border-radius','5px')
		.css('background-image','-webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4)')
		.css('background-image','-moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4)')
		.css('background-image','-o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4)')
		.css('background-image','linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4)')	
	}
		
};
	
	/* ============== 책 리스트 수정 및 삭제 ============= */
	
	var AdminBookList = {
		 list : function(pageNo) {
			 
				$.getJSON(context+'/admin/book_list/'+pageNo ,function(data) {
					var count = data.count;
					var pageNo = data.pageNo; 
					var startPage = data.startPage;
					var groupSize = data.groupSize;
					var lastPage = data.lastPage;
					var totalPage = data.totalPage;
					
					var table = "<div class='panel panel-default' style='width: 80%; margin: auto;'>"
					+"<div class='panel-heading'>"
					+"<div style='color: #7fb3b3; font-size: 30px; font-family: 굴림; margin-left: 500px; font-weight:bold' >"
					+"전체 책 목록</div></div>"
					+"<table class='table'>"
					+"<TR ALIGN=CENTER><TD WIDTH=15%><B>번호</B></TD>"
					+"<TD WIDTH=15%><B>책아이디</B></TD>"
					+"<TD WIDTH=15%><B>책이름</B></TD>"
					+"<TD WIDTH=15%><B>책가격</B></TD>"
					+"<TD WIDTH=15%><B>작가</B></TD>"
					+"<TD WIDTH=15%><B>비고</B></TD></TR>";
				   
					$.each(data.list, function(index, value) {
				 table +="<TR><TD WIDTH=15% ALIGN=CENTER>"+(index+1)+"</TD>"
						+"<TD WIDTH=15% ALIGN=CENTER>"+this.bookId+"</TD>"
						+"<TD WIDTH=15% ALIGN=CENTER>"+this.bookName+"</TD>"
						+"<TD WIDTH=15% ALIGN=CENTER>"+this.bookPrice+"</TD>"
						+"<TD WIDTH=15% ALIGN=CENTER>"+this.writer+"</TD>"
						+'<TD WIDTH=15% ALIGN=CENTER>'
						+'<A style="margin-right: 5px" id="'+this.bookId+'" onclick="AdminBook.detail('+'\''+this.bookId+'\''+')">수정</A>'
						+'<A style="margin-left: 5px" onclick="AdminBook.remove('+'\''+this.bookId+'\''+')">삭제</A></TD></TR>';
					});
					
					table += '</TABLE></div>';
									
					var pagination ='<TABLE id="pagination">'
					+'<TR>'
					+'</TD>'
					+'<TD WIDTH=320 ALIGN=CENTER>';

					if (startPage != 1) {
						pagination += 
						'<a href="#" onclick="AdminbookList.list(1)">'
						+'<IMG style="margin-right: 5px;" SRC="${img}/admin/btn_bf_block.gif">&nbsp;'
						+'</a>'
						+'<a href="#" onclick="AdminBookList.list('+(startPage-groupSize)+')">'
						+'<IMG style="margin-right: 5px;" SRC="${img}/admin/btn_bf_page.gif">&nbsp;'
						+'</a>'
					}
					
					for (var i = startPage; i <= lastPage; i++) {
						if (i == pageNo ) {
							pagination +=
								'<font style="color:red;font-size: 30px">'+i+'</font>';
						} else {
							pagination +=
								'<a href="#" onclick="AdminBookList.list('+i+')">'
								+'<font style="font-size: 20px; margin-right: 5px;">'+i+'</font>'
								+'</a>';
						}
					}
					
					if (lastPage != totalPage) {
						pagination +=
						    '<a href="#" onclick="AdminBookList.list('+(startPage + groupSize)+')">'
		    	            +'<IMG style="margin-left: 5px;" SRC=" ${img}/admin/btn_nxt_page.gif"> &nbsp;'
		           			+'</a>'
		           			+'<a href="#" onclick="AdminBookList.list('+(totalPage - ((totalPage-1) % groupSize))+')">'
		                	+'<IMG style="margin-left: 5px;" SRC=" ${img}/admin/btn_nxt_block.gif"> &nbsp;'
		           			+'</a>';
					}
					pagination +='</TD></TR></TABLE>';
					
					table += pagination;
					$('.mainView').html(table);
										
					AdminBookList.style();
					
				});

		},
		
		style : function(){

			$('#pagination').css('width','70%').css('height','50px')
			.css('margin','auto')
			.css('CELLSPACING','0').css('CELLPADDING','1px').css('ALIGN','CENTER');
			
		},
			 
	bookNotExist : function() {
		var table ='<h1>회원목록</h1><table id="tab_member"><tr><th>아이디</th>';
			table += '<th>이름</th><th>성별</th><th>생년원일</th><th>전화번호</th><th>이메일</th></tr>';
			table += '<tr><td colspan="6"><h2>회원목록이 없습니다.</h2></td></tr></table>';
			$(table).appendTo($('#main_right').empty());
	}
 };
 
var AdminBook = {
		detail : function(bookId) {

			$.getJSON(context+'/admin/book_profile/'+bookId ,
					function(data) {
				$('<form action="${context}/admin/book_update" id="bookFrm" method="post" >')
				.appendTo($('.mainView').empty()); 
			var table = '<div class="panel panel-default" style="width: 25%; margin: auto;">'
				+'<div class="panel-heading" style="width: 100%;">'
				+'<div style="color: #7fb3b3; font-size: 20px; font-family: 굴림; font-weight:bold; margin-left: 120px;" >'
				+'책 정보 수정</div></div>'
				+'<table class="table" style="width: 100%;">'
				+'<tr><th>책이디</th><td id="data_bookId" >'+data.bookId+'</td></tr>'
				+'<tr><th>책이름</th><td id="data_bookName">'+data.bookName+'</td></tr>'
				+'<tr><th>가격</th><td id="data_bookPrice">'+data.bookPrice+'</td></tr>'
				+'<tr><th>작가</th><td id="data_writer">'+data.writer+'</td></tr>'
				+'<tr><th>평점</th><td><input type="text" id="data_grade" name="grade" value="'+data.grade+'"></td></tr>'
				+'<tr><th>재고</th><td><input type="text" id="data_stockSeq" name="stockSeq" value="'+data.stockSeq+'"></td></tr>'
				+'<tr><th>옵션</th><td id="data_optionBook">'+data.optionBook+'</td></tr>'
				+'<tr><th>장르</th><td id="data_genreId">'+data.genreId+'</td></tr>'
				+'<td colspan="2"><button id="confirm" style="width:100px; margin-left: 150px;">정보수정</button></td></tr>'
				+'</table>';
				
			$('#bookFrm').html(table);
			
			$('#confirm').click(function() {
				
				$('#bookFrm').submit(function(e) {
					e.preventDefault(); 
					
					/* 기본 폼태그의 서브밋을 막아라. 자스의 서브밋을 실행해라 */
					
					var postData = new FormData($('#bookFrm')[0]);
					$.ajax('${context}/admin/book_update',{
						type : 'post',
						data : postData,
						async : true, // 비동기로 할 지 여부, 기본값  true, 생략가능
						dataType : 'json',
						mimeType : 'multipart/form-data',
						contentType : false,
						processData : false,
						success : function(data) {
							alert('정보가 수정되었습니다.');
							var table = '<div class="panel panel-default" style="width: 25%; margin: auto;">'
								+'<div class="panel-heading" style="width: 100%;">'
								+'<div style="color: #7fb3b3; font-size: 20px; font-family: 굴림; font-weight:bold; margin-left: 150px;" >'
								+'수정 결과</div></div>'
								+'<table class="table" style="width: 100%;">'
								+'<tr><th>책이디</th><td id="data_bookId" >'+data.bookId+'</td></tr>'
								+'<tr><th>책이름</th><td id="data_bookName">'+data.bookName+'</td></tr>'
								+'<tr><th>가격</th><td id="data_bookPrice">'+data.bookPrice+'</td></tr>'
								+'<tr><th>작가</th><td id="data_writer">'+data.writer+'</td></tr>'
								+'<tr><th>평점</th><td id="data_grade">'+data.grade+'</td></tr>'
								+'<tr><th>재고</th><td id="data_stockSeq">'+data.stockSeq+'</td></tr>'
								+'<tr><th>옵션</th><td id="data_optionBook">'+data.optionBook+'</td></tr>'
								+'<tr><th>장르</th><td id="data_genreId">'+data.genreId+'</td></tr>'
								+'<td colspan="2"><button id="confirm" style="width:100px; margin-left: 150px;">확인</button></td></tr>'
								+'</table>';
			
							
							$('.mainView').html(table);
							
							$('#confirm').click(function() {
								AdminBookList.list('1');
							});
							
						},
						error : function(xhr, status, msg) {
							alert('에러발생상태 : '+status +', 내용 :'+msg);
							// error 는 파라미터 갯수와 위치로 그 역할을 결정하기 때문에
							// xhr 은 자리를 지키고 있어야, status 와 msg 가 작동한다.
						}
					});
				});
			});
			});
		},
		
		remove : function(bookId) {
			$.ajax('${context}/admin/book_delete/'+bookId,{
				data : {
					bookId : bookId
				},
				dataType : 'json',
				success : function(data) {
					alert('책이 삭제되었습니다');
					AdminBookList.list('1');
				},
				error : function(xhr, status, msg) {
					alert('에러발생상태 : '+status +', 내용 :'+msg);
				}
			});
		},
		
		inputBookId : function() {
			$('.mainView').html('<form class="navbar-form navbar-left" role="search">'
					+'<div class="form-group" style="margin: auto;">'
					+'<input type="text" class="form-control" id="textInputId" placeholder="책 ID 입력"></div>'
					+'<button type="button" class="btn btn-default" value="이주의 책 선정" id="btCheck">검 색</button></form>');
					
					$('#btCheck').click(function() {
						alert('클릭');
						if ($("#textInputId").val() == "") {
							alert("책 아이디 값을 입력해주세요.");
							$("#textInputId").focus();
							return false;
						}
						AdminBook.searchForTodayBook2($("#textInputId").val());
				})
		},
		
		searchForTodayBook2 : function(bookId) {
			$.getJSON(context +'/admin/today_book_search/'+bookId ,function(data){
				var todayBook2= '<div id="bookTodaybook" style="color: black; width : 400px; height: 300px; border: 1px solid black;"><h2>이주의 책</h2><br /><br /><br />'
					+'<img alt="" src="'+context+'/resources/images/'+data.bookId+'.jpg" width="106px" height="150px" align="left">'
					+'<a href="#" id="'+data.bookId+'"><strong>'+data.bookName+'</strong></a><br /><br />'
					+'<font color="maroon" size="1px">'+data.writer+'</font><br />'
					+'<font color="black" size="2px">책 내용 들어갈 자리.</font>';
					$('.mainView').html(todayBook2);
					$('#'+data.bookId).click(function() {
						book.mainPage(bookId);
					});
			});
					
		}		
};

var adminPurchase = {
		purList : function(context) {
			var arr = [];
			$.getJSON(context+'/purchase/list', function(data) {
				var table = "<div class='panel panel-default' style='width: 80%; margin: auto;'>"
					+"<div class='panel-heading'>"
					+"<div style='color: #7fb3b3; font-size: 30px; font-family: 굴림; margin-left: 500px; font-weight:bold' >"
					+"전체 주문 목록</div></div>"
					+'<table id="pur_list" class="table"><tr><th>주문번호</th><th>합계</th><th>어카운트 넘버</th>'
					+'<th>주문한 아이디</th><th>주문한 책 이름</th></tr>';
				$.each(data, function(i, val) {
					table +='<tr><td>'+this.purNum+'</td>'
					+'<td>'+this.sum+'</td>'
					+'<td>'+this.accNum+'</td>'
					+'<td>'+this.userid+'</td>'
					+'<td>'+this.bookid+'</td>'
					+'<td><label id="'+this.purNum+'">삭제</label></td></tr>';
					arr.push(this.purNum);
				});
				table += '</table></div>'; 
				$('.mainView').html(table);
				
				$.each(data, function(i, val) {
					$('#'+arr[i]).click(function() {
						alert('삭제 버튼 먹음');
					});
				});		
			});
		}
		
};

var AdminPurchase2 = {
		
		calender : function() {
			$('.mainView').html('<div style="margin-left: 35%; margin-top: 3%; height: 500px;">'
					+'<div style="width: 20%; float: left; "><input class="form-control" type="date" name="purchase_start" id="purchase_start"></div>'
				  	+'<div style="width: 20%; float: left; "><input class="form-control" type="date" name="purchase_end" id="purchase_end"></div>'
				 	+'<div style="width: 20%; float: left; "><input class="btn btn-default" type="button" id="calender_confirm" value="확인"/></div></div>');
					
			$('#calender_confirm').click(function(){
				var calender_start = $('#purchase_start').val();
				var calender_end = $('#purchase_end').val();

				AdminPurchase2.list(calender_start, calender_end );
				
			});	
		},
		
		list : function(calender_start, calender_end) {
			var arr = [];
			$.getJSON(context+'/account/day/'+calender_start+'/'+calender_end, function(data) {
				var table ="<div class='panel panel-default' style='width: 80%; margin: auto; '>"
					+"<div class='panel-heading'>"
					+"<div style='color: #7fb3b3; font-size: 30px; font-family: 굴림; margin-left: 38%; font-weight:bold' >"
					+"기간별 주문 목록</br></div>"
					+"<div style='margin-left: 41%;'>"+calender_start+" ~ "+calender_end+"</div></div>"
					+'<table id="pur_list" class="table"><tr><th>주문번호</th><th>합계</th><th>어카운트 넘버</th>'
					+'<th>주문한 아이디</th><th>주문한 책 이름</th></tr>';
				$.each(data, function(i, val) {
					table +='<tr><td>'+this.purNum+'</td>'
					+'<td>'+this.sum+'</td>'
					+'<td>'+this.accNum+'</td>'
					+'<td>'+this.userid+'</td>'
					+'<td>'+this.bookid+'</td>'
					+'<td><label id="'+this.purNum+'">삭제</label></td></tr>';
					arr.push(this.purNum);
				});
				table += '</table></div>'; 
				$('.mainView').html(table);
				
				$.each(data, function(i, val) {
					$('#'+arr[i]).click(function() {
						alert('삭제 버튼 먹음');
					});
				});
			});			
		}
};


</script>










