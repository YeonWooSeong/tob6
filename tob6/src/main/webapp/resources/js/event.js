 

var Event = {
      event : function(userid) {
         $('#event_section').html('<div class="big"><h2 style="color: white; padding-top:10; float : left;">EVENT</h2>'
          +'<div class="sm_2_3"  style="margin-top: 25px; margin-left : 15px; float : left;"><input type="text" name="nameSearch"><input type="button" value="검색" id="search"></div></div>');
      alert("이벤트의 이벤트 진입 넘어온 유저아이디 "+userid);

         $('#search').click(function name() {
            if ($("input:text[name=nameSearch]").val() == "") {
               alert("이벤트 검색어를 입력해주세요.");
               $("input:text[name=nameSearch]").focus();
               return false;
            }
            $('#event_submain').empty();
            Event.findEvent('1',$("input:text[name=nameSearch]").val());
         });
         
         
            Event.ranking('1',userid);
            $('#event_submain').css('background-image', '${startimages}/team/tema.png');
         
      },
  ranking : function(pageNo,userid) {
     var arr = [];
    alert("이벤트의 랭킹 진입  "+userid);
     $.getJSON (context +'/event/Event_selectAll/'+pageNo,function (data){
         var count = data.count;
      var pageNo = data.pageNo; 
      var startPage = data.startPage;
      var groupSize = data.groupSize;
      var lastPage = data.lastPage;
      var totPage = data.totPage;
      
            var rank = '<div style="height: 550px; margin-left: 70px;">'
           $.each (data.list, function(index,value) {
           rank += '<div id="pakage" class="img" style="float : left; margin : 40px;">'
           +'<img src="'+context+'/resources/images/'+this.profile+'" alt="'+this.profile+'" width="150" height="100">'
           +'<div id="text_Body" class="desc"><br /><label class="highlight" id="'+this.evtId+'" style="width:130px;">'+this.evtName+'</label>'
           +'<br /><br />'+this.fromDt +'~' +this.toDt+'</div></div>';
                arr.push (this.evtId);
           });
        
           rank += '</div>';
          var pagination = '<div style=" width: 150px; margin:auto;"><TABLE id="pagination">'
            if (startPage != 1) {
               pagination += '<a href="'+context+'/event/Event_selectAll/1">'
               +'<IMG SRC="'+img+'/btn_bf_block.gif">&nbsp;'
               +'</a>';
            }
            if ((startPage - groupSize) > 0 ) {
               pagination +='<a href="'+context+'/event/Event_selectAll/'+(startPage-groupSize)+'">'
               +'<IMG SRC="'+img+'/btn_bf_page.gif">&nbsp;'
               +'</a>';
            }
            for (var i = startPage ; i <= lastPage; i++) {
               if (i == pageNo) {
                  pagination+='<font style="color:red;font-size: 20px">'
                  +i
                  +'</font>';
               } else {
                  pagination+='<label onClick="return Event.ranking('+i+')">'
                  +'<font>'
                  +i
                  +'</font>'
                  +'</label>';
               }
            }
            
            if ((startPage + groupSize) <= totPage) {
               pagination += +'<a href="'+context+'/event/Event_selectAll/'+(startPage+groupSize)+'">'
            }
            pagination += '</TD>'
            pagination += '<TD WIDTH=200 ALIGN=RIGHT></div>';
            
            rank += pagination;

            $('#event_submain').html(rank);
            
            $.each(data.list, function(index,value) {
               
                   $('#'+ arr[index]).click( function() {
                       alert("이벤트 댓글달기로 이동1");
                        Event.eventPage(arr[index],userid,pageNo);

            });

               
            });
            
            
     });
},
   eventPage : function(evtId,userid,pageNo) {
	   alert("이벤트페이지 진입 "+userid);
      $.getJSON(context +'/reply/list/'+evtId+'/'+pageNo,function(data){
    	   var count = data.count;
	          var pageNo = data.pageNo; 
	          var startPage = data.startPage;
	          var groupSize = data.groupSize;
	          var lastPage = data.lastPage;
	          var totPage = data.totPage;
    	  
         var eventPage = '<div class="contents" id="eventPage">'
            +'<div class="event" style="margin-left :175px;  margin-bottom:2%;">'
            +'<img alt="" src="'+context+'/resources/images/skill.jpg">'
            +'<div style="margin-top:35px;">'
         	+'<label for="reply" style="display:block;">댓글</label>'
            +'<textarea name="reply" cols="82" rows="20" style="width:70%; height :80px; color:black;" placeholder="로그인 후 댓글을 입력하세요"></textarea>'
            +'<button id="reply_btn" class="btn btn-primary btn-lg center-block" style="margin-right: 190px; margin-top: 10px;float:right;">입력</button></div>'
            +'</div>';
        
         var baseComments = '<div id="reply_area" style="padding-top:50px;">'
         	 $.each(data.list, function(index, value) {
         	 baseComments += '<div name="reply" style="background: #FFFFFF; width: 60%; padding: 25px; margin: auto;margin-bottom: 20px; margin-right: 290px; text-align: left; border-radius: 20px; box-shadow: none;display: block;z-index: 5;">'
             +'<input type="text" style="width:35px; margin-left:20px; float:left; border: 0;" readonly="readonly" value="'+this.writer+'"/>'
 			 +'<div id="regDate" style="margin-left:10px; float:left;">'+this.regDate+'</div><br />'
 			 +'<img id="delete" alt="" src="'+context+'/resources/images/drop.png" onclick=Event.deleteReply('+'\''+this.writer+'\''+'); style="float:right; margin-left:10px;">'
 			 +'<img id="update" alt="" src="'+context+'/resources/images/update.png" onclick=Event.updateReply(); style="float:right;">'
 			 +'<input type="hidden" name="replyNum" value="'+this.replySeq+'"/>'
 			 +'<input type="hidden" id="session_User" style="margin-left:20px; float:left; background:none;" value="'+userid+'"/>'
 			 +'<div>'+this.comment+'</div>'
 			 +'</div>';
         	 });
         	baseComments +='</div>';
         
         	
         	
         
         	$('#event_section').empty();
	        $('#event_section').html(eventPage);
	        $('#event_submain').empty();
	        $('#event_submain').html(baseComments); 
	                
	                
	                
            
            $("#reply_btn").click(function() {
            	   alert('유저아이디는'+userid);
            	   var comments = '<div id="reply_area" style="padding-top:50px;">';
                   if(userid == ""){
                       alert("댓글을 달려면 로그인을 해주세요");
                   }else{
                       $.ajax(context+"/reply/write",{
                            data : {
                                   "writer" : userid,
                                   "comment" : $("textarea[name=reply]").val(),
                             },
                            success : function(data) {
                            	alert('댓글입력성공');
                              	 $.each(data.list, function(index, value) {
                              	 comments += '<div name="reply" style="background: #FFFFFF; width: 60%; padding: 25px; margin: auto;margin-bottom: 20px; margin-right: 290px; text-align: left; border-radius: 20px; box-shadow: none;display: block;z-index: 5;">'
                                 +'<input type="text" style="width:35px; margin-left:20px; float:left; border: 0;" readonly="readonly" value="'+this.writer+'"/>'
                      			 +'<div id="regDate" style="margin-left:10px; float:left;">'+this.regDate+'</div><br />'
                      			 +'<img id="delete" alt="" src="'+context+'/resources/images/1.png" onclick=Event.deleteReply('+'\''+this.writer+'\''+'); style="float:right; margin-left:10px;">'
                    			 +'<img id="update" alt="" src="'+context+'/resources/images/3.png" onclick=Event.updateReply(); style="float:right;">'
                    			 +'<input type="hidden" value="'+this.replySeq+'"/>'
                    			 +'<input type="hidden" id="session_User" style="margin-left:20px; float:left; background:none;" value="'+userid+'"/>'
                      			 +'<div>'+this.comment+'</div>'
                      			 +'</div>';
                              	 });
                              	comments +='</div>';
                              	$('#event_submain').empty();
                              	$('#event_submain').html(comments);
                              	
                             },
                             
                            error : function() {
                             }
                        });
                   }
                   
             });
            
            
      });
   },
   
	   deleteReply : function(writeUser) {
		alert("삭제버튼 클릭");
		var sessionUser = $("#session_User").val();
		alert("글을 작성한 아이디는 " + writeUser);
		alert("글을 삭제하려는 아이디는" + sessionUser);
		
		if (writeUser != sessionUser) {
			alert("작성자만 글을 삭제 할 수 있습니다.");
		} else {
			$.ajax(context + '/reply/delete', {
				data : {
					replySeq : $("input[name=replyNum]").val()
					
				},
				success : function(data) {
					alert('이벤트가 삭제되었습니다');
					Event.eventPage(data.comments);
				},
				error : function(xhr, status, msg) {
					alert('에러발생상태 : ' + status + ', 내용 :' + msg);
				}
			});
		}
		   
	},
   
   
   
     findEvent : function(pageNo,searchEventName) {
          var resultSearchEvent = [];
         $.getJSON(context+'/event/Event_find/'+pageNo+'/'+searchEventName,function(data){
            var count = data.count;
            var pageNo = data.pageNo; 
            var startPage = data.startPage;
            var groupSize = data.groupSize;
            var lastPage = data.lastPage;
            var totPage = data.totPage;
            
            var findRe = '<div style="height: 550px; margin-left: 70px;"><h2 style="font-size: 30px; margin-top: 25px;">['+searchEventName+']  으로 검색결과</h2><br /><br /><br />'
               $.each(data.list, function(index,value) {
                  findRe += '<div id="pakage" class="img" style="float : left; margin : 40px;">'
                        +'<img alt="" src="'+context+'/resources/images/'+this.profile+'" width="150px" height="100px">'
                        +'<div id="text_Body" class="desc"><br /><label class="highlight" id="'+this.evtId+'">'+this.evtName+'</label>'
                          +'<br /><br />'+this.fromDt +'~' +this.toDt+'</div></div>';
                        resultSearchEvent.push(this.evtName);
               });
            	findRe += '</div>';
            var pagination = '<div style="width : 150px; margin:auto;"><TABLE id="pagination">'
               if (startPage != 1) {
                  pagination += '<a href="'+context+'/event/Event_find/1/">'
                  +'<img src="'+img+'/left.png">&nbsp'
                  +'</a>';
               }
               if ((startPage - groupSize) > 0 ) {
                  pagination +='<a href="'+context+'/event/Event_find/'+(startPage-groupSize)+'">'
                  +'<img src="'+img+'/right.png">&nbsp'
                  +'</a>';
               }
               
               
               for (var i = startPage ; i <= lastPage; i++) {
                  if (i == pageNo) {
                     +i
                     +'</font>';
                  } else {
                     pagination+='<label onClick="return Event.findEvent('+i+',\''+searchEventName+'\''+')">'
                     +'<font>'
                     +i
                     +'</font>'
                     +'</label>';
                  }
               }      
               
               
               if ((startPage + groupSize) <= totPage) {
                  pagination += +'<a href="'+context+'/event/Event_find/'+(startPage+groupSize)+'">'
               }
               pagination += '</TD>';
               pagination += '<TD WIDTH=200 ALIGN=RIGHT>'
               pagination+='</div>';
               
               
               findRe+=pagination;
               
               $('#event_submain').html(findRe);
               
           
                     });
                     
               },

   
   
};