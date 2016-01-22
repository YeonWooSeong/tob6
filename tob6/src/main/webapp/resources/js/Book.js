var book = {
		userid : '',
		getUserid : function() {
			return this.userid;
		},
		setUserid : function(userid) {
			this.userid = userid; 
		},
		/*책 전체목록 */
		all : function(userid) {
			
			
			var abroadArr =[];
			var abroadArrName =[];
			
			var domesticArr =[];
			var domesticArrName =[];
			
			var ebookArr =[];
			var ebookArrName =[];
			
			var newArr =[];
			var newArrName =[];
			
			var oldArr =[];
			var oldArrName =[];
			$.getJSON(context + '/genre/Genre',function(data){
				var bigTable = '<div id="bigTable" style="width: 70%; margin:auto; "></div>';
				var table1 = '<div class="hoho"><img alt="" src="'+context+'/resources/images/All_list.png" ></div>';
				/*해외도서 */
				table1 += '<div class="alpha"><font color="blue"><strong style="font-size:18px;">'+data.listAbroadName+'</strong></font><br /><p><p>';
				$.each(data.listAbroad,function(index,value){
					table1 += '<li class="lili"><label id="'+this.genreId+'">'+this.genreName+'</label></li>'; 
					abroadArr.push(this.genreId);
					abroadArrName.push(this.genreName);
					});
				
				table1 += '</div><br>';
				
				
				var table2 = '';
				/*국내도서 */
				table2 = '<div class="alpha"><font color="blue"><strong style="font-size:18px;">'+data.listDomesticName+'</strong></font><br /><p><p>';
				$.each(data.listDomestic,function(index,value){
					table2 += '<li class="lili"><label id="'+this.genreId+'">'+this.genreName+'</label></li>'; 
					domesticArr.push(this.genreId);
					domesticArrName.push(this.genreName);
					});
				table2 += '</div><br>';
				
				var table3 ='';
				/*전자책 */
				table3 += '<div class="alpha"><font color="blue"><strong style="font-size:18px;">'+data.listEbookName+'</strong></font><br /><p><p>';
				$.each(data.listEbook,function(index,value){
					table3 += '<li class="lili"><label id="'+this.genreId+'">'+this.genreName+'</label></li>'; 
					ebookArr.push(this.genreId);
					ebookArrName.push(this.genreName);
					});
				table3 += '</div><br>';
				
				var table4 = '';
				/*신간 */
				table4 += '<div class="alpha"><font color="blue"><strong style="font-size:18px;">'+data.listNewName+'</strong></font><br /><p><p>';
				$.each(data.listNew,function(index,value){
					table4 += '<li class="lili"><label id="'+this.genreId+'">'+this.genreName+'</label></li>'; 
					newArr.push(this.genreId);
					newArrName.push(this.genreName);
					});
				table4 += '</div><br>';
				
				var table5 = '';
				/*중고책*/
				table5 += '<div class="alpha"><font color="blue"><strong style="font-size:18px;">'+data.listOldName+'</strong></font><br /><p><p>';
				$.each(data.listOld,function(index,value){
					table5 += '<li class="lili"><label id="'+this.genreId+'">'+this.genreName+'</label></li>';
					oldArr.push(this.genreId);
					oldArrName.push(this.genreName);
					});
				table5 += '</div><br>';
					
				
				var table6 ='';
				table6 += '<div class="alpha"><font color="blue"><strong style="font-size:18px;">영미도서</strong></font><br /><p><p>'
					+'<li class="lili"><label><b>과학</b></label></li><li class="lili"><b>가정/육아</b></li>'
					+'<li class="lili"><b>건강</b></li><li class="lili"><b>여행</b></li><li class="lili"><b>라이트노벨</b></li>'
					+'<li class="lili"><b>취미/실용</b></li><li class="lili"><b>한국소개도서</b></li>'
					+'<li class="lili"><b>요리</b></li>'
					+'</div><br>';
				
				var table7 ='';
				table7 += '<div class="alpha"><font color="blue"><strong style="font-size:18px;">중미도서</strong></font><br /><p><p>'
					+'<li class="lili"><label><b>한국소개도서</b></label></li><li class="lili"><b>스포츠</b></li>'
					+'<li class="lili"><b>잡지</b></li><li class="lili"><b>대중문화</b></li><li class="lili"><b>애니</b></li>'
					+'<li class="lili"><b>인문</b></li><li class="lili"><b>스페인도서</b></li><li class="lili"><b>ELT</b></li>'
					+'</div><br>';
					
				var table8 ='';
				table8 += '<div class="alpha"><font color="blue"><strong style="font-size:18px;">e-book</strong></font><br /><p><p>'
					+'<li class="lili"><label><b>프랑스도서</b></label></li><li class="lili"><b>독일도서</b></li>'
					+'<li class="lili"><b>중국도서</b></li><li class="lili"><b>기술</b></li><li class="lili"><b>엔터테인먼트</b></li>'
					+'<li class="lili"><b>문고</b></li><li class="lili"><b>자연</b></li><li class="lili"><b>기술과학</b></li>'
					+'</div><br>';
				
				var table9 ='';
				table9 += '<div class="alpha"><font color="blue"><strong style="font-size:18px;">e연재</strong></font><br /><p><p>'
					+'<li class="lili"><label><b>신서</b></label></li><li class="lili"><b>예술/건축</b></li>'
					+'<li class="lili"><b>로맨스</b></li><li class="lili"><b>판타지</b></li><li class="lili"><b>전쟁</b></li>'
					+'<li class="lili"><b>대체역사</b></li>'
					+'</div><br>';
				
				
				$('#book_section').html(bigTable);
				$('#bigTable').append(table1).append(table2).append(table3).append(table4).append(table5)
				.append(table6).append(table7).append(table8).append(table9);
				
				$('.alpha').css('margin-top','10px').css('margin-left','10px').css('margin-bottom','10px').css('vertical-align','middle');
				$('.hoho').css('margin','auto').css('padding-bottom','40px').css('width','100px');
				$('.lili').css('vertical-align','middle').css('width','100px').css('float','left')
				.css('display','block');
				$('#book_section').css('height','950px').css('margin','auto');
			
				
				
				
				/*---------------------------다음페이지로 넘어가기.-------------------------------*/
				$.each(data.listAbroad,function(i,value){
					$('#'+abroadArr[i]).click(function() {
						book.bookEmpty();
						book.bookSimplePage2('1',abroadArr[i],userid);
					});
					
				});
				
				$.each(data.listDomestic,function(i,value){
					$('#'+domesticArr[i]).click(function() {
						book.bookEmpty();
						book.bookSimplePage2('1',domesticArr[i],userid);
					});
					
				});
				$.each(data.listEbook,function(i,value){
					$('#'+ebookArr[i]).click(function() {
						book.bookEmpty();
						book.bookSimplePage2('1',ebookArr[i], userid);
					});
					
				});
				
				$.each(data.listNew,function(i,value){
					$('#'+newArr[i]).click(function() {
						book.bookEmpty(newArrName[i]);
						book.bookSimplePage2('1',newArr[i], userid);
					});
				});
				
				// 일부로 안준거.
				$.each(data.listOld,function(i,value){
					$('#'+oldArr[i]).click(function() {
						book.bookSimplePage2('1', newArr[i], userid);
					});
					
				});
				/*---------------------------다음페이지로 넘어가기.-------------------------------*/
			});
		},
		
		//----@#$%$#^$&^@%&@#^#$^#$^@#%&^^&#%^&*%^*#%^*&#&*#&*^$&*//
		
		bookSimplePage2 : function(pageNo,genreId,userid) {
			var arr= [];
			$.getJSON(context +'/book/Book_selectAll2/'+pageNo+'/'+genreId ,function(data){
				var count = data.count;
				var pageNo = data.pageNo; 
				var startPage = data.startPage;
				var groupSize = data.groupSize;
				var lastPage = data.lastPage;
				var totPage = data.totPage;
				var bookList= '<div id="bookContents2" style="width: 100%;">'
					+'<h2 style="text-align: center; padding-bottom: 20px;"><strong>책 목록</strong></h2>'
					$.each(data.list,function(index,value){
						bookList +='<div class="book1" style="width: 600px; margin: auto;">';
							bookList +='<img alt="" src="'+context+'/resources/images/'+this.bookId+'.jpg" width="106px" height="150px" align="left" >';
							bookList +='<label id="'+this.bookId+'"><strong style="padding-left : 20px; font-size:15px;">'+this.bookName+'</strong></label>';
							bookList +='<font color="white" style="color: white;">'+this.optionBook+'</font>'; 
							bookList +='<font color="white" style="color: maroon">이벤트</font>';
							bookList +='<font color="white" style="background-color: purple;">무료배송</font><br>';
							bookList +='<font color="black" style="padding-left : 30px;">'+this.writer+'</font><br />';
							bookList +='<font color="red" style="padding-left : 30px;" >'+this.bookPrice+'</font><font>원</font><font  size="2px">[10%할인!]</font>';
							bookList +='<font style="background-color: gray" class="white">회원평점</font><font color="red" >'+this.grade+'</font>';
							bookList +='<br /><br /><br /><br />';
							bookList +='<span style="padding-left: 20px;"><input type="image" src="'+context+'/resources/images/btn_bag.gif" onclick="Cart.putInCart('+'\''+userid+'\''+','+'\''+this.bookId+'\''+')"></span>';
							bookList +='<input type="image" src="'+context+'/resources/images/btn_buy.gif" onclick="Cart.putInPurchase('+'\''+userid+'\''+','+'\''+this.bookId+'\''+','+'\''+this.bookPrice+'\''+')">';
							bookList +='<br /><br /><br /><br /></div></div>';
						arr.push(this.bookId);
					});
					
			
					
				
					/*;
*/			
				//----@#$%$#^$&^@%&@#^#$^#$^@#%&^^&#%^&*%^*#%^*&#&*#&*^$&*//
					var pagination = '<div class="pagina_div" style=" text-align: center;"><TABLE id="pagination" >'
						if (startPage != 1) {
							pagination += '<a href="'+context+'/book/Book_selectAll/1" style="text-align: center;">'
							+'<IMG SRC="'+img+'/left.png">&nbsp'
							+'</a>';
						}
						if ((startPage - groupSize) > 0 ) {
							pagination +='<a href="'+context+'/book/Book_selectAll/'+(startPage-groupSize)+'" style="text-align: center;">'
							+'<IMG SRC="'+img+'/right.png">&nbsp'
							+'</a>';
						}
						
						for (var i = startPage ; i <= lastPage; i++) {
							if (i == pageNo) {
								pagination+='<font style="color:red;font-size: 20px; text-align: center;">'
								+i
								+'</font>';
							} else {
								pagination+='<label onClick="return book.bookSimplePage2('+i+',\''+genreId+'\''+')">'
								+'<font>'
								+i
								+'</font>'
								+'</label>';
							}
						}		
						if ((startPage + groupSize) <= totPage) {
							pagination += +'<a href="'+context+'/book/Book_selectAll/'+(startPage+groupSize)+'">'
						}
						pagination += '</TD>';
						pagination += '<TD WIDTH=200 ALIGN=RIGHT></div>'

						bookList+=pagination;
						bookList+='</div>';	
					
						
						//----@#$%$#^$&^@%&@#^#$^#$^@#%&^^&#%^&*%^*#%^*&#&*#&*^$&*//
				
				$('#book_section').html(bookList);
				
				$.each(data.list, function(index, value) {
					$('#'+arr[index]).click(function() {
						book.bookEmpty();
						book.mainPage(arr[index]);
				});

				});	
				
				
			});
		},
		
	mainPage : function(bookId) {
			$.getJSON(context + '/book/Book_main/'+bookId ,function(data){
				var bookPage = '<div class="contents" >'
					+'<div class="book" style="margin: auto; width:1000px;" >'
					+'<div class="col-xs-6 col-md-3 thumbnail" style="margin: auto;">'
					+'<img alt="" src="'+context+'/resources/images/'+data.bookId+'.jpg" width="200px" height="301px" align="left" >'
					+'</div></div>'
					+'<div class="book2">'
					+'<br /><p>'
					+'<font color="#00BFFF"><strong style="padding-left:30px; font-size:35px;">'+data.bookName+'</strong></font><br>'
					+'<font color="Black" size="2px" style="padding-left:30px;">'+data.writer+'지음</font><br />'
					+'<span style="padding-left:30px; font-size:10px;">평점</span> <font color="#DC143C" size="3px">'+data.grade+'</font><br />'
					+'<font color="black" size="3px" style="padding-left:30px; font">판매가 :</font>'
					+'<font color="red" size="7pk"><strong style="font-size: 20px;">'+data.bookPrice+'</strong></font>'
					+'<font color="purple" size="3px"><strong style="font-size:10px;">[10%↓ 1,500원 할인]</strong></font><br />'
					+'<span style="padding-left: 30px;"><input type="image" src="'+context+'/resources/images/btn_bag2.png" ></span>'
					+'<input type="image" src="'+context+'/resources/images/btn_buy2.png" >'
					+'<br /><br /><hr style="width: 67%;"/><br /><br />'
					+'<div class="panel panel-default" style="margin:auto; width: 84%;">'
					+'<div class="panel-heading"><strong style="color: blue;">회원리뷰</strong></div>'
					+'<div class="panel-body">'
					+'<strong style="font-size:15px; color: black;">북로그 리뷰</strong>'
					+'<span style="padding-left:5px; color: skyblue;">(0)</span><br /><br />'
					+'<strong style="padding-left:10px;">결제 후 리뷰작성 시 300원, 배송출발 후 5일 이내 작성 시 400원, 이 상품의 첫 리뷰 작성시 500원의 통합포인트를'
					+'드립니다.</strong><br />'
					+'<span style="padding-left:10px;">포인트적립은 해당 도서 배송 출발 후 익일에 적립됩니다. (외서/eBook/음반/DVD/GIFT 및 잡지 상품 제외)</span><br />'
					+'</div></div><br />'
					+'<div class="panel panel-default" style="margin:auto; width: 84%;">'
					+'<div class="panel-heading">'
					+'<h3 class="panel-title">교환/반품/품절</h3>'
					+'</div><div class="panel-body">'
					+'<strong style="padding-left:10px; font-size:12px;">교환/반품/품절안내</strong><br /><br />'
					+'<span style="padding-left:10px;">※ 상품 설명에 반품/교환 관련한 안내가 있는 경우 그 내용을 우선으로 합니다. (업체 사정에 따라 달라질 수 있습니다.)</span>'
					+'<table><tr><th>반품/교환방법</th>'
					+'<td><strong>[1:1 상담 > 반품/교환/환불] 또는 고객센터 (5555-0000)</strong><br>'
					+'※ 오픈마켓, 해외배송주문, 기프트 주문시 [1:1상담>반품/교환/환불] 또는 고객센터(5555-0000)</td></tr>'
					+'<tr><th>반품/교환가능 기간</th><td>변심반품의 경우 수령 후 7일 이내,<br>상품의 결함 및 계약내용과 다를 경우 문제점 발견 후 30일 이내</td></tr>'
					+'<tr><th>반품/교환비용</th><td>변심 혹은 구매착오로 인한 반품/교환은 반송료 고객 부담</td></tr>'
					+'<tr><th>반품/교환 불가 사유</th>'
					+'<td>· 소비자의 책임 있는 사유로 상품 등이 손실 또는 훼손된 경우<br>'
					+'<span style="padding-left:5px;">(단지 확인을 위한 포장 훼손은 제외)</span><br>'
					+'· 소비자의 사용, 포장 개봉에 의해 상품 등의 가치가 현저히 감소한 경우<br>'
					+'<span style="padding-left:5px;">예) 화장품, 식품, 가전제품(악세서리 포함) 등</span><br>'
					+'· 복제가 가능한 상품 등의 포장을 훼손한 경우<br>'
					+'<span style="padding-left:5px;">예) 음반/DVD/비디오, 소프트웨어, 만화책, 잡지, 영상 화보집</span><br>'
					+'· 소비자의 요청에 따라 개별적으로 주문 제작되는 상품의 경우 ((1)해외주문도서)<br>'
					+'· 디지털 컨텐츠인 eBook, 오디오북 등을 1회 이상 다운로드를 받았을 경우<br>'
					+'· 시간의 경과에 의해 재판매가 곤란한 정도로 가치가 현저히 감소한 경우<br>'
					+'· 전자상거래 등에서의 소비자보호에 관한 법률이 정하는 소비자 청약철회 제한 내용에<br>'
					+'<span style="padding-left:5px;">해당되는 경우</span><br><br>'
					+'1) 해외주문도서<br>'
					+'· 이용자의 요청에 의한 개인주문상품이므로 단순 변심 및 착오로 인한 취소/교환/반품 시 <br>'
					+'<span style="padding-left:10px;">해외주문 반품/취소 수수료 고객 부담 (해외주문 반품/취소 수수료는 판매정가의 20%를 적용)</span><br>'
					+'</td></tr>'
					+'<tr><th>상품 품절</th><td>· 공급사(출판사) 재고 사정에 의해 품절/지연될 수 있으며, 품절 시 관련 사항에 대해서는<br>'
					+'<span style="padding-left:10px;>이메일과 문자로 안내드리겠습니다.</span></td></tr>'
					+'<tr><th>소비자 피해보상<br>'
					+'환불지연에 따른 배상</th><td>'
					+'· 상품의 불량에 의한 교환, A/S, 환불, 품질보증 및 피해보상 등에 관한 사항은'
					+'<br><span style="padding-left:10px;>소비자분쟁해결 기준 (공정거래위원회 고시)에 준하여 처리됨</span><br>'
					+'· 대금 환불 및 환불지연에 따른 배상금 지급 조건, 절차 등은 전자상거래 등에서의'
					+'소비자 보호에 관한 법률에 따라 처리함</td></tr>'
					+'</table></div></div>'
					+'<br /><br /><br /><br />'
					+'<br /></div></div>';
				$('#book_section').html(bookPage);
				$('#book_section').css('height','1350px');
				$('table').css('width','98%');
				$('table').add('td').add('th').css('border','1px solid gray');
				$('th').css('background-color','silver').css('width','150px');
				$('th').add('td').css('padding-left','5px');
				
				$('#search').click(function() {
					book.bookEmpty();
					book.inputBookId();
					book.inputBookName();
					book.google();
				});
			});
			
		},
		

		
		
		
		
		
		//------------------------ 오늘의책  입력하기 버튼이랑 텍스트. ///관리자
		inputBookId : function() {
			$('#book_section').html('<form action="" style="text-align:center; "><input type="text" style=" border-bottom-color: blue; border-top-color:green;"  id="textInputId"> &nbsp; '
					+'<input type="button" value="오늘의 책 선정" id="btCheck"></form>'
					)
					$('#btCheck').click(function() {
						if ($("#textInputId").val() == "") {
							alert("책 아이디 값을 입력해주세요.");
							$("#textInputId").focus();
							return false;
						}
						book.searchForTodayBook2($("#textInputId").val(),"#book_section");
						
					})
		},
		//case2--- 값 넘겨서 보여주기 ////메인----------------------------------------------------------------------
		searchForTodayBook2 : function(bookId,target) {
			$.getJSON(context +'/book/Book_main/'+bookId ,function(data){
				var todayBook2= '<div id="bookTodaybook" style="color: black; width : 400px; height: 300px; border: 1px solid black;"><h2>오늘의 책</h2><br /><br /><br />'
					+'<img alt="" src="'+context+'/resources/images/'+data.bookId+'.jpg" width="106px" height="150px" align="left">'
					+'<label id="'+data.bookId+'"><strong>'+data.bookName+'</strong></label><br /><br />'
					+'<font color="maroon" size="1px">'+data.writer+'</font><br />'
					+'<font color="black" size="2px">책 내용 들어갈 자리.</font>';
					$(target).html(todayBook2);
					$('#'+data.bookId).click(function() {
						
						book.mainPage(bookId);
					});
			});
			
			
		},
		
		//책 검색 텍스트와 버튼---------------------------------------------------
		inputBookName : function(userid) {
			var finding = '<form action="" style="text-align:center;"><input type="text" style="border-color: red;" width="15px" id="textInputName" name="nameSearch"> &nbsp;'
					+'<input type="button" value="검색" id="btCheckName"></form>';
			$('#book_section').append(finding);
			
			
					$('#btCheckName').click(function name() {
						if ($("input:text[name=nameSearch]").val() == "") {
							alert("검색어를 입력해주세요.");
							$("input:text[name=nameSearch]").focus();
							return false;
						}
						$('#submain').empty();
						book.findBook('1',$("input:text[name=nameSearch]").val());
					});
		},
		
		//-case2 값 넘겨서 보여주기------------------------------------------------------------------------
		findBook : function(pageNo,searchBookName) {
			var resultSearchBook = [];
				$.getJSON(context+'/book/Book_find/'+pageNo+'/'+searchBookName ,function(data){
					var count = data.count;
					var pageNo = data.pageNo; 
					var startPage = data.startPage;
					var groupSize = data.groupSize;
					var lastPage = data.lastPage;
					var totPage = data.totPage;
					var bookName2 = data.bookName2;
					
					var findResult = '<div id="findBybookName" style="color: black; width : 400px; height: 300px;"><h2>['+searchBookName+']  으로 검색결과</h2><br /><br /><br />'
							$.each(data.list,function(index,value) {
								findResult +='<div class="findBook1">'
									+'<img alt="" src="'+context+'/resources/images/'+this.bookId+'.jpg" width="106px" height="150px" align="left">'
									+'<label id="'+this.bookId+'"><strong>'+this.bookName+'</strong></label>'
									+'<font color="white" ">'+this.optionBook+'</font>'
									+'<font color="white" class="maroon">경품</font>'
									+'<font color="white" style="background-color: purple;">검색결과 보너스</font>'
									+'<font color="gray">'+this.writer+'</font><br />'
									+'<font color="red" class="white">'+this.bookPrice+'</font><font>원</font>'
									+'<font style="background-color: gray" class="white">회원평점</font><font color="red" >'+this.grade+'</font>'
									+'<br /><br /><br /><br />'
									+'<input type="button"  value="장바구니에 담기" id="c'+index+'">'
									+'<input type="button"  value="바로구매" id="b'+index+'">'
									+'<br /><br /><br /><br /></div>';
									resultSearchBook.push(this.bookName);
							});
					findResult += '</div>';
			//-------------------------------------다음페이지------------------------------------------
			var pagination = '<div style="width : 200px; margin:auto;"><TABLE id="pagination">'
				if (startPage != 1) {
					pagination += '<a href="'+context+'/book/Book_find/1/">'
					+'<img src="'+img+'/left.png">&nbsp'
					+'</a>';
				}
				if ((startPage - groupSize) > 0 ) {
					pagination +='<a href="'+context+'/book/Book_find/'+(startPage-groupSize)+'">'
					+'<img src="'+img+'/right.png">&nbsp'
					+'</a>';
				}
				
				
				for (var i = startPage ; i <= lastPage; i++) {
					if (i == pageNo) {
						pagination+='<font style="color:orange;font-size: 20px">'
						+i
						+'</font>';
					} else {
						pagination+='<label onClick="return book.findBook('+i+','+bookName2+')">'
						+'<font>'
						+i
						+'</font>'
						+'</label>';
					}
				}		
				
				
				if ((startPage + groupSize) <= totPage) {
					pagination += +'<a href="'+context+'/book/Book_find/'+(startPage+groupSize)+'">'
				}
				pagination += '</TD>';
				pagination += '<TD WIDTH=200 ALIGN=RIGHT>'
				pagination+='</div>';
					
					
				
	//---------------------------------------------------------------------------------
				findResult+=pagination;
		
		$('#submain').html(findResult);
				});
				
		},
		//---------구글검색----------------------------------------------------------------------
		google : function() {
			var googleView = '<div align="Left"><table cellpadding="0" cellspacing="0" bgcolor="" width="300" height="40" style="padding-top:3;"><tr>'
				+'<td width="100%" height="47" align="right"><form action="http://www.google.co.kr/cse" id="cse-search-box">'
				+'<p align="right" style="line-height:100%; margin-top:0; margin-bottom:0;"><font color="blue" size="2"><b><u>G</u></b></font>'
				+'<font color="red" size="2"><b><u>o</u></b></font><font color="#FF9933" size="2"><b><u>o</u></b></font><font color="#006699" size="2"><b><u>g</u></b></font>'
				+'<font color="black" size="2"><b><u>l</u></b></font><font color="#0099FF" size="2"><b><u>e</u></b></font><b><font size="2"><u></u></font></b>'
				+'<font color="#009966" size="2"><b><u>S</u></b></font><font color="red" size="2"><b><u>e</u></b></font><font color="#0099FF" size="2"><b><u>a</u></b></font>'
				+'<font color="#6666FF" size="2"><b><u>r</u></b></font><font color="#66CCFF" size="2"><b><u>c</u></b></font><font color="#CC0000" size="2"><b><u>h</u></b></font>'
				+'<font color="white" size="2"><b><u>&nbsp;</u></b></font><font color="#CC0000" size="2"><b></b></font>'
				+'<input type="hidden" name="cx" value="partner-pub-7372605513442392:ue9vq1-a32y" /><input type="hidden" name="ie" value="UTF-8" />'
				+'<input type="text" name="q" size="31" /><b><font size="2">&nbsp;</font></b><input type="submit" name="sa" value="     &#xac80;&#xc0c9;     " />&nbsp;<br>'
				+'<script type="text/javascript" src="http://www.google.co.kr/cse/brand?form=cse-search-box&amp;lang=ko"></script><font color="#0033CC" '
				+'size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><script type="text/javascript" src="http://www.google.co.kr/cse/brand?form=cse-search-box&amp;lang=ko"></script>'
				+'</form></td></tr></table></div>'
				$('.mainView').append(googleView);
		},
		
		
		
		// 비우기.
		bookEmpty : function() {
			$('#book_section').appendTo($('#book_section').empty());
		}
		
		
}