<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {

		$("#kor_name").val("${test.kor_name}");
		$("#eng_name").val("${test.eng_name}");
		$("#hanja_name").val("${test.hanja_name}");
		$("#jumin_no1").val("${test.jumin_no1}");
		$("#jumin_no2").val("${test.jumin_no2}");
		$("#photoname").val("${test.original}");
		$("#b_year").val("${test.b_year}");
		$("#b_month").val("${test.b_month}");
		$("#b_date").val("${test.b_date}");
		$("#thirdyear").val("${test.thirdyear}");
		$("#addr1").val("${test.addr1}");
		$("#addr2").val("${test.addr2}");
		$("#wagetype").val("${test.wagetype}");
		$("#work").val("${test.work}");
		$("#sangtae").val("${test.sangtae}");
		$("#phone1").val("${test.phone1}");
		$("#phone2").val("${test.phone2}");
		$("#phone3").val("${test.phone3}");
		$("#email").val("${test.email}");
		$("#grade").val("${test.grade}");
		$("#juryang").val("${test.juryang}");

		var gender = "${test.gender}";

		if (gender == "남자") {
			$('input[name="gender"][value="' + gender + '"]').attr("checked",
					"checked");
		} else {
			$('input[name="gender"][value="' + gender + '"]').attr("checked",
					"checked");
		}

		var lunarlift = "${test.lunarlift}";
		if (lunarlift == "양력") {
			$('input[name="lunarlift"][value="' + lunarlift + '"]').attr(
					"checked", "checked");
		} else {
			$('input[name="lunarlift"][value="' + lunarlift + '"]').attr(
					"checked", "checked");
		}

		var marriage = "${test.marriage}";
		if (marriage == "기혼") {
			$('input[name="marriage"][value="' + marriage + '"]').attr(
					"checked", "checked");
		} else {
			$('input[name="marriage"][value="' + marriage + '"]').attr(
					"checked", "checked");
		}

	});

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
</script>
<style>
.photoload {
	display: none;
}
</style>

</head>
<body topmargin="0" leftmargin="0">
	<form action="update_ok" method="post" enctype="multipart/form-data">
		<input type="hidden" name="page" value="${page }"> <input
			type="hidden" name="num" value="${test.num}">


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
																<td align="center"><strong><a
																		href="rydbr?num=${test.num }&page=${page}">교육정보</a> | 자격증. 보유기술정보 |
																		프로젝트 정보 |경력정보 | 근무정보</strong></td>
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
																		width="100" border="0" cellspacing="0" cellpadding="0">
																		<tr>
																			<td height="112" bgcolor="#CCCCCC"><table
																					width="100" border="0" cellspacing="1"
																					cellpadding="0">
																					<tr>
																						<td height="110" bgcolor="#FFFFFF"><img
																							id="blah" alt="image"
																							src="resources/image/${test.original }"
																							width=117px; height=118px;></td>
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
																			<td height="26"><input type="text" id="eng_name"
																				name="eng_name"></td>
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
							<td height="13" align="center"><table width="600" border="0"
									cellspacing="0" cellpadding="0">
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
																	name="photoname" type="text" size="40"></td>
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
																<td width="392"><select id="sangtae" name="sangtae">
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
											src="resources/image/bt_remove.gif" width="49" height="18"
											onsubmit="update_ok()"></td>
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
