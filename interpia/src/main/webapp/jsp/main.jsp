<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
<head>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		$('.update').click(function() {
			if ($('input[name="checkbox"]').is(":checked")) {
				value = $('input:checkbox:checked').val();
				alert(value);
				location.href = 'update?num=' + value + '&page=' + ${page};

			} else {
				alert('수정할 게시물을 선택해주세요!.');
				return false;
			}

		});

	});

	function fileupload(id) {

		var data_type = 'data:application/vnd.ms-excel;charset=utf-8';
		var table_html = encodeURIComponent(document.getElementById('test').outerHTML);
		alert(table_html);
		var a = document.createElement('a');
		a.href = data_type + ',%EF%BB%BF' + table_html;
		a.download = '저장저장' + '_excel' + '.xls';
		a.click();
	}
</script>
<meta charset="utf-8">
<style>
#wrap {
	width: 1100px;
	margin: auto;
	min-height: 500px;
}

#siderBar {
	float: left;
	margin-top: 60px;
	margin-left: 20px;
	margin-right: 20px;
	width: 200px;
	border: 2px solid #5F7294;
	min-height: 300px;
}

#siderBar ul {
	width: 200px;
	margin: 10px 0;
	padding: 0;
}

#siderBar li {
	list-style: none;
	color: black;
	height: 30px;
	width: 155px;
	padding: 0 20px;
	margin-left: 5px;
	font-size: 12px;
	line-height: 30px;
}

#siderBar #currier {
	width: 180px;
	height: 50px;
	padding: 15 15px;
	line-height: 30px;
}

#currier img {
	margin-left: 10px;
}

#currier.btn {
	padding: 5px;
}

#contents {
	margin-top: 30px;
	margin-left: 10px;
	width: 780px;
	min-height: 300px;
	float: left;
	border-top: 30px solid rgba(161, 182, 204, 0.9);
	border-bottom: 15px solid rgba(161, 182, 204, 0.9);
	border-left: 5px solid rgba(161, 182, 204, 0.9);
	border-right: 5px solid rgba(161, 182, 204, 0.9);
}

#content {
	border: 2px solid #fff;
	border-radius: 5px 5px 5px 5px;
	width: 776px;
	min-height: 300px;
}

#content .title {
	height: 20px;
	margin: 10px 15px;
	font-size: 14px;
	padding: 2px 1px;
	border-bottom: 1px dotted #5F7294;
}

#content #selectBox {
	width: 340px;
	margin-left: 400px;
}

#selectBox .label {
	margin-left: 13px;
	padding: 0 10px;
}

#naviBar {
	width: 305px;
	height: 30px;
	margin-left: 400px;
	margin-top: 30px;
}

#naviBar a {
	margin-left: 10px;
	line-height: 30px;
}

#tableText {
	width: 700px;
	margin: 10px auto;
}

