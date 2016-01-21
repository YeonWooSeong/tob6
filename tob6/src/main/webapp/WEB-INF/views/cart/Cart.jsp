<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
카트페이지 진입.
<section id="cart_wrap">

</section>

<script type="text/javascript">
	$(function() {
		Cart.list('${user.userid}');
	});
</script>