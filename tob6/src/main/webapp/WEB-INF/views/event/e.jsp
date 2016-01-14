<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
var AdminEvent = {
           detail : function(evtId ) {
                $ .getJSON (context +'/admin/event_profile/' +evtId , function(data) {
                     $('<form action ="${context}/admin/event_update" id="eventFrm" method="post">').appendTo($ ('.mainView').empty());
                 var table = '<div class="panel panel-default" style="width: 25%; margin: auto;">'
     			  +'<div class="panel-heading" style="width: 100%;">'
    			 +'<div style="color: #7fb3b3; font-size: 20px; font-family: 굴림; font-weight:bold; margin-left: 120px;" >'
    			 +'이벤트 정보 수정</div></div>'
    		     +'<table class="table" style="width:100%;">'
                 + '<tr><td>이벤트아이디</td><td id="data_evtId">'+data.evtId+'</td></tr>'
                 + '<tr><td>이벤트이름</td><td><input type="text" id="evtName" name="evtName" value="'+data.evtName+'"></td></tr>'
                 + '<tr><td>이벤트기간</td><td><input type="text" id="fromDt" name="fromDt" value="'+data.fromDt+'"></td></tr>'
                 + '<tr><td>이벤트기간</td><td><input type="text" id="toDt" name="toDt" value="'+data.toDt+'"></td></tr>'
                 + '<tr><td>이벤트기간</td><td id="data_profile">'+data.profilet+'</td></tr>'
                 + '<td colspan="2"><button id="confirm" style="width:100px; margin-left: 150px;">정보수정</button></td></tr>'
                 + '</table>';
                 $ ('eventFrm' ).html( table) ;
                     
                       $ ('#confirm' ).click( function() {
                                
                                $ ('#eventFrm' ).submit( function(e) {
                                     e .preventDefault ();
                                     
                                      var postData = new FormData($('#eventFrm')[0]) ;
                                     $ .ajax ('${context}/admin/event_update' ,{
                                           type : 'post',
                                           data : postData ,
                                           async : true,
                                           dataType : 'json',
                                           mimeType : 'multipart/form-data',
                                           contentType : false,
                                           processData : false,
                                           success : function(data ) {
                                                 var table = '<div class="panel panel-default" style="width: 25%; margin: auto;">'
                                        			  +'<div class="panel-heading" style="width: 100%;">'
                                         			  +'<div style="color: #7fb3b3; font-size: 20px; font-family: 굴림; font-weight:bold; margin-left: 120px;" >'
                                         			  +'수정 결과</div></div>'
                                         		      +'<table class="table" style="width:100%;">'
                                                      + '<tr><td>이벤트아이디</td><td id="data_evtId">'+data.evtId+ '</td></tr>'
                                                      + '<tr><td>이벤트이름</td><td id="data_evtName">'+data.evtName+ '</td></tr>'
                                                      + '<tr><td>이벤트기간</td><td id="data_fromDt">'+data.fromDt+'</td></tr>'
                                                      + '<tr><td>이벤트기간</td><td id="data_toDt">'+data.toDt+'</td></tr>'
                                                      + '<tr><td>이벤트기간</td><td id="data_fromDt">'+data.fromDt+'</td></tr>'
                                                      + '<td colspan="2"><button id="confrm" style="width:100px; margin-left: 150px;">확인</button></td></tr>'
                                                      + '</table>';
                                                 $('.mainView').html(table);
                                                
                                                     $ ('#confirm' ).click(function() {
                                                     AdminEventList.list ('1' );
                                                            });
                                                
                                            },
                                           error : function(xhr, status, msg) {
                                                alert ('에러발생상태 : ' +status +', 내용 :' +msg );
                                                
                                            }
                                           
                                      });
                                 });
                       });
                 });
            },
           
           remove : function(evtId ) {
                $ .ajax ('${context}/admin/event_delete/'+evtId ,{
                     data : {
                           evtId : evtId
                      },
                     dataType : 'json',
                     success : function(data ) {
                           alert ('이벤트가 삭제되었습니다');
                           AdminEventList .list ('1');
                      },
                     error : function(xhr, status , msg ) {
                           alert ('에러발생상태 : ' +status +', 내용 :'+msg);
                      }
                 });
            }
};
</script>