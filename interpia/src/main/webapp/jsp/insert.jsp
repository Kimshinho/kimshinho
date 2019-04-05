<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	function readURL(input) {

		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);

			}
			reader.readAsDataURL(input.files[0]);
		}

		var po = $("#photoload").val().split('\\');

		$('#photoname').val(po[po.length - 1]);

	}

	function insert() {

		if ($.trim($("#kor_name").val()) == "") {
			alert("한글이름을 입력하세요!");
			$("#kor_name").focus();
			return false;
		}
		if ($.trim($("#eng_name").val()) == "") {
			alert("영문이름을 입력하세요!");
			$("#eng_name").focus();
			return false;
		}
		if ($.trim($("#hanja_name").val()) == "") {
			alert("한자이름을 입력하세요!");
			$("#hanja_name").focus();
			return false;
		}
		if ($.trim($("#jumin_no1").val()) == "") {
			alert("주민앞자리를 입력하세요");
			$("#jumin_no1").focus();
			return false;
		}
		if ($.trim($("#jumin_no2").val()) == "") {
			alert("주민뒷자리를 입력하세요");
			$("#jumin_no2").focus();
			return false;
		}
		if ($.trim($("#photoname").val()) == "") {
			alert("사진명을 입력하세요");
			$("#photoname").focus();
			return false;
		}
		if ($.trim($("#b_year").val()) == "") {
			alert("생년월일의 년도를 입력하세요");
			$("#b_year").focus();
			return false;
		}
		if ($.trim($("#b_month").val()) == "") {
			alert("생년월일의 월을 입력하세요");
			$("#b_month").focus();
			return false;
		}
		if ($.trim($("#b_date").val()) == "") {
			alert("생년월일의 일을 입력하세요");
			$("#b_date").focus();
			return false;
		}
		if ($.trim($("#b_date").val()) == "") {
			alert("생년월일의 일을 입력하세요");
			$("#b_date").focus();
			return false;
		}
		var lunarlift1 = document.getElementById("lunarlift1");
		var lunarlift2 = document.getElementById("lunarlift2");
		if (lunarlift1.checked == false && lunarlift2.checked == false) {
			alert("양력,음력 중에서1개를 선택하세요");
			return false;
		}
		var mam = document.getElementById("mam");
		var woman = document.getElementById("woman");
		if (mam.checked == false && woman.checked == false) {
			alert("남자,여자 중에서1개를 선택하세요");
			return false;
		}
		var married = document.getElementById("married");
		var single = document.getElementById("single");
		if (married.checked == false && single.checked == false) {
			alert("기혼,미혼 중에서1개를 선택하세요");
			return false;
		}
		if ($.trim($("#thirdyear").val()) == "") {
			alert("년차를 입력하세요");
			$("#thirdyear").focus();
			return false;
		}
		if ($.trim($("#work").val()) == "") {
			alert("근무를 선택 하세요");
			$("#work").focus();
			return false;
		}
		if ($.trim($("#wagetype").val()) == "") {
			alert("급여유형을 선택 하세요");
			$("#wagetype").focus();
			return false;
		}
		if ($.trim($("#sangtae").val()) == "") {
			alert("상태를 선택 하세요");
			$("#sangtae").focus();
			return false;
		}
		if ($.trim($("#addr1").val()) == "") {
			alert("지역을 입력하세요");
			$("#addr1").focus();
			return false;
		}
		if ($.trim($("#addr2").val()) == "") {
			alert("나머지 주소를 입력하세요");
			$("#addr2").focus();
			return false;
		}
		if ($.trim($("#phone1").val()) == "") {
			alert("연락처를 입력하세요");
			$("#phone1").focus();
			return false;
		}
		if ($.trim($("#phone2").val()) == "") {
			alert("연락처를 입력하세요");
			$("#phone2").focus();
			return false;
		}
		if ($.trim($("#phone3").val()) == "") {
			alert("연락처를 입력하세요");
			$("#phone3").focus();
			return false;
		}
		if ($.trim($("#email").val()) == "") {
			alert("이메일를 입력하세요");
			$("#email").focus();
			return false;
		}
		if ($.trim($("#grade").val()) == "") {
			alert("기술등급을 입력하세요");
			$("#grade").focus();
			return false;
		}
		if ($.trim($("#juryang").val()) == "") {
			alert("주량을 입력하세요");
			$("#juryang").focus();
			return false;
		}

	}
