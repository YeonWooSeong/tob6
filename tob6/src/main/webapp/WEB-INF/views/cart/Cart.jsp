<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="cart_wrap">

</div>
<div id="Shop_Basket" style="height:100%">
	<form action="" name="frm0" id="frm0" method="get" >

	 <table id="tab_title" style="height: 100%">
	  <tbody>
	   <tr>
		<td colspan="2">
		 <table style="width: 866; float: center; border: 0; cellspaxing : 0; cellpadding : 0;">
		  <tbody>
		   <tr>
			<td colspan="2">
			 <table style="width: 866; float: center; border: 0; cellspaxing : 0; cellpadding : 0;">
			  <tbody>
			   <tr>
				<td align="left">
				 <h3 class="title_middle_black">
				  <span class="title_middle_blue">TOB</span>
				  배송 상품 장바구니
				 </h3>
				</td>
				<td align="right">
				 <div>
				  <input type="submit" class="btn_samll" onclick="if(!confirm('선택한 상품을 정말 삭제하시겠습니까?')) {return false;}" value="선택상품삭제" />
				 </div>
				</td>
			  </tr>
		     </tbody>
		    </table>
		   </td>
		  </tr>
	     </tbody>
	    </table>
	   </td>
	  </tr>
     </tbody>
    </table>
    <table width=866; align="center" cellspacing="0" cellpadding="0" border="1px solid silver" >
     <tbody>
      <tr>
       <th width="100" height="29" align="center"></th>
       <th height="29" align="center">상품명</th>
       <th width="150" height="29" align="center">가격</th>
       <th width="150" height="29" align="center">수량</th>
       <th width="150" height="29" align="center">보관/삭제
        <input type="checkbox" name="AllSelect" onclick="javascript:revcheck(document.frm0)" value="checkbox" checked/>
       </th>
      </tr>
     </tbody>
    </table>

    <table id="item_list" width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
     <tbody>
      <tr>
       <td width="48px" bgcolor="#ffffff">
       	<a href="#" title="Alice: 100 Postcards.. DB에 있는 책의 이미지">
       	 <img src="#" style="width: 48px; padding-left: 10px">
       	</a>
       </td>
       <td width="*" bgcolor="#ffffff">
        <a href="#">DB에 있는 책의 제목.</a><br>
       </td>
       <td width="130" bgcolor="#ffffff">
        "정가 : " <s>DB에 있는 가격</s>
       </td>
       <td width="90" align="center" bgcolor="#ffffff">
        <div style="float: left">
         <input type="text" size="2" value="DB의 카운트값" />
        </div>
        <div class="button" style="float: left; margin-left: 4px">
         <input type="submit" class="button_gray" style="width: 38px" value="변경" />
        </div>
       </td>
       <td width="90" align="center" bgcolor="#ffffff">
		<table cellspacing="0" cellpadding="0" border="0">
		 <tbody>
		  <tr>
		   <td align="center" width="48">
		    <div class="button_gray">
		     <a class="button_small" href="#">삭제</a>
		    </div>
		   </td>
		  </tr>
		 </tbody>
		</table>       
       </td>
      </tr>
     </tbody>
    </table>
  
   </form>
</div>

<select id="bookCount" size="1">
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
	<option value="6">6</option>
	<option value="7">7</option>
	<option value="8">8</option>
	<option value="9">9</option>
</select>
<script type="text/javascript">
	$(function() {
		Cart.list(userid);
	});
</script>