#downLoad {
	width: 150px;
	margin-left: 600px;
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<form action="main_ok" method="post" name="main_ok">
		<div id="wrap">
			<div id="header"></div>
			<!-- header end -->
			<div id="siderBar">
				<div>
					<ul>
						<li><img src="resources/image/left_icon.gif" /> 기본정보</li>
						<li><a href="insert">- 등록</a></li>
						<li><img src="resources/image/left_icon.gif" /> 직원명부</li>
						<li><img src="resources/image/left_icon.gif" /> 퇴직자현황</li>
						<li><img src="resources/image/left_icon.gif" /> 예비인력정보</li>
						<li><img src="resources/image/left_icon.gif" /> 거래처정보</li>
						<li>- 등록</li>
					</ul>
				</div>
				<div>
					<ul>
						<li>진행 프로젝트</li>
						<li>현 황</li>
					</ul>
				</div>
				<div id="currier">
					<!------------------------------ 경력검색 ---------------------------------->
					<img src="resources/image/left_icon.gif" width="11" height="11"
						align="absmiddle"> <strong>경력검색</strong><br /> <input
						name="textfield" type="text" class="flat" size="15" maxlength="14" />
					<button class="btn">검색</button>
					<!------------------------------ 경력검색 ---------------------------------->
				</div>
			</div>
			<!-- siderBar end -->
			<div id="contents">
				<div id="content">
					<div class="title">
						<img src="resources/image/icon.gif" width="9" height="9"
							align="absmiddle"> <strong>사원조회</strong>
					</div>
					<div id="selectBox">
						<div>
							<select id="select" name="select" class="INPUT">
								<option selected value="all">::::: 전 체 :::::</option>
								<option value="kor_name">::::: 이 름 :::::</option>
								<option value="jumin_no">::: 주민번호 :::</option>
							</select> <input id="textfield" name="textfield1" type="text"
								class="INPUT">
							<button type="submit">검색</button>
						</div>
						<div>
							<label class="label">:::: 성 &nbsp;&nbsp; 별 ::::</label> <input
								id="gender" name="gender" type="text" class="INPUT">
						</div>
						<div>
							<label class="label">:::: 연 &nbsp;&nbsp; 차 :::: </label> <input
								id="thirdyear" name="thirdyear" type="text" class="INPUT"
								placeholder="뒤에7자리">
						</div>
						<div>
							<label class="label">:::: 주 &nbsp;&nbsp; 소 ::::</label> <input
								id="addr" name="addr" type="text" class="INPUT"
								placeholder="ex)서울시">

						</div>
					</div>
					<div id="naviBar">
						<a class="update">수정</a> <img src="resources/image/all_icon.gif"
							width="11" height="11" align="absmiddle"> <a href="#">인사기록카드</a>
						<img src="resources/image/all_icon.gif" width="11" height="11"
							align="absmiddle"> <a href="#">경력정보</a> <img
							src="resources/image/all_icon.gif" width="11" height="11"
							align="absmiddle"> <a href="#">근무정보</a><img
							src="resources/image/all_icon.gif" width="11" height="11"
							align="absmiddle">
					</div>
					<div id="tableText">
						<table id="test">

							<thead>

								<tr>
									<td width="35" height="20" align="center"></td>
									<td width="85" align="center">이름</td>
									<td width="85" align="center">주민번호</td>
									<td width="85" align="center">성별</td>
									<td width="85" align="center">기술등급</td>
									<td width="85" align="center">상태</td>
									<td width="85" align="center">근무형태</td>
								<tr>
							</thead>
							<!-------------------------  리스트 ------------------------------>
							<tbody>
								<c:forEach var="b" items="${list }">
									<tr>
										<td colspan="7" background="resources/image/line_bg.gif"></td>
									</tr>
									<tr>
										<td width="35" height="20" align="center"><input
											type="checkbox" name="checkbox" value="${b.num}"></td>
										<td width="85" align="center">${b.kor_name }</td>
										<td width="153" align="center">${b.jumin_no }</td>
										<td width="91" align="center">${b.gender }</td>
										<td width="91" align="center">${b.grade }</td>
										<td width="91" align="center">${b.sangtae }</td>
										<td width="94" align="center">${b.work }</td>



									</tr>
								</c:forEach>

							</tbody>

							<tfoot>
								<tr>
									<td colspan="7" background="resources/image/line_bg.gif"></td>
								</tr>
								<tr>
									<td height="35" colspan="7" align="center"
										style="padding-bottom: 3">
										<div style="margin-left: 0px; margin-top: 20px;">
											<c:if test="${page >= 1 }">
												<a href="main?page=${starpage }"><img
													src="resources/image/prev.gif" width="22" height="15"
													border="0" align="absmiddle"></a>
											</c:if>
											<c:if test="${page<=1 }">
												<img src="resources/image/pre.gif" width="42" height="15"
													border="0" align="absmiddle">&nbsp;
      													  </c:if>

											<c:if test="${page>1 }">
												<a href="main?page=${page-1 }"><img
													src="resources/image/pre.gif" width="42" height="15"
													border="0" align="absmiddle"></a>&nbsp;
        												</c:if>

											<c:forEach var="a" begin="${startpage }" end="${endpage }">
												<c:if test="${a==page }">
           													 &nbsp;${a }&nbsp;|&nbsp;
          													</c:if>
												<c:if test="${a!=page }">
													<a href="main?page=${a }">${a}&nbsp;|</a>&nbsp;
         													 </c:if>
											</c:forEach>

											<c:if test="${page>=maxpage }">
												<img src="resources/image/next.gif" width="42" height="15"
													border="0" align="absmiddle">
											</c:if>
											<c:if test="${page<maxpage }">
												<a href="main?page=${page+1 }"><img
													src="resources/image/next.gif" width="42" height="15"
													border="0" align="absmiddle"></a>

											</c:if>
											<a href="main?page=${endpage }"><img
												src="resources/image/next_.gif" width="22" height="15"
												border="0" align="absmiddle"></a>
										</div>


									</td>
								</tr>
							</tfoot>
						</table>
					</div>
					<!-------------------------  리스트 ------------------------------>
					<div id="downLoad">
						<button type="button" onclick="fileupload(test)">
							<img src="resources/image/all_icon.gif" width="11" height="11"
								align="absmiddle">자료다운
						</button>


					</div>
				</div>
			</div>
			<!-- contents end -->
		</div>
	</form>
</body>
</html>
