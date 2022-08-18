<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
<c:when test="${errMsg ne null and errMsg ne ''}">
<script>
	window.onload = function() {
		window.alert("${errMsg}");
		window.close();
	};
</script>
</c:when>
<c:otherwise>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8"/>
		<title>Camper - 채팅</title>
		<script src="//code.jquery.com/jquery-latest.min.js"></script>
		<script src="resources/js/common.js" defer="defer"></script>
		<script src="resources/js/chat.js" defer="defer"></script>
		<link rel="stylesheet" href="resources/css/common.css" type="text/css"/>
		<link rel="stylesheet" href="resources/css/chat.css" type="text/css"/>
		<link rel="stylesheet" href="//fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"/>
		<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />
	</head>
	<body>
		<div id="chat">
			<div id="left">
				<div id="notice">
					<c:choose>
					<c:when test="${notice ne null and notice ne ''}">
					${notice}
					</c:when>
					<c:otherwise>
					크루장은 채팅 메시지 우 클릭 후 &quot;이 메시지를 공지로 등록&quot; 하면 이곳에 공지 메시지로 등록됩니다.
					</c:otherwise>
					</c:choose>
				</div>
				<ul id="msgList">
					
				</ul>
				<input type="text" id="msg" />
			</div>
			<div id="right">
				<div class="wrapper">
					<div id="joinList">
						<p>참여 중인 회원 수 : <strong>0</strong> / ${cg_limit}</p>
						<div id="chatMember">
							<ul>
								
							</ul>
						</div>
					</div>
					<p>크루모집현황 : <strong>0</strong>명</p>
				</div>
				<div id="btn">
					<c:choose>
					<c:when test="${crew eq '크루장'}">
					<c:if test="${ct_deadline eq 0}">
					<button type="button" id="btnCrewEnd"><i class="xi-recording-stop xi-2x" style="vertical-align: middle;"></i> 크루모집 마감</button>
					</c:if>
					</c:when>
					<c:otherwise>
					<button type="button" id="btnJoin" class="<c:if test="${isGo eq true}">active</c:if>"><i class="xi-hand-paper"></i></button>
					<a href="javascript:;" id="btnExit"><i class="xi-log-out"></i> 채팅방 나가기</a>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<%@ include file="../../resources/inc/contextMenuMember.jsp" %>
		<ul id="contextMenuChatNotice" class="contextMenuList">
			<li><a href="javascript:;"><i class="xi-bell"></i> 이 메시지를 공지로 등록</a></li>
		</ul>
	</body>
	<script>
		var roomIdx = ${cg_idx};
		var msgSend;
		var divChat = document.getElementById('msgList');
		var ws = new WebSocket("ws://" + location.hostname + ':' + location.port + "/chatEcho");
		
		ws.onopen = function() {
			msgSend = {
				'cmd': 'ENTER',
				'roomIdx': roomIdx
			};
			
			sendMessage(msgSend);
		};
		
		ws.onmessage = function(event) {
			var obj = JSON.parse(event.data);
			
			switch(obj.cmd) {
				case 'ENTER':
					$('#msgList').empty().append(obj.msgList);
					
					divChat.scrollTop = divChat.scrollHeight;
					break;
					
				case 'MSG_RECEIVE':
					var isScroll = Math.ceil(divChat.scrollTop + divChat.clientHeight) >= divChat.scrollHeight ? true : false;
					
					$('#msgList').append(obj.msg);
					
					if(isScroll == true) {
						divChat.scrollTop = divChat.scrollHeight;
					}
					break;
					
				case 'MSG_NOTICE':
					$('#notice').text(obj.msg);
					break;
					
				<c:if test="${crew eq '크루원'}">
				case 'CREW_BAN':
					window.alert("강퇴 당했습니다.");
					window.close();
					break;
				</c:if>
					
				default:
					$('#joinList > p > strong').text(obj.cntJoin);
					$('.wrapper > p > strong').text(obj.cntCrew);
					
					$('#chatMember > ul').empty();
					for (var i = 0; i < obj.list.length; i++) {
						$('#chatMember > ul').append(obj.list[i]);
					}
					break;
			}
		};
		
		ws.onclose = function(event) {
			window.alert("서버와의 연결이 끊겼습니다.");
			window.close();
		};
		
		ws.onerror = function(error) {
			window.alert("서버와의 연결을 실패하였습니다.");
			window.close();
		};
		
		function sendMessage(jsonObj) {
			ws.send(JSON.stringify(jsonObj));
		}
		
		$('#msg').on('keypress', function(event) {
			if (event.keyCode == 13) {
				if ($.trim($('#msg').val()) != '') {
					msgSend = {
						'cmd': 'MSG_SEND',
						'roomIdx': roomIdx,
						'msg': $('#msg').val()
					};
					
					sendMessage(msgSend);
				}
				
				$('#msg').val('').focus();
			}
		});
		
		<c:choose>
		<c:when test="${crew eq '크루장' and ct_deadline eq 0}">
		$('#btn > #btnCrewEnd').on('click', function() {
			var $this = $(this);
			
			if (confirm("크루모집 마감 후 다시 되돌릴 수 없습니다. 크루모집 마감하겠습니까?")) {
				$.ajax({
					'type': 'get',
					'url': 'crewTogetherDeadline.ajax',
					'data': {
						'ct_idx': ${ct_idx}
					},
					'dataType': 'json',
					'success': function(data) {
						if (data.result > 0) {
							$this.remove();
							$('#chatMember > ul > li > input[type="checkbox"]').remove();
							window.alert("크루 모집 마감 처리되었습니다.");
						} else {
							window.alert("처리 중 알 수 없는 오류가 발생하였습니다. 다시 시도하여 주십시오.");
						}
					},
					'error': function(error) {
						console.log(error);
					}
				});
			}
		});
		
		$('#contextMenuChatNotice > li > a').on('click', function() {
			msgSend = {
				'cmd': 'MSG_NOTICE',
				'roomIdx': roomIdx,
				'msgIdx': msgNoticeIdx
			};
			
			sendMessage(msgSend);
		});
		
		$(document).on('click', '#chatMember > ul > li > button[type="button"]', function() {
			if (confirm("강퇴 당한 회원은 재 입장이 불가능합니다. 강퇴하겠습니까?")) {
				msgSend = {
					'cmd': 'CREW_BAN',
					'roomIdx': roomIdx,
					'mb_id': $(this).prev('span').data('id')
				};
				
				sendMessage(msgSend);
			}
		});
		
		$(document).on('change', '#chatMember > ul > li > input[type="checkbox"]', function() {
			msgSend = {
				'cmd': 'CREW_CONFIRM',
				'roomIdx': roomIdx,
				'mb_id': $(this).next('span').data('id'),
				'chk': $(this).is(':checked')
			};
			
			sendMessage(msgSend);
		});
		</c:when>
		
		<c:otherwise>
		$('#btn > #btnJoin').on('click', function() {
			$(this).toggleClass('active');
			
			msgSend = {
				'cmd': 'CREW_EXPRESSION',
				'roomIdx': roomIdx,
				'chk' : $(this).hasClass('active')
			};
			
			sendMessage(msgSend);
		});
		
		$('#btn > #btnExit').on('click', function() {
			if (confirm("채팅방을 퇴장하겠습니까?")) {
				msgSend = {
					'cmd': 'CREW_EXIT',
					'roomIdx': roomIdx
				};
				
				sendMessage(msgSend);
				window.close();
			}
		});
		</c:otherwise>
		</c:choose>
	</script>
</html>
</c:otherwise>
</c:choose>