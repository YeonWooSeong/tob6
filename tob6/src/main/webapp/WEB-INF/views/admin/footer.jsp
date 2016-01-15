<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
     <!-- Footer -->
    <footer>
         
		<div style="width:100%; height:5%; float: left;"></div>

<script language=javascript>
		var ST_I23112_htmlstr = '';										// 스크롤되는 내용 전체를 담을 변수
		var ST_I23112_flag = false;										// 스크롤 여부 결정 플래그
		var ST_I23112_mouse = 1;																																														// 스크롤 여부 결정 변수
		var ST_I23112_direction = 2;																																				// 방향1 (1 : 상하, 2 : 좌우)
		var ST_I23112_speed = 1;																																						// 한번 움직일 때 몇 px 움직일지 지정 + 방향2 (px 단위 음수 이면 상/좌, 양수이면 하/우)
		var ST_I23112_wait = 1*1000;																																					// 스크롤 간 쉬는 간격 (1000 -> 1초)
		var ST_I23112_term = 155;																																								// width or height
		var ST_I23112_sum = 155;																																									// 1 scroll 을  위해 몇 번의 speed 를 반복 해야 할지 계산된 값
		var ST_I23112_auto = 'Y';																																								// 자동스크롤 여부
		var ST_I23112_temp = 0;																																														// 130px 짜리 10개면 1300 까지 올라갔다가 0으로 초기화 되는 스크롤범위 인덱스
		var ST_I23112_ctnt = new Array();
		
	ST_I23112_ctnt.push("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" align=\"center\"><tr><td><table width=\"100%\" cellpadding=\"5\" cellspacing=\"0\" border=\"0\"><tr><td width=145 height=42 align=center valign=middle><a href=\"http://\" target=\"_blank\"><img src='${img}/admin/1.jpg' width=\'116\' height=\'30\' border=\'0\' class=\"AB-line\" style=\"margin-top:4px;\"></a></td></tr></table></td></tr></table>");
	
	ST_I23112_ctnt.push("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" align=\"center\"><tr><td><table width=\"100%\" cellpadding=\"5\" cellspacing=\"0\" border=\"0\"><tr><td width=145 height=42 align=center valign=middle><a href=\"http://\" target=\"_blank\"><img src='${img}/admin/2.jpg' width=\'116\' height=\'30\' border=\'0\' class=\"AB-line\" style=\"margin-top:4px;\"></a></td></tr></table></td></tr></table>");
	
	ST_I23112_ctnt.push("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" align=\"center\"><tr><td><table width=\"100%\" cellpadding=\"5\" cellspacing=\"0\" border=\"0\"><tr><td width=145 height=42 align=center valign=middle><a href=\"http://\" target=\"_blank\"><img src='${img}/admin/3.jpg' width=\'116\' height=\'30\' border=\'0\' class=\"AB-line\" style=\"margin-top:4px;\"></a></td></tr></table></td></tr></table>");
	
	ST_I23112_ctnt.push("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" align=\"center\"><tr><td><table width=\"100%\" cellpadding=\"5\" cellspacing=\"0\" border=\"0\"><tr><td width=145 height=42 align=center valign=middle><a href=\"http://\" target=\"_blank\"><img src='${img}/admin/4.jpg' width=\'116\' height=\'30\' border=\'0\' class=\"AB-line\" style=\"margin-top:4px;\"></a></td></tr></table></td></tr></table>");
	
	ST_I23112_ctnt.push("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" align=\"center\"><tr><td><table width=\"100%\" cellpadding=\"5\" cellspacing=\"0\" border=\"0\"><tr><td width=145 height=42 align=center valign=middle><a href=\"http://\" target=\"_blank\"><img src='${img}/admin/5.jpg' width=\'116\' height=\'30\' border=\'0\' class=\"AB-line\" style=\"margin-top:4px;\"></a></td></tr></table></td></tr></table>");
	
	ST_I23112_ctnt.push("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" align=\"center\"><tr><td><table width=\"100%\" cellpadding=\"5\" cellspacing=\"0\" border=\"0\"><tr><td width=145 height=42 align=center valign=middle><a href=\"http://\" target=\"_blank\"><img src='${img}/admin/6.jpg' width=\'116\' height=\'30\' border=\'0\' class=\"AB-line\" style=\"margin-top:4px;\"></a></td></tr></table></td></tr></table>");
	
	ST_I23112_ctnt.push("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" align=\"center\"><tr><td><table width=\"100%\" cellpadding=\"5\" cellspacing=\"0\" border=\"0\"><tr><td width=145 height=42 align=center valign=middle><a href=\"http://\" target=\"_blank\"><img src='${img}/admin/7.jpg' width=\'116\' height=\'30\' border=\'0\' class=\"AB-line\" style=\"margin-top:4px;\"></a></td></tr></table></td></tr></table>");
	
	ST_I23112_ctnt.push("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" align=\"center\"><tr><td><table width=\"100%\" cellpadding=\"5\" cellspacing=\"0\" border=\"0\"><tr><td width=145 height=42 align=center valign=middle><a href=\"http://#\" target=\"_blank\"><img src='${img}/admin/8.jpg' width=\'116\' height=\'30\' border=\'0\' class=\"AB-line\" style=\"margin-top:4px;\"></a></td></tr></table></td></tr></table>");
	
	ST_I23112_ctnt.push("<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" align=\"center\"><tr><td><table width=\"100%\" cellpadding=\"5\" cellspacing=\"0\" border=\"0\"><tr><td width=145 height=42 align=center valign=middle><a href=\"http://#\" target=\"_blank\"><img src='${img}/admin/9.jpg' width=\'116\' height=\'30\' border=\'0\' class=\"AB-line\" style=\"margin-top:4px;\"></a></td></tr></table></td></tr></table>");
			
		var ST_I23112_cnt_ctnt = ST_I23112_ctnt.length;
		var ST_I23112_click_cnt = 0;																																													// 클릭 회수 기록
		var ST_I23112_scroll_method = '';																																										// 반복되는 scroll() 함수 객체
		var ST_I23112_scroll_wait = '';																																												// 대기 시간 객체
		var ST_I23112_reserv_scroll = '';																																											// 이동중일 때 다른 방향으로 전환 하는 경우 전체 객체가 움직인 후 방향을 전환해야 함 (그 이벤트가 있음을 알리는 플래그)
		var ST_I23112_speed_adj = (browser_type === 'Chrome' || browser_type === 'chrome') ? 15 : 1;										
		// 브라우저마다 다른 속도를 맞춤

		// 스크롤 시작
		function ST_I23112_StartRolling() {
			if(ST_I23112_cnt_ctnt > 0) {																																												// 항목 수 만큼 반복
				for (i=0; i<ST_I23112_cnt_ctnt; i++) ST_I23112_insertItems(i);																										// 항목 태그 병합
				if (ST_I23112_auto === 'Y') {
					ST_I23112_scroll_wait = window.setTimeout('ST_I23112_flag=true;ST_I23112_temp = 0;',ST_I23112_wait);				// 처음 대기시간 [wait*1000]
					ST_I23112_scroll_method = window.setTimeout('ST_I23112_scroll()',ST_I23112_speed_adj);											// 스크롤반복실행
				}
			}
		}

		//스크롤링
		function ST_I23112_scroll() {
			var TTT;
			if (ST_I23112_mouse && ST_I23112_flag) {
				for (i=0; i<ST_I23112_cnt_ctnt; i++) {																																						// 스크롤 폭 인덱스 증가
					ST_I23112_temp++;																																														// 움직임 인덱스 증가
					tmp = document.getElementById('ST_I23112_scroll_area' + i).style;																					// 항목 스타일 객체
					if (ST_I23112_direction == 1) {																																								// 움직임 (상하)
						TTT = parseInt(tmp.top) + ST_I23112_speed;
						tmp.top = TTT + 'px';
						if (ST_I23112_speed < 0) {
							if (parseInt(tmp.top) <= ST_I23112_term*(-1)) {
								TTT = ST_I23112_term * (ST_I23112_cnt_ctnt - 1);																										// 끝까지 도달한 경우 반대편으로 이동
								tmp.top = TTT + 'px';
							}
						} else {
							if (parseInt(tmp.top) >= ST_I23112_term * (ST_I23112_cnt_ctnt - 1)) {																			// 끝까지 도달한 경우 반대편으로 이동
								if (ST_I23112_temp === ST_I23112_cnt_ctnt) T_idx = ST_I23112_speed;
								else T_idx = 0;
								TTT = -ST_I23112_term + T_idx;																																			// 마지막에서 올라올 때만, 간격 없애기 위해
								tmp.top = TTT + 'px';
							}
						}
					} else {																																																			// 움직임 (좌우)
						TTT = parseInt(tmp.left) + ST_I23112_speed;
						tmp.left = TTT + 'px';
						//if (ST_I23112_temp == 1) alert('tmpleft : ' + tmp.left + '\nflag : ' + ST_I23112_flag + '\nmouse : ' + ST_I23112_mouse + '\ndirection : ' + ST_I23112_direction + '\nspeed : ' + ST_I23112_speed + '\nwait : ' + ST_I23112_wait + '\nterm : ' + ST_I23112_term + '\nsum : ' + ST_I23112_sum + '\ntemp : ' + ST_I23112_temp + '\nterm : ' + ST_I23112_term + '\ncnt_ctnt : ' + ST_I23112_cnt_ctnt + '\n');
						if (ST_I23112_speed < 0) {
							if (parseInt(tmp.left) <= ST_I23112_term * (-1)) {
								TTT = ST_I23112_term * (ST_I23112_cnt_ctnt - 1);																										// 끝까지 도달한 경우 반대편으로 이동
								tmp.left = TTT + 'px';
							}
						} else {
							if (parseInt(tmp.left) >= ST_I23112_term * (ST_I23112_cnt_ctnt - 1)) {																			// 끝까지 도달한 경우 반대편으로 이동
								if (ST_I23112_temp === ST_I23112_cnt_ctnt) T_idx = ST_I23112_speed;
								else T_idx = 0;
								TTT = -ST_I23112_term + T_idx;																																			// 처음 반대편 이동 시 에만, 간격 없애기 위해
								tmp.left = TTT + 'px';
							}
						}
					}

					// 모든 div 단위 이동이 끝났을 때 (모든 이동 객체들의 1speed 이동)
					if (i === ST_I23112_cnt_ctnt - 1) {
						if (ST_I23112_reserv_scroll != '') {	// 다른 방향
							ST_I23112_scroll_chg_dir(ST_I23112_reserv_scroll);
							ST_I23112_reserv_scroll = '';
						}
					}

					// 1 개체 스크롤되면 [wait/1000] 초간 쉼 ( 1객체의 이동길이가 130 이고 10개 라면 temp 의 max 값은 1300이 됨)
					if (ST_I23112_temp > (ST_I23112_sum - 1) * ST_I23112_cnt_ctnt) {
						ST_I23112_flag = false;
						ST_I23112_temp = 0;
						if (ST_I23112_auto === 'Y') ST_I23112_scroll_wait = window.setTimeout('ST_I23112_flag=true;ST_I23112_temp = 0;',ST_I23112_wait);
					}
				}
			}
			ST_I23112_scroll_method = window.setTimeout('ST_I23112_scroll()',ST_I23112_speed_adj);
		}

		// 스크롤 버튼
		function ST_I23112_click_scroll(click_direction) {
			var T_flag;																															// 같은 방향인지 다른 방향인지를 파악
			switch (click_direction) {
				case 'A' :																															// 상->하
					if (ST_I23112_direction == 1 && ST_I23112_speed > 0) T_flag = 'S';		// 같은 방향
					else T_flag = 'D';																										// 다른 방향
				break;
				case 'B' :																															// 하->상
					if (ST_I23112_direction == 1 && ST_I23112_speed < 0) T_flag = 'S';
					else T_flag = 'D';
				break;
				case 'C' :																															// 좌->우
					if (ST_I23112_direction == 2 && ST_I23112_speed > 0) T_flag = 'S';
					else T_flag = 'D';
				break;
				case 'D' :																															// 우->좌
					if (ST_I23112_direction == 2 && ST_I23112_speed < 0) T_flag = 'S';
					else T_flag = 'D';
				break;
			}

			// 정지되어 있을 때와 움직일 때를 구분하여
			if (ST_I23112_flag === false) {																						// 정지중일 때
				if (T_flag === 'D') ST_I23112_scroll_chg_dir(click_direction);						// 다른 방향이면 방향 전환
				window.clearTimeout(ST_I23112_scroll_wait);													// 정지 객체를 제거하고 true 로 변경
				ST_I23112_flag = true;
				ST_I23112_temp = -1;																									// -1px 보정
			} else {																																// 이동중일 때
				if (T_flag === 'D') ST_I23112_reserv_scroll = click_direction;
				else return;
			}

			// 자동스크롤이 아닌경우
			if (ST_I23112_auto === 'N') {
				if (ST_I23112_scroll_method != '') window.clearTimeout(ST_I23112_scroll_method);
				ST_I23112_scroll_method = window.setTimeout('ST_I23112_scroll()',ST_I23112_speed_adj);
			}
		}

		// 스크롤 방향을 바꾸는 함수
		function ST_I23112_scroll_chg_dir(click_direction) {
			switch (click_direction) {
				case 'A' :		// 상->하
					ST_I23112_direction = 1;
				break;
				case 'B' :		// 하->상
					ST_I23112_direction = 1;
				break;
				case 'C' :		// 좌->우
					ST_I23112_direction = 2;
				break;
				case 'D' :		// 우->좌
					ST_I23112_direction = 2;
				break;
			}
			ST_I23112_speed = ST_I23112_speed * -1;																															// 방향 전환
			ST_I23112_temp = ST_I23112_term/Math.abs(ST_I23112_speed) * ST_I23112_cnt_ctnt - ST_I23112_temp;	// 전환 후 멈춤 위치를 위해 temp 값 역 변경
		}

		function ST_I23112_insertItems(i) {
			if (ST_I23112_direction == 1) {
				ST_I23112_htmlstr='<div style=left:0px;top:'+(ST_I23112_term*i)+'px;height:'+(ST_I23112_term)+'px;position:absolute id=ST_I23112_scroll_area'+i+'>';
			} else {
				ST_I23112_htmlstr='<div style=top:0px;left:'+(ST_I23112_term*i)+'px;width:'+(ST_I23112_term)+'px;position:absolute id=ST_I23112_scroll_area'+i+'>';
			}
			ST_I23112_htmlstr+=ST_I23112_ctnt[i]+'</div>';
			document.write(ST_I23112_htmlstr);
		}
		</script>
		<div id=ST_I23112_scroll_div onmouseover=ST_I23112_mouse=0 onmouseout=ST_I23112_mouse=1 
		style='margin: auto; margin-bottom: 5%; border:0px #cccccc solid; overflow:hidden; width:930px; height:60px; position:relative'>
			<script language=javascript>ST_I23112_StartRolling();</script>
		</div>

	</footer>
	
	
	
	
	
	
	
	
	
	
	
