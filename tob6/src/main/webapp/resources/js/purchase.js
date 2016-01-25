var Purchase = {
		main : function(link) {
			$(".mainView").load(link+"/purchase/Purchase");
		},
		buy : function(bookId, userid) {
			$.ajax(context + '/purchase/buy', {
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
					alert('형동이형의 장바구니리스트로 가야함.');
				},
				error : function() {
					alert('cart-buy의 ajax 에러');
				}
			});
		},
		
		list : function(context) {
			var arr = [];
			$.getJSON(context+'/purchase/list', function(data) {
				var table = '<div id="purList"><h1> 전체주문 목록</h1>'
					+'<table id="pur_list"><tr><th>주문번호</th><th>합계</th><th>어카운트 넘버</th>'
					+'<th>주문한 아이디</th><th>주문한 책 이름</th></tr>';
				$.each(data, function(i, val) {
					table +='<tr><td>'+this.purNum+'</td>'
					+'<td>'+this.sum+'</td>'
					+'<td>'+this.accountNum+'</td>'
					+'<td>'+this.userid+'</td>'
					+'<td>'+this.bookid+'</td>'
					+'<td><label id="'+this.purNum+'">삭제</label></td></tr>';
					arr.push(this.purNum);
				});
				table += '</table></div>'; 
				$('.mainView').html(table);
				
				$.each(data, function(i, val) {
					$('#'+arr[i]).click(function() {
					});
				});
				
				
			});
		},
		remove : function(purNum) {
			
		}
};