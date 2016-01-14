var Event = {
      event : function() {
         $('#event_section').html('<div class="big"><div class="big_1"><div class="cate">'
               +'<div class="cate_1"><a class="highlight" href= "css_syntax.asp"><br>이벤트 </a></div>'
               +'<div class="cate_2"><a class="highlight" href= "css_syntax.asp"><br>국내도서 </a></div>'
               +'<div class="cate_3"><a class="highlight" href= "css_syntax.asp"><br>외국도서 </a></div>'
               +'<div class="cate_4"><a class="highlight" href= "css_syntax.asp"><br>eBook </a></div>'
               +'<div class="cate_5"><a class="highlight" href= "css_syntax.asp"><br>문화 이벤트 </a></div>'
               +'<div class="cate_6"><a class="highlight" href= "css_syntax.asp"><br>당첨자 발표 </a></div>'
               +'<div class="cate_7"><a class="highlight" href= "css_syntax.asp"><br>지난 이벤트 </a></div></div>'
               +'<div class="sea"><div class="sea_1"><div class="sm_1 auto" ><h1>추천이벤트</h1><ol><li></li><li></li><li></li></ol></div></div>'
               +'<div class="sea_2"><div class="sm_2 auto"><div class="sm_2_1"><form action="">'
               +'<input type="checkbox" name="book" value="전체" checked>전체  '
               +'<input type="checkbox" name="book" value="국내도서">국내도서 <input type="checkbox" name="book" value="외국도서">외국도서'
               +'<input type="checkbox" name="book" value="eBook">eBook <input type="checkbox" name="book" value="문화 이벤트">문화 이벤트 </form></div>'
               +'<div class="sm_2_2"><form action="action_page.php"><input type="radio" name="promotion" value="전체" checked>전체 '
               +'<input type="radio" name="promotion" value="경품/할인">경품/할인 <input type="radio" name="promotion" value="1+1">1+1 </form></div>'
               +'<div class="sm_2_3"><form action="">이벤트 검색:<input type="text" style="color : black" name="nameSearch"><input type="button" value="검색" id="search"></form></div></div></div></div></div></div></div>');
      

         $('#search').click(function name() {
            if ($("input:text[name=nameSearch]").val() == "") {
               alert("이벤트 검색어를 입력해주세요.");
               $("input:text[name=nameSearch]").focus();
               return false;
            }
            $('#event_submain').empty();
            Event.findEvent('1',$("input:text[name=nameSearch]").val());
         });
         
         
            Event.ranking('1');
            $('#event_submain').css('background-image', '${startimages}/team/tema.png');
         
      },
  ranking : function(pageNo) {
     var arr = [];
    
     $.getJSON (context +'/event/Event_selectAll/'+pageNo,function (data){
         var count = data.count;
      var pageNo = data.pageNo; 
      var startPage = data.startPage;
      var groupSize = data.groupSize;
      var lastPage = data.lastPage;
      var totPage = data.totPage;
      
            var rank = '<div id="test"><h2 style="color: white; padding-top:10;">이벤트</h2></div><div style="height: 550px">'
           $.each (data.list, function(index,value) {
           rank += '<div class="img">'
           +'<img src="'+context+'/resources/images/'+this.profile+'" alt="'+this.profile+'" width="150" height="100"></a>'
           +'<div class="desc"><br /><label class="highlight" id="'+this.evtId+'">'+this.evtName+'</label>'
           +'<br /><br />'+this.fromDt +'~' +this.toDt+'</div></div>';
                arr.push (this.evtId);
           });
        
           rank += '</div>';
          var pagination = '<div style="width : 200px; margin:auto;"><TABLE id="pagination">'
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
                       alert("이벤트 댓글달기로 이동");
                        Event.eventPage(arr[index]);

            });

               
            });
            
            
     });
},
   eventPage : function(evtId) {
      $.getJSON(context +'/event/Event_main/'+evtId,function(data){
         var eventPage = '<div class="contents">'
            +'<div class="event" style="margin:auto">'
            +'<img alt="" src="'+context+'/resources/images/skill.jpg">'
            +'<div style="margin-left:8%">'
            +'<label for="reply" style="display:block;">댓글</label>'
            +'<textarea name="reply" cols="82" rows="20" style="width:60%; height:10%; color:black;" placeholder="로그인 후 댓글을 입력하세요"></textarea></div>'
            +'<div><button id="reply_btn" class="btn btn-primary btn-lg center-block" style="margin-left:35%; margin-right:20px; float:left;">입력</button>'
            +'<button id="read_btn" class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true" style="margin-left:0;">입력</button>'
            +'</div><div id="reply_area" style="padding-top:10px;"></div>'
            +'</div>';
            $('#event_section').html(eventPage);
            $ ("#reply_btn").click(function() {
                   if($(".navbar-right a").text() === "로그인"){
                       alert("댓글을 달려면 로그인을 해주세요");
                   }else{
                       $.ajax(context+"/reply/Reply",{
                            data : {
                                   "writer" : $(".navbar-right a").text(),
                                   "comment" : $("#readModal textarea[name=reply]").val(),
                                   "regDate" : $(),
                                   "thumnail" : $
                             },
                            success : function() {
                                 $ ("#reply_area").append("<p style='border:solid; position:relative;'>" + $(".navbar-right a").text() + " | " +$("textarea[name=reply]").val () + "<button id='remove_reply"+ (index++ ) +"'style='position:absolute; right:0; top:0; border:none; color:black; background:white;'>지우기</button></p>");
                                   // 댓글지우기 //
                                  $ ("#remove_reply" + (index-1)).click(function() {
                                       $ ("#" + this.id).parent().remove() ;
                                   });   
                             },
                            error : function() {
                                  
                             }
                        });
                   }
             });
            
            
      });
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
            
            var findRe = '<div id="findByEventName" style="color: black; width : 400px; height: 300px;"><h2>['+searchEventName+']  으로 검색결과</h2><br /><br /><br />'
               $.each(data.list, function(index,value) {
                  findRe += '<div class="img">'
                        +'<img alt="" src="'+context+'/resources/images/'+this.profile+'" width="106px" height="150px" align="left">'
                        +'<div class="desc"><br /><label class="highlight" id="'+this.evtId+'">'+this.evtName+'</label>'
                          +'<br /><br />'+this.fromDt +'~' +this.toDt+'</div></div>';
                        resultSearchEvent.push(this.evtName);
               });
            
            var pagination = '<div style="width : 200px; margin:auto;"><TABLE id="pagination">'
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
                     pagination+='<font style="color:orange;font-size: 20px">'
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