</script>

<style>
.photoload {
	display: none;
}

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
	height:370px;
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
<body topmargin="0" leftmargin="0">
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


		<form onsubmit="return inserts()" action="insert_ok" method="post"
			enctype="multipart/form-data">


			<table width="640" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="640">&nbsp;</td>
				</tr>
				<tr>
					<td height="25"><img src="resources/image/icon.gif" width="9"
						height="9" align="absmiddle"> <strong>사원 기본 정보 수정</strong></td>
				</tr>
				<tr>
					<td><table width="640" border="0" cellspacing="0"
							cellpadding="0">
							<tr>
								<td height="15" align="left"><table width="640" border="0"
										cellspacing="0" cellpadding="0">
										<tr>
											<td><table width="640" border="0" cellspacing="1"
													cellpadding="0">
													<tr>
														<td height="2" background="resources/image/bar_bg1.gif"></td>
													</tr>
													<tr align="center" bgcolor="F8F8F8">
														<td height="26" align="center" bgcolor="#E4EBF1"
															style="padding-right: 10"><table width="600"
																border="0" cellspacing="0" cellpadding="0">
																<tr>
																	<td align="center"><strong>교육정보 | 자격증.
																			보유기술정보 | 프로젝트 정보 |경력정보 | 근무정보</strong></td>
																</tr>
															</table></td>
													</tr>
													<tr align="center" bgcolor="F8F8F8">
														<td height="3" align="right"
															background="resources/image/bar_bg1.gif"></td>
													</tr>
												</table></td>
										</tr>
									</table></td>
							</tr>
							<tr>
								<td height="6" align="center" valign="top">&nbsp;</td>
							</tr>
							<tr>
								<td height="7" align="center" valign="top"><table
										width="600" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td bgcolor="#CCCCCC"><table width="600" border="0"
													cellspacing="1" cellpadding="0">
													<tr>
														<td height="135" align="center" bgcolor="#E4EBF1"><table
																width="600" border="0" cellpadding="0" cellspacing="0">
																<tr>
																	<td width="144" height="119" align="center"><table
																			width="100" border="0" cellspacing="0"
																			cellpadding="0">
																			<tr>
																				<td height="112" bgcolor="#CCCCCC"><table
																						width="100" border="0" cellspacing="1"
																						cellpadding="0">
																						<tr>
																							<td height="110" bgcolor="#FFFFFF"><img
																								id="blah" alt="image" src="#" width=117px;
																								height=118px;></td>
																						</tr>
																					</table></td>
																			</tr>
																		</table></td>
																	<td width="456"><table width="423" border="0"
																			cellspacing="2" cellpadding="0">
																			<tr>
																				<td height="2" colspan="2"></td>
																			</tr>
																			<tr>
																				<td width="107" height="26" align="right"><strong>한글이름
																						:</strong>&nbsp;</td>
																				<td width="310" height="26"><input type="text"
																					id="kor_name" name="kor_name"></td>
																			</tr>
																			<tr>
																				<td height="26" align="right"><strong>영문이름
																						:&nbsp;</strong></td>
																				<td height="26"><input type="text"
																					id="eng_name" name="eng_name"></td>
																			</tr>
																			<tr>
																				<td height="26" align="right"><strong>한문이름:</strong>&nbsp;</td>
																				<td height="26"><input type="text"
																					id="hanja_name" name="hanja_name"></td>
																			</tr>
																			<tr>
																				<td height="26" align="right"><strong>주민등록번호
																						:</strong>&nbsp;</td>
																				<td height="26"><input id="jumin_no1"
																					name="jumin_no1" type="text" size="15"> - <input
																					id="jumin_no2" name="jumin_no2" type="text"
																					size="15"></td>
																			</tr>
																		</table></td>
																</tr>
															</table></td>
													</tr>
												</table></td>
										</tr>
									</table></td>
							</tr>
							<tr>
								<td height="7" align="center" valign="top">&nbsp;</td>
							</tr>
							<tr>
								<td height="13" align="center"><table width="600"
										border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td bgcolor="#CCCCCC"><table width="600" border="0"
													cellspacing="1" cellpadding="0">
													<tr>
														<td bgcolor="#E4EBF1"><table width="526" border="0"
																cellspacing="1" cellpadding="1">
																<tr>
																	<td width="102" align="right"><strong>사진파일명
																			:&nbsp;</strong></td>

																	<td width="268"><input id="photoname"
																		name="photoname" type="text" size="40"
																		onclick="photoname()"></td>
																	<td width="146"><font color="#FF0000"> <label>
																				<img src="resources/image/bt_search.gif" width="49"
																				height="18"><input type="file"
																				class="photoload" id="photoload" name="photoload"
																				onchange="readURL(this)">
																		</label>
																	</font></td>
																</tr>
															</table></td>
													</tr>
													<tr>
														<td bgcolor="#E4EBF1"><table width="500" border="0"
																cellspacing="1" cellpadding="1">
																<tr>
																	<td width="102" align="right"><strong>생년월일
																			:&nbsp;</strong></td>
																	<td width="391"><input id="b_year" name="b_year"
																		type="text" size="10"> 년 <input id="b_month"
																		name="b_month" type="text" size="7"> 월 <input
																		id="b_date" name="b_date" type="text" size="7">
																		일 ( <input type="radio" id="lunarlift1"
																		name="lunarlift" value="양력"> 양력 <input
																		type="radio" id="lunarlift2" name="lunarlift"
																		value="음력"> 음력 )</td>
																</tr>
															</table></td>
													</tr>
													<tr>
														<td bgcolor="#E4EBF1"><table width="500" border="0"
																cellspacing="1" cellpadding="1">
																<tr>
																	<td width="102" align="right"><strong>성별
																			:&nbsp; </strong></td>
																	<td width="391"><input type="radio" id="mam"
																		name="gender" value="남자"> 남자 <input
																		type="radio" id="woman" name="gender" value="여자">
																		여자</td>
																</tr>
															</table></td>
													</tr>
													<tr>
														<td bgcolor="#E4EBF1"><table width="500" border="0"
																cellspacing="1" cellpadding="1">
																<tr>
																	<td width="102" align="right"><strong>결혼유무
																			:&nbsp;</strong></td>
																	<td width="391"><input type="radio" id="married"
																		name="marriage" value="기혼"> 기혼 <input
																		type="radio" id="single" name="marriage" value="미혼">
																		미혼</td>
																</tr>
															</table></td>
													</tr>
													<tr>
														<td bgcolor="#E4EBF1"><table width="500" border="0"
																cellspacing="1" cellpadding="1">
																<tr>
																	<td width="101" align="right"><strong>년차
																			:&nbsp;</strong></td>
																	<td width="392"><input id="thirdyear"
																		name="thirdyear" type="text" size="10"></td>
																</tr>
															</table></td>
													</tr>

													<tr>
														<td bgcolor="#E4EBF1"><table width="500" border="0"
																cellspacing="1" cellpadding="1">
																<tr>
																	<td width="101" align="right"><strong>근무
																			:&nbsp;</strong></td>
																	<td width="392"><select id="work" name="work">
																			<option value="">선택</option>
																			<option value="SI">SI</option>
																			<option value="SM">SM</option>

																	</select></td>
																</tr>
															</table></td>
													</tr>
													<tr>
														<td bgcolor="#E4EBF1"><table width="500" border="0"
																cellspacing="1" cellpadding="1">
																<tr>
																	<td width="101" align="right"><strong>급여
																			지급 유형:&nbsp;</strong></td>
																	<td width="392"><select id="wagetype"
																		name="wagetype">
																			<option value="">선택</option>
																			<option value="월급">월급</option>
																			<option value="주급">주급</option>

																	</select></td>
																</tr>
															</table></td>
													</tr>
													<tr>
														<td bgcolor="#E4EBF1"><table width="500" border="0"
																cellspacing="1" cellpadding="1">
																<tr>
																	<td width="101" align="right"><strong>상태:&nbsp;</strong></td>
																	<td width="392"><select id="sangtae"
																		name="sangtae">
																			<option value="">선택</option>
																			<option value="정규직">정규직</option>
																			<option value="계약직">계약직</option>

																	</select></td>
																</tr>
															</table></td>
													</tr>
													<tr>
														<td bgcolor="#E4EBF1"><table width="500" border="0"
																cellspacing="1" cellpadding="1">
																<tr>
																	<td width="101" align="right"><strong>주소:&nbsp;</strong></td>
																	<td width="392"><input id="addr1" name="addr1"
																		type="text" size="10"> <input id="addr2"
																		name="addr2" type="text" size="40"></td>
																</tr>
															</table></td>
													</tr>
													<tr>
														<td bgcolor="#E4EBF1"><table width="500" border="0"
																cellspacing="1" cellpadding="1">
																<tr>
																	<td width="101" align="right"><strong>연락처:&nbsp;</strong></td>
																	<td width="392"><input id="phone1" name="phone1"
																		type="text" size="10"> - <input id="phone2"
																		name="phone2" type="text" size="10"> - <input
																		id="phone3" name="phone3" type="text" size="10"></td>
																</tr>
															</table></td>
													</tr>
													<tr>
														<td bgcolor="#E4EBF1"><table width="500" border="0"
																cellspacing="1" cellpadding="1">
																<tr>
																	<td width="101" align="right"><strong>이메일:&nbsp;</strong></td>
																	<td width="392"><input id="email" name="email"
																		type="text" size="20"></td>
																</tr>
															</table></td>
													</tr>
													<tr>
														<td bgcolor="#E4EBF1"><table width="500" border="0"
																cellspacing="1" cellpadding="1">
																<tr>
																	<td width="101" align="right"><strong>기술등급:&nbsp;</strong></td>
																	<td width="392"><input id="grade" name="grade"
																		type="text" size="20"></td>
																</tr>
															</table></td>
													</tr>
													<tr>
														<td bgcolor="#E4EBF1"><table width="500" border="0"
																cellspacing="1" cellpadding="1">
																<tr>
																	<td width="101" align="right"><strong>주량:&nbsp;</strong></td>
																	<td width="392"><input id="juryang" name="juryang"
																		type="text" size="20"></td>
																</tr>
															</table></td>
													</tr>
												</table></td>
										</tr>
									</table></td>
							</tr>
							<tr>
								<td height="3" align="center">&nbsp;</td>
							</tr>
							<tr>
								<td height="3" align="center"><table width="107" border="0"
										cellpadding="1" cellspacing="1">
										<tr>
											<td width="49"><input type="image"
												src="resources/image/bt_remove.gif" width="49" height="18"></td>
											<td width="51"><img src="resources/image/bt_cancel.gif"
												width="49" height="18" onclick="location.href='main'">
											</td>
										</tr>
									</table></td>
							</tr>
							<tr>
								<td height="7" align="right">&nbsp;</td>
							</tr>
						</table></td>
				</tr>
			</table>
		</form>
</body>
</html>
