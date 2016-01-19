var Event = {
      event : function() {
         
         $('#event_section').html('<div class="big" style="width: 1200px; margin-left:50px; height: 400px;">'
               +'<div class="sea_1" style="width:650px; border : 1px solid wihte; margin-left: 40px">'
               +'<div class="sm_1" ><h1 style="color: white;">추천이벤트</h1>'
               +'<ol><li style="color: white;" ></li>'
               +'<li style="color: white;"></li><li style="color: white;"></li></ol></div></div>'
               +'<div class="sea_2" style="margin-top:10px; color:white;"><div class="sm_2"><div class="sm_2_1">'
               +'<form action="" style="margin-left: 30px; margin-top: 5px;">'
               +'<input type="checkbox" name="book" value="전체" checked>전체  '
               +'<input type="checkbox" name="book" value="국내도서">국내도서'
               +'<input type="checkbox" name="book" value="외국도서">외국도서'
               +'<input type="checkbox" name="book" value="eBook">eBook'
               +'<input type="checkbox" name="book" value="문화 이벤트">문화 이벤트 </form></div>'
               +'<div class="sm_2_2">'
               +'<form action="action_page.php" style="margin-left: 30px; color: white;">'
               +'<input type="radio" name="promotion" value="전체" checked>전체 '
               +'<input type="radio" name="promotion" value="경품/할인">경품/할인 '
               +'<input type="radio" name="promotion" value="1+1">1+1 </form></div>'
               +'<div class="sm_2_3"><form action="" style="margin-left: 30px; color: white;">이벤트 검색:'
               +'<input type="text" style="color: black; margin-left:5px;" name="nameSearch">'
               +'<input type="button" style="color: black;" value="검색" id="search"></form>'
               +'</div></div></div></div>');
      

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
                        Event.eventPage(arr[index]);

            });

               
            });
            
            
     });
},
   eventPage : function(evtId) {
      $.getJSON(context +'/event/Event_main/'+evtId,function(data){
         var eventPage = '<div class="contents">'
            +'<div class="event" style="margin-left :175px;  margin-bottom:2%;">'
            +'<img alt="" src="'+context+'/resources/images/skill.jpg">'
            +'<div style="margin-top:35px;">'
            +'<label for="reply" style="display:block;">댓글</label>'
            +'<textarea name="reply" cols="82" rows="20" style="width:70%; height :80px; color:black;" placeholder="로그인 후 댓글을 입력하세요"></textarea></div>'
            +'<div><button id="reply_btn" class="btn btn-primary btn-lg center-block" style="margin-left:35%; margin-right:20px; float:left;">입력</button>'
            +'</div><div id="reply_area" style="padding-top:10px;"></div>'
            +'</div>';
            $('#event_section').html(eventPage);
            $('#event_submain').empty();
            $ ("#reply_btn").click(function() {
                   if("${user.id}" != null){
                       alert("댓글을 달려면 로그인을 해주세요");
                   }else{
                       $.ajax(context+"/reply/Reply",{
                            data : {
                                   "writer" : $(".navbar-right a").text(),
                                   "comment" : $("#readModal textarea[name=reply]").val(),
                                   "regDate" : $(),
                                   "thumnail" :$
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

