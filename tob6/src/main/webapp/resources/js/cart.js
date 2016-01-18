var Cart = {
		userid : '',
		total : 0,
		comma : '',
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
		/*getComma : function() {
			return this.comma;
		},
		setComma : function(bookPrice) {
			 var result = '';
			 var temp = '';
			 var j = 0;
			 for (var i = bookPrice.length-1; i >= 0; i--) {
				j++;
				if (j > 0) {
					if (j % 3 == 0) {
						var b = ',';
						b += bookPrice.substring(i, i+3);
						temp = b;
						b = result;
						result = temp;
						result += b;
					}
					if (j+1 == bookPrice.length) {
						var temp2 = bookPrice.substring(0, j%3+1);
						temp = temp2;
						temp2 = result;
						result = temp;
						result += temp2;
					}
				}
				
				
			}
			this.comma = result;
		},*/
		
	
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
			var table = '<h3 style="margin-left:10%; margin-bottom: 2%;">TOB 배송 상품 장바구니</h3><div class="orderlist" align="center" style="display: table; width:60%; margin-left:20%;"><div class="row" style="display: table-row;"><div class="column" style="display: table-cell;"></div><div class="column" style="display: table-cell;"><h5>상품명</h5></div><div class="column" style="display: table-cell;"><h5>가격</h5></div><div class="column" style="display: table-cell;"><h5>수량</h5></div><div class="column" style="display: table-cell;"><h5>삭제</h5></div></div>';
			$.each(data, function(i, val) {
				/*Cart.setComma(this.bookPrice);*/
				table +='<div class="row" style="display: table-row; margin-bottom: 3%;">'
					+'<div class="column" style="display: table-cell;">'+(i+1)+'</div>'
					+'<div class="column" style="display: table-cell;">'+this.bookName+'</div>'
					+'<div class="column" style="display: table-cell;">'+(this.bookPrice * this.count)+'</div>'
					+'<form name="form'+i+'" action="'+context+'/cart/change"><div class="column" style="display: table-cell;">'
					+'	<input type="text" size="1" id="count'+i+'" value="'+this.count+'"></input>'
					+'	<input type="button" id="'+this.bookId+i+'" style="margin-left:5px;" value="변경"></input>'
					+'</div></form>'
					+'<div class="column" style="display: table-cell;">'
					+'	<input type="button" value="삭제"></input></div>'
					+'</div>'
					;
				arr.push(this.bookId);
				//total += this.bookPrice;
				Cart.setTotal(this.bookPrice);
				Cart.setTotalCount(this.count);
				
				/*$('#'+this.bookId+i).click(function() {
					alert(i+'번째 버튼 클릭됨');
				});*/
				$('#160').click(function() {
					alert('클릭 이벤 먹음');
					$('#form'+i).submit(function(e) {
						e.preventDefault();
						alert('form 전송 완료');
						$.ajax(context+'/cart/change',{
							data : {
								count : $('#count'+i).val(),
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
					});
				});
				
			});
			
			table += '</div></tbody></table><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top: 10px" bgcolor="#E3EDF7"><tbody>'
				+'<tr><td align="center" style="padding: 10px 0 10px 0"><table cellpadding="0" cellspacing="0" border="0" width="610"><tbody><tr><td>'
				+'<table cellpadding="0" cellspacing="0" border="0"'
				+'width="289"><tbody><tr><td width="140">총 상품가격</td>'
				+'<td width="149"><strong>'+Cart.getTotal()+'</strong></td>'
				+'</tr><tr><td height="20">배송비</td><td><strong>0</strong>원</td></tr><tr><td height="20">총 주문 상품 수</td>'
				+'<td><strong>'+Cart.getTotalCount()+'</strong>권</td>'
				+'<td></td></tr></tbody></table>'
				+'</td><td width="1" bgcolor="#ffffff"></td></tbody></table>'
				+'<table cellpadding="0" cellspacing="0" border="0" width="900" style="margin-left:300px"><tbody><tr>'
				+'<td width="300" height="20" class="pt1"><strong>총 결제 예상 금액</strong></td>'
				+'<td width="300" class="pt1"><h2><span class="pt3">'+Cart.getTotal()+'</span>원</h2></td>'
				+'<td class="pt1"><input type="image" src="'+context+'/resources/images/pay.png" name="submit" id="pay" value="결제하기"></input></td>  </tr></tbody></table>                </td></tr></tbody>'
				+'</table>'
				+'</div>';
			
			$('#cart_section').empty().append(table);
			
			
		});
	},
	
	
	change : function() {
		alert('Cart.change() 진입(.js) ');
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
			/*Cart.send_email();*/
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
				},
				error : function() {
					alert('ajax 에러');
				}
		    });
		}
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
