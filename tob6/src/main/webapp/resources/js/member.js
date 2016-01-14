
var Member = {
			detail : function(url) {
				alert('detail 진입');
				$.getJSON(url,
					function(data){
					alert('겟제이슨')
					var table = '<table><tr><td rowspan="7" id="td_profile"><img id="profile" src="'+img+'/'+data.profile+'" width="70%" height="80%"/></td>'
					+'<th id="item">항목</th><th>빈 칸</th></tr><tr><td>아이디</td><td>'+data.userid+'</td></tr><tr><td>비밀번호</td><td>'+data.password+''
					+'</td></tr><tr><td>이름</td><td>'+data.name+'</td></tr><tr><td>생일</td><td>'+data.gender+'</td></tr><tr>'
					+'<td>주소</td><td>'+data.addr+'</td></tr><tr><td>이메일</td><td>'+data.email+'</td></tr>'
					+'<tr><td><button id="changeImg">사진변경</button></td>'
					+'<td><button id="changeInfo">정보수정</button><button id="remove">회원탈퇴</button></td>'
					+'<td><button id="confirm">확인</button></td></tr></table>';
					$('.mainView').html(table);
					Member.style();
					$('#changeInfo').click(function() {
						alert('정보수정클릭한다');
						Member.updateForm(data.userid);
					});
					$('#remove').click(function() {
						alert('삭제클릭');
						Member.remove(data.userid);
					});
				});
			},
			updateForm : function(userid) {
				alert('업데이트 진입했다');
				$.getJSON(context+'/member/updateForm/'+userid,
						function(data){
					var updates = '<form action="'+context+'/member/update" id="frm">';
					$('.mainView').empty();
					$('.mainView').append(updates);
					var table = '<table><tr><td rowspan="8" id="td_profile"><img id="profile" src="'+img+'/'+data.profile+'" width="70%" height="80%"/></td>'
					+'<th id="item">항목</th><th>빈 칸</th></tr><tr><td>아이디</td><td>'+data.userid+'</td></tr><tr>'
					+'<td>비밀번호</td><td><input type="password" id="password" value='+data.password+'>'
					+'</td></tr><tr><td>이름</td><td>'+data.name+'</td></tr><tr><td>생일</td><td>'+data.gender+'</td></tr><tr>'
					+'<td>주소</td><td><input type="text" id="addr" value='+data.addr+'></td></tr>'
					+'<tr><td>이메일</td><td><input type="text" id="email" value='+data.email+'></td>'
					+'<td><input type="text" id="phone" value='+data.phone+'></td></tr>'
					+'<tr><td><button id="changeImg">사진변경</button></td>'
					+'<td><button id="changeInfo">정보수정</button></td>'
					+'<td><button id="confirm">확인</button></td></tr></table>';
					$('#frm').append(table);
					Member.style();
					$('#confirm').click(function() {
						 	alert('확인');
						$('#frm').submit(function(e) {
							alert('예압');
							e.preventDefault(); /* 기본 폼태그의 서브밋을 막아라. 자스의 서브밋을 실행해라 */
							$.ajax(context+'/member/update',{
								/*type : 'get',*/
								data : {
									password : $('#password').val(),
									addr : $('#addr').val(),
									phone : $('#phone').val(),
									email : $('#email').val()
									/*page : 'update'*/
								},
								async : true, // 비동기로 할 지 여부, 기본값  true, 생략가능
								dataType : 'json',
								success : function(data) {
									location.href=''+context+'/member/detail/'+data.userid;
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
			update : function() {
				$.ajax('',{
					data : {},
					dataType : 'json',
					success : function(data) {
						
					},
					error : function(e) {
						
					}
				});
			},
			style : function(){
				$('td').css('text-align','center');
				$('tr').add('th').add('td').css('float','center');
				$('.mainView').css('clear','both').css('margin','20px');
				$('.item').css('width','400px');
				$('.profile').css('width','300px');
				$('.td_profile').css('width','400px');
			},
			remove : function(userid) {
				$.ajax(''+context+'/member/remove/'+userid,{
					dataType : 'json',
					success : function(data) {
						alert('회원탈퇴 되었습니다.');
						location.href = ''+context+'/member/logout';
					},
					error : function(xhr, status, msg) {
						alert('에러발생상태 : '+status +', 내용 :'+msg);
					}
				});
			}
			/*cartlist : function(userid) {
				alert('리스트는 하루동안 담은 내역을 보여주는것으로..');
				alert('cartlist 진입, 넘어온 아이디 : '+userid);
				var arr = [];
				$.getJSON(context+'/cart/list/'+userid, function(data) {
					var table = '<div id="cartList"><h1> TOB 배송 상품 장바구니</h1>'
						+'<table id="pur_list"><tr><th>책 이름</th>'
						+'<th>가격</th><th>수량</th></tr>';
					$.each(data, function(i, val) {
						table +='<tr><td><a href="#" id="'+this.bookName+'">'+this.bookName+'</a></td>'
						+'<td>'+this.bookPrice+'</td>'
						+'<td>'+this.count+'</td>'
						+'<td><button id="o'+i+'">주문하기</button></td>'
						+'<td><button id="d'+i+'">삭제하기</button></td></tr>'
						arr.push(this.purNum);
					});
					table += '</table></div>';
					$(table).appendTo($('.mainView').empty());
					$('.mainView').empty().append(table);
					
					삭제시 필요한 파라미터 : CART_TODAY, BOOK_ID, USERID
					$.each(data, function(i, val) {
						
					});
				});
			}*/
};

