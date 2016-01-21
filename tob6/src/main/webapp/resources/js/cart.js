var Cart = {
		userid : '',
		total : 0,
		totalCount : 0,
		getUserid : function() {
			return this.userid;
		},
		setUserid : function(userid) {
			this.userid = userid; 
		},
		getTotal : function() {
			return this.total;
		},
		setTotal : function(total) {
			this.total += total; 
		},
		getTotalCount : function() {
			return this.totalCount;
		},
		setTotalCount : function(totalCount) {
			this.totalCount += totalCount; 
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
	
	cc : function comma(str) {
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	},
	
	list : function(userid) {
		var arr = [];
		var list = [];
		$.getJSON(context+'/cart/list/'+userid, function(data) {
			var table = '<img src="'+context+'/resources/images/cart_bag.png" alt="장바구니" style="margin-left:10%; margin-bottom: 2%;">'
				+'<div class="orderlist" align="center" style="display: table; width:60%; margin-left:20%;">'
				+'<div class="row" style="display: table-row;"><div class="column" style="display: table-cell; border: 1px solid silver;">'
				+'</div><div class="column" style="display: table-cell; border: 1px solid silver;"><h5>상품명</h5></div>'
				+'<div class="column" style="display: table-cell; border: 1px solid silver;"><h5>가격</h5></div>'
				+'<div class="column" style="display: table-cell; border: 1px solid silver;"><h5>수량</h5></div>'
				+'<div class="column" style="display: table-cell; border: 1px solid silver;"><h5>삭제</h5></div></div>';
			$.each(data, function(i, val) {
				
				table +='<div class="row" style="display: table-row; margin-bottom: 3%; border: 1px solid silver;" >'
					+'<div class="column" style="display: table-cell; border: 1px solid silver;">'+(i+1)+'</div>'
					+'<div class="column" style="display: table-cell; border: 1px solid silver;">'+this.bookName+'</div>'
					+'<div class="column" style="display: table-cell; border: 1px solid silver;">'+Cart.cc(this.bookPrice * this.count)+'</div>'
					+'<div class="column" style="display: table-cell; border: 1px solid silver;">'
					+'	<input type="text" class="vol" size="1" id="'+this.bookId+'" value="'+this.count+'"></input>'				//onclick="Cart.change('+'\''+$('#count'+i+'').val()+'\''+','+'\''+this.bookId+'\''+')"
					+'	<input type="image" class="cat" id="'+this.bookId+'" style="margin-left:5px;" src="'+context+'/resources/images/btn_modify.gif"></input>'
					+'</div>'
					+'<div class="column" style="display: table-cell; border: 1px solid silver;">'
					+'	<input type="image" src="'+context+'/resources/images/btn_del02.gif" id="delete'+i+'" onclick="Cart.remove('+'\''+this.bookId+'\''+')"></input></div>'
					+'</div>';
				arr.push(this.bookId);
				Cart.setTotal(this.bookPrice * this.count);
				Cart.setTotalCount(this.count);
				
			});
			
			table += '</div></tbody></table><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top: 10px" bgcolor="#E3EDF7"><tbody>'
				+'<tr><td align="center" style="padding: 10px 0 10px 0"><table cellpadding="0" cellspacing="0" border="0" width="610"><tbody><tr><td>'
				+'<table cellpadding="0" cellspacing="0" border="0"'
				+'width="289"><tbody><tr><td width="140">총 상품가격</td>'
				+'<td width="149"><strong>'+Cart.cc(Cart.getTotal())+'</strong></td>'
				+'</tr><tr><td height="20">배송비</td><td><strong>0</strong>원</td></tr><tr><td height="20">총 주문 상품 수</td>'
				+'<td><strong>'+Cart.getTotalCount()+'</strong>권 </td>'
				+'<td></td></tr></tbody></table>'
				+'</td><td width="1" bgcolor="#ffffff"></td></tbody></table>'
				+'<table cellpadding="0" cellspacing="0" border="0" width="900" style="margin-left:300px"><tbody><tr>'
				+'<td width="300" height="20" class="pt1"><strong>총 결제 예상 금액</strong></td>'
				+'<td id="totPrice" width="300" class="pt1"><h2><span class="pt3" style="color: red;">'+Cart.cc(Cart.getTotal())+'</span>원</h2></td>'
				+'<td class="pt1">'
				+'<input type="image" src="'+context+'/resources/images/pay.png" name="submit" value="결제하기" onclick="Cart.putInPurchase('+'\''+userid+'\''+','+'\''+arr[0]+'\''+','+'\''+Cart.cc(Cart.getTotal())+'\''+')"></input></td>  </tr></tbody></table>                </td></tr></tbody>'
				+'</table>'
				+'</div>';
			
			$('.mainView').empty().html(table);
			$('.cat').click(function() {
				alert($('input[id="'+$(this).attr('id')+'"]').val());
				alert($(this).attr('id'));
				Cart.change(userid, $('input[id="'+$(this).attr('id')+'"]').val(), $(this).attr('id'));
				//$(this).attr('id')
				//alert($('input:text').val($(this)));
				//alert($('#count2').val());
				//$(this).attr('id');
			});
		});
	},
	
	
	change : function(userid, count, bookId) {
		
		alert('Cart.change() 진입 넘어온 아이디 : '+userid);
		alert('Cart.change() 진입 넘어온 수량 : '+count);
		alert('Cart.change() 진입 넘어온 책아이디 : '+bookId);
		$.ajax(context+'/cart/change',{
			data : {
				userid : userid,
				count : count,
				bookId : bookId
			},
			dataType : "json",
			type : 'get',
			contentType : "application/json;",
			mimeType : "application/json;",
			async : false,
			success : function() {
				alert('변경이 완료되었습니다.');
			},
			error : function() {
				alert('ajax 에러.');
			}
		});
		
	},
	
	/*myFunction : function(i, bookId) {
		alert('Cart.myFuncion진입 넘어온 값 : '+i);
		alert('Cart.myFuncion진입 넘어온 값 : '+ bookId);
		$('#count'+i).empty();
		alert('count i 번째 디브 지웠음.');
		var result = <span id="di"></span>;
		alert('' + x);
		alert('result : ' + result);
		$('#count'+i).append('<input type="text" size="1" id="c'+i+'" value="온키업의 결과	" onkeyup="Cart.myFunction('+'\''+i+'\''+','+'\''+bookId+'\''+')"></input>');
		
	
		alert('count i 번째 다시 그리고 난 뒤 i 값 : ' +i);
		alert('count i 번째 다시 그리고 난 뒤 BookId 값 : ' +bookId);
		alert('i 번째 스팬 값 : ' + result);
		 var x = document.getElementById("c"+i).value;
		    document.getElementById("demo").innerHTML = x;
		    
	},*/
	
	putInCart : function(userid, bookId) {
		alert('Cart.putInCart 진입, 넘어온 아이디 : '+userid);
		alert('Cart.putInCart 진입, 넘어온 책 아이디  : '+bookId);
		if (userid == "") {
			alert('로그인 후 이용가능합니다.');
		} else {
			Cart.getBooksInCart();
			Cart.put(bookId);
		}
		
	},
	
	putInPurchase : function(userid, bookId, price) {
		if (userid === "") {
			alert('로그인 후 이용가능합니다.');
		} else {
			Cart.send_email(userid);
			
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
				success : function(data) {
					alert('구매가 완료되었습니다.');
					Cart.emptyCart(userid);
				},
				error : function() {
					alert('ajax 에러');
				}
		    });
		}
	},
	
	send_email : function(userid) {
		alert('Cart.send_email진입, 넘어온 아이디 : ' + userid);
		$.ajax(context+'/purchase/sendEmail', {
			data : {
				userid : userid
			},
			dataType : "json",
			type : 'get',
			contentType : "application/json;",
			mimeType : "application/json;",
			async : false,
			success : function(data) {
				if (data.login_check =="login") {
					alert('구매내역이 발송되었습니다.');
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

	},
	
	emptyCart : function(userid) {
		alert('Cart.emptyCart 진입, 넘어온 아이디 : ' + userid);
		$.ajax(context+'/cart/empty', {
			data : {
				userid : userid
			},
			dataType : "json",
			type : 'get',
			contentType : "application/json;",
			mimeType : "application/json;",
			async : false,
			success : function() {
				alert('구매완료 후 장바구니 비우기 완료.');
			},
			error : function() {
				
			}
		});
		
	}
	
	
	
};
