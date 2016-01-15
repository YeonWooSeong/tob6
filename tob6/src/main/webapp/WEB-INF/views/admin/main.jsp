<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=53e2827500534f733c75dadaccfdbaa2"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>

<div style="width: 100%; height: 800px;">
<!-- =============== 일주일 판매 차트 ============== -->
<div id="curve_chart" style="width: 45%; height: 65%; margin-left: 5%; float: left; "></div >
<div id="container" style="width: 45%; height: 65%; margin-right: 5%; float: right; "></div>

<!-- =============== 파이차트 =============== -->
<div id="piechart" style="width: 50%; height: 70%; float: right; ">
</div>

<!-- =============== 지점 소개 ============== -->
<div style="width: 45%; height: 55%; margin-left: 2%; margin-top:2%; float: left;">

<div style="width:100%; height:50%; float: left;">
   <div id="map" style="width:50%; height:100%; float: left; border : 1px solid black;"></div>
   <p style="float: left; margin-left:10px; font-family:Verdana; font-size:25px;">강남점</p>
   <p style="float: left; margin-left:10px; margin-top: 10px;">서울 강남구 역삼동 819-4 글로벌 YOO 빌딩 3층</p>
   <label id="btn_gangnam"><img style="margin-left: 5%; margin-top: 5%;"src="${img}/admin/home_go.png"/></label>
</div>

<div style="width:100%; height:50%; float: right;margin-top: 0px; ">
   <div id="map2" style="width:50%; height:100%; float: right; border : 1px solid black;"></div>
   <p style="float: right; margin-right: 5%; margin-top: 10px; font-family:Verdana; font-size:25px;">신촌점</p>
   <p style="float: right; margin-right: 5%;">서울 마포구 신수동 63-14 구프라자 3층 </p>
   <p style="float: right; margin-right: 5%;">업무문의 02.707.0491~4 </p>
   <label id="btn_sc"><img style="margin-top: 5%; margin-left: 50%;" src="${img}/admin/home_go.png"/></label>   
</div>
</div>

</div>


<script type="text/javascript">

$(function() {
   $('#btn_sc').click(function() {
      window.open("http://hanbitsc.com");
   });
   $('#btn_gangnam').click(function() {
      window.open("http://hanbitgn.com");
   });
   
   
    lineChartFactor();
    pieChart.Factor();
   google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawLineChart);
    var chart =  new Highcharts.Chart({   
        chart: {
            type: 'column',
            renderTo :  'container'
        },
        title: {
            text: '일주일 판매량'
        },
        subtitle: {
            text: 'Source: 한빛 문고'
        },
        xAxis: {
            categories: [
                lineMonth[6]+'월'+lineDay[6]+'일',
                lineMonth[5]+'월'+lineDay[5]+'일',
                lineMonth[4]+'월'+lineDay[4]+'일',
                lineMonth[3]+'월'+lineDay[3]+'일',
                lineMonth[2]+'월'+lineDay[2]+'일',
                lineMonth[1]+'월'+lineDay[1]+'일',
                lineMonth[0]+'월'+lineDay[0]+'일'
            ],
            crosshair: true
        },
      
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        /* ========== 하이차트 링크 제거 =========== */
        credits: {
            enabled: false
        },
        
        series: [{
            name: '판매량',
            data: [ lineFactor[6], lineFactor[5], lineFactor[4], 
                    lineFactor[3], lineFactor[2], lineFactor[1], lineFactor[0]]

        }]
    }); 
});

var lineFactor = [];
var lineYear = [];
var lineMonth = [];
var lineDay = [];

var lineChartFactor = function() {
   var today = new Date();
   var dd = today.getDate();
   var mm = today.getMonth()+1; //January is 0!
   var yyyy = today.getFullYear();
   if(dd<10) {
       dd='0'+dd
   }
   if(mm<10) {
       mm='0'+mm
   }
   today = yyyy+mm+dd;

   for (var i = today; i > 20160106; i--) {
      $.ajax(context + "/account/chart_line",{
              data : {
                 "key" : i
              },
              async : false,
              success : function(data) {
                lineFactor.push(parseInt(data.sum));
                lineYear.push(data.year);
                lineMonth.push(data.month);
                lineDay.push(data.day);
             },
             error : function() {
             }
            });
   }
};


/* ============== 차트1 물결 ============  */
 
function drawLineChart() {
    var data = google.visualization.arrayToDataTable([
      ['날짜',    '날짜별 판매금액'],
      [lineMonth[6]+'월'+lineDay[6]+'일',  lineFactor[6]],
      [lineMonth[5]+'월'+lineDay[5]+'일',  lineFactor[5]],
      [lineMonth[4]+'월'+lineDay[4]+'일',  lineFactor[4]],
      [lineMonth[3]+'월'+lineDay[3]+'일',  lineFactor[3]],
      [lineMonth[2]+'월'+lineDay[2]+'일',  lineFactor[2]],
      [lineMonth[1]+'월'+lineDay[1]+'일',  lineFactor[1]],
      [lineMonth[0]+'월'+lineDay[0]+'일',  lineFactor[0]]
            
    ]);

    var options = {
      curveType: 'function',
      legend: { position: 'bottom' },
      width : '100%',
      height : '500'
    };

    var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

    chart.draw(data, options); 
};


/* ============== 차트 3 파이 ============= */
var cartoon = 0;
var adult = 0;
var child = 0;

var pieChart = {
      Factor : function() {
            $.getJSON(context + "/account/ratio", function(data) {
               adult = data.adult;
               cartoon = data.cartoon;
               child = data.child;
               });
         }   
      };
      
google.load("visualization", "1", {packages:["corechart"]});
google.setOnLoadCallback(drawChart);
function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['장르',   '판매량'],
          ['성인',    adult],
          ['만화',  cartoon],
          ['아동',    child]
        ]);

        var options = {
          title: '장르별 판매비율'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
        
      }; 
   
/* ================ 맵1 ==================== */

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new daum.maps.LatLng(37.499491, 127.029254), // 지도의 중심좌표
    level: 4 // 지도의 확대 레벨
};

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커가 표시될 위치입니다 
var markerPosition  = new daum.maps.LatLng(37.499491, 127.029254); 

//마커를 생성합니다
var marker = new daum.maps.Marker({
position: markerPosition
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);


var mapContainer = document.getElementById('map2'), // 지도를 표시할 div 
mapOption = { 
    center: new daum.maps.LatLng(37.5524589, 126.93782620000002), // 지도의 중심좌표
    level: 4 // 지도의 확대 레벨
};

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커가 표시될 위치입니다 
var markerPosition  = new daum.maps.LatLng(37.5524589, 126.93782620000002); 

//마커를 생성합니다
var marker = new daum.maps.Marker({
position: markerPosition
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);



  
</script>



