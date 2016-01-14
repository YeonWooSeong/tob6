<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="pur_wrap">
</div>
<script type="text/javascript">
	$(function() {
		Purchase.list(context);
		alert('구매 자동 함수 입력먹음');
		$('#pur_wrap').css({
			"padding-left" : "25px",
			'margin-left' : '100px',
			'border-collapse' : 'collapse',
			'width' : '950px',
			'min-height': '500px'
		});
	});
	
</script>