<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<select id="start_year" name="start_year">
    <option value="2016" >2016</option>
    <option value="2015" >2015</option>
    <option value="2014" >2014</option>
</select>
<select id="start_month" name="start_month">
    <option value="01" >1</option>
    <option value="02" >2</option>
    <option value="03" >3</option>
    <option value="04" >4</option>
    <option value="05" >5</option>
    <option value="06" >6</option>
    <option value="07" >7</option>
    <option value="08" >8</option>
    <option value="09" >9</option>
    <option value="10" >10</option>
    <option value="11" >11</option>
    <option value="12" >12</option>
</select> 

<select id="start_day" name="start_day">
</select>~

<select id="end_year" name="end_year">
    <option value="2016" >2016</option>
    <option value="2015" >2015</option>
    <option value="2014" >2014</option>
</select>
<select id="end_month" name="end_month">
    <option value="01" >1</option>
    <option value="02" >2</option>
    <option value="03" >3</option>
    <option value="04" >4</option>
    <option value="05" >5</option>
    <option value="06" >6</option>
    <option value="07" >7</option>
    <option value="08" >8</option>
    <option value="09" >9</option>
    <option value="10" >10</option>
    <option value="11" >11</option>
    <option value="12" >12</option>
</select>

<select id="end_day" name="end_day">
</select>
 
<input type="button" id="day_confirm" value="확인"/>


<script>
$(function() {
	var sDay=1;
	var eDay=31;
	var strDay="";
	
	for(var i=sDay; i<=eDay; i++)
	{
		strDay +="<option value="+i+">"+i+"</option>";
	}
	
	var sDay2=1;
	var eDay2=31;
	var strDay2="";
	
	for(var i=sDay2; i<=eDay2; i++)
	{
		strDay2 +="<option value="+i+">"+i+"</option>";
	}
	
	$("#start_day").html(strDay); 
	$("#end_day").html(strDay2); 
	
		$('#day_confirm').click(function() {
		//선택된 값을 가져온다.
		var startYear = $("#start_year option:selected").val();
		var startMonth = $("#start_month option:selected").val();
		var startDay = $("#start_day option:selected").val();
		var endYear = $("#end_year option:selected").val();
		var endMonth = $("#end_month option:selected").val();
		var endDay = $("#end_day option:selected").val();
		
		if (startDay<10) {
			startDay = "0"+startDay
		}
		if (endDay<10) {
			endDay = "0"+endDay
		}

		var finalStart = startYear+startMonth+startDay
		var finalEnd = endYear+endMonth+endDay
		
		if (Number(finalStart) > Number(finalEnd) ) {
			alert("시작 날짜와 종료 날짜를 확인해주세요");
		}

		/* document.getElementById("start_year").innerHTML = strYear */

		AdminPurchase.list(finalStart, finalEnd );

	});
});

	var AdminPurchase = {
			list : function(finalStart, finalEnd) {
				$.ajax(context+'/account/day/'+finalStart+'/'+finalEnd,{
					data : {
						
					},
					dataType : 'json',
					success : function(data) {
						alert('검색 결과 성공');
					},
					error : function(xhr, status, msg) {
						alert('에러발생상태 : '+status +', 내용 :'+msg);
					}
				});				
			}
	};


</script>











