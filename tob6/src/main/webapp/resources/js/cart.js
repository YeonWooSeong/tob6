var Cart = {
		userid : '',
		getUserid : function() {
			return this.userid;
		},
		setUserid : function(userid) {
			this.userid = userid; 
		},
	
	main : function(link, userid) {
		alert('메인으로 넘어옴');
		$("#cart_section").load(link+"/cart/Cart");
		alert('메인으로 넘어온 유저아이디'+userid);
		Cart.setUserid(userid);
		alert('메인으로 넘어온 유저아이디'+Cart.getUserid());
	},

	put : function(bookId) {
		$.ajax(context+'/cart/put',{
			data : {
				bookId : bookId
			},
			dataType : "json",
			type : 'get',
			contentType : "application/json;",
			mimeType : "application/json;",
			async : false,
			success : function() {
				alert('장바구니에 담겼습니다.');
			},
			error : function() {
				alert('이미 장바구니에 있습니다.');
			}
		});
	},
	
	getBooksInCart : function() {
		var bookIdList = [];
		$.getJSON(context+'/cart/BookIdList', function(data) {
			
			bookIdList.push(this.bookId);
		});
	},
	
	getUseridList : function() {
		var useridList = [];
		$.getJSON(context+'/cart/UseridList', function(data) {
			useridList.push(this.userid);
		});
	},
	
	
	list : function(userid) {
		var arr = [];
		var list = [];
		$.getJSON(context+'/cart/list/'+userid, function(data) {
			var table = '<div id="Shop_Basket" style="height:100%">'
						+'<table width="866" align="center" border="0" cellspacing="0" cellpadding="0"><tbody><tr><td colspan="2">'
						+'<table id="table_lis" width="100%" align="center" border="0" cellspacing="0" cellpadding="0"><tbody><tr><td colspan="2">'
						+'<table width="100%" align="center" border="0" cellspacing="0" cellpadding="0"><tbody><tr><td align="left"><h3 class="title_middle_black">'
						+'<span class="title_middle_blue">TOB</span>배송 상품 장바구니 </h3></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table>'
						+'<table width="866" align="center" cellspacing="0" cellpadding="0" border="1px solid silver"><tbody><tr>'
						+'<th width="50" height="29" text-align="center"></th>'
						+'<th height="29" align="center">상품명<span id=""></span></th>'
						+'<th width="130" height="29" align="center">가격</th>'
						+'<th width="130" height="29" align="center">수량</th>'
						+'<th width="110" height="29" align="center">보관/삭제</tr></tbody>';
			$.each(data, function(i, val) {
				table +='<tr><td width="50" text-align="center"></td>'
				+'<td width="*"><a href="#" id="'+this.bookName+'">'+this.bookName+'</a></td>'
				+'<td width="130" text-align="center">'+this.bookPrice * this.count +'</td>'    //<form name="changeCount" Action="#" Method="post">	 빈 공간 폼테그.
				+'<td width="150"  text-align="center">'
				+'	<div style="float:left" id="count'+i+'">'
				+'		<input type="text" size="1" id="c'+i+'" value="'+this.count+'" onkeyup="Cart.myFunction('+i+','+'\''+this.bookId+'\''+')"></input>'
				+'	</div>'
				+'	<div class="button" style="float:left;margin-left:4px">'
/*==>onclick*/	+'		<input type="submit" class="button_gray" style="width:55px" value="변경" onclick="Cart.change('+'\''+this.bookId+'\''+')">'
				+'	</div>'
				+'</td>'
/*==>onclick*/	+'<td width="100" align="center"><button id="delete'+i+'" align="center" onclick="Cart.remove('+'\''+this.bookId+'\''+')">삭제</button></td>'
				+'<span id="d'+i+'"></span></tr>';
				arr.push(this.bookId);
				list.push()
			});
			
			table += '</tbody></table><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top: 10px" bgcolor="#E3EDF7"><tbody>'
				+'<tr><td align="center" style="padding: 10px 0 10px 0"><table cellpadding="0" cellspacing="0" border="0" width="610"><tbody><tr><td>'
				+'<table cellpadding="0" cellspacing="0" border="0"'
				+'width="289"><tbody><tr><td width="140">총 상품가격</td>'
				+'<td width="149"><strong>합계가 들어와야되</strong></td>'
				+'</tr><tr><td height="20">배송비</td><td><strong>0</strong>원</td></tr><tr><td height="20">총 주문 상품 수</td>'
				+'<td><strong></span></strong>권</td>'
				+'<td></td></tr></tbody></table>'
				+'</td><td width="1" bgcolor="#ffffff"></td></tbody></table>'
				+'<table cellpadding="0" cellspacing="0" border="0" width="600"><tbody><tr>'
				+'<td width="140" height="20" class="pt1"><strong>총 결제 예상 금액</strong></td>'
				+'<td width="149" class="pt1"><span class="pt3">합계 금액이 들어와야댐</span></td></tr></tbody></table>                </td></tr></tbody>'
				+'</table>'
				+'</div>';
			
			$('#cart_section').empty().append(table);
			
		});
	},
	
	myFunction : function(i, bookId) {
		alert('Cart.myFuncion진입 넘어온 값 : '+i);
		alert('Cart.myFuncion진입 넘어온 값 : '+ bookId);
		$('#count'+i).empty();
		alert('count i 번째 디브 지웠음.');
		var result = '<span id="demo"></span>';
		$('#count'+i).append('<input type="text" size="1" id="c'+i+'" value="<span id=d'+i+'></span>"' +'" onkeyup="Cart.myFunction('+'\''+i+'\''+','+'\''+bookId+'\''+')"></input>');
		
	
		alert('count i 번째 다시 그리고 난 뒤 i 값 : ' +i);
		alert('count i 번째 다시 그리고 난 뒤 BookId 값 : ' +bookId);
		alert('i 번째 스팬 값 : ' + result);
		 var x = document.getElementById("c"+i).value;
		    document.getElementById("d"+i).innerHTML = x;
	},
	
	putInCart : function(bookId) {
		Cart.getBooksInCart();
		Cart.put(bookId);
	},
	
	putInPurchase : function(userid, bookId, price) {
		Cart.send_email();
		alert('Cart.putInPurchase진입. 구매 클릭 됨.');
		alert('넘어온 유저아이디  : '+userid);
		alert('넘어온 책 아이디 : '+bookId);
		alert('넘어온 책 가격 : '+price);
	    $.ajax(context+'/purchase/buy', {
	    	data : {
	    		userid : userid,
	    		bookId : bookId,
	    		price : price
	    	},
			dataType : "json",
			type : 'get',
			contentType : "application/json;",
			mimeType : "application/json;",
			async : false,
			success : function() {
				alert('구매 완료.');
			},
			error : function() {
				alert('ajax 에러');
			}
	    });
	},
	
	send_email : function() {
		alert('Cart.send_email진입');
		$.ajax(context+'/purchase/sendEmail', {
			data : {
				
			},
			dataType : "json",
			type : 'get',
			contentType : "application/json;",
			mimeType : "application/json;",
			async : false,
			success : function(data) {
				if (data.login_check =="login") {
					alert('인증번호가 발송되었습니다.');
				} else {
					alert('로그인 후 이용가능합니다.');
				}
			},
			error : function() {
				alert('ajax 에러');
			}
		});
	},
	/*change : function(bookid, count) {
		alert('onclick은 먹음'+bookid);
		alert('onclick은 먹음.'+count);
		
		$.ajax(context+'/cart/change',{
			data : {
				data : data
			},
			dataType : "json",
			type : 'get',
			contentType : "application/json;",
			mimeType : "application/json;",
			async : false,
			success : function() {
				alert('수량이 변경되었습니다.')
			},
			error : function() {
				alert('cart-change의 ajax 실패');
			}
			
		});
	},*/
	
	remove : function(bookId, userid) {
			alert('Cart.remove 진입, 넘어온 책 아이디값 : ' +bookId);
			$.ajax(context+'/cart/remove', {
				data : {
					bookId : bookId,
					userid : userid
				},
				dataType : "json",
				type : 'get',
				contentType : "application/json;",
				mimeType : "application/json;",
				async : false,
				success : function() {
					alert('삭제되었습니다.');
				},
				error : function() {
					
				}
			});
			
		

	}
	
	
	
};