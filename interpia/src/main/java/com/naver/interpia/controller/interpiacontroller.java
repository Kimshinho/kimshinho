package com.naver.interpia.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.naver.interpia.DAO.interpiaService;
import com.naver.interpia.model.education;
import com.naver.interpia.model.interpia;

@Controller
public class interpiacontroller {

	@Autowired
	private interpiaService interpiaService;
	private String saveFolder = "";

	@RequestMapping(value = "main")
	public ModelAndView main(interpia interpia,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page) throws Exception {

		// 초기화
		int limit = 5; // 한 화면에 출력할 레코드 갯수

		int listcount = this.interpiaService.ListCount(); // 총 리스트 수를 받아옵니다.

		// 총 페이지 수
		int maxpage = (listcount + limit - 1) / limit;

		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21, ...)
		int startpage = ((page - 1) / 10) * 10 + 1;

		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30, ...)
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		List<interpia> list = this.interpiaService.slelct(page);// 리스트를 받아옵니다.

		ModelAndView M = new ModelAndView("main");
		M.addObject("page", page);
		M.addObject("maxpage", maxpage);
		M.addObject("startpage", startpage);
		M.addObject("endpage", endpage);
		M.addObject("listcount", listcount);
		M.addObject("list", list);

		return M;
	}

	@RequestMapping(value = "main_ok")
	public ModelAndView main_ok(interpia interpia,
			@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value = "select") String select, @RequestParam(value = "textfield1") String textfield,
			@RequestParam(value = "gender") String gender, @RequestParam(value = "thirdyear") String thirdyear,
			@RequestParam(value = "addr") String addr) throws Exception {

		System.out.println(select);

		Map<String, Object> m = new HashMap<String, Object>();

		m.put("page", page);
		m.put("select", select);
		m.put("textfield", textfield);
		m.put("gender", gender);
		m.put("thirdyear", thirdyear);
		m.put("addr", addr);

		// 초기화
		int limit = 5; // 한 화면에 출력할 레코드 갯수

		int selectcount = interpiaService.selectListCount(m); // 총 리스트 수를 받아옵니다.

		System.out.println(selectcount);
		// 총 페이지 수
		int maxpage = (selectcount + limit - 1) / limit;

		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21, ...)
		int startpage = ((page - 1) / 10) * 10 + 1;

		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30, ...)
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		List<interpia> list = this.interpiaService.slelctlist(m);// 리스트를 받아옵니다.

		ModelAndView M = new ModelAndView("main2");
		M.addObject("textfield1", textfield);
		M.addObject("select", select);
		M.addObject("gender", gender);
		M.addObject("thirdyear", thirdyear);
		M.addObject("addr", addr);
		M.addObject("page", page);
		M.addObject("maxpage", maxpage);
		M.addObject("startpage", startpage);
		M.addObject("endpage", endpage);
		M.addObject("listcount", selectcount);
		M.addObject("list", list);

		return M;
	}

	@RequestMapping(value = "insert")
	public String insert() {
		return "insert";
	}

	@RequestMapping(value = "insert_ok")
	public void insert_ok(interpia interpia, HttpServletResponse response) throws Exception {
		System.out.println("등록처리페이지");

		MultipartFile uploadfile = interpia.getPhotoload();
		if (!uploadfile.isEmpty()) {

			// 원래 파일명 구해오기
			String fileName = uploadfile.getOriginalFilename();

			// 원래 파일명 저장
			interpia.setOriginal(fileName);

			// DB에 저장할 파일명 구해옵니다.
			String fileDBName = getFileDBName(fileName);

			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));

			// 바뀐 파일명으로 저장
			interpia.setPhotoname(fileDBName);
		}

		interpia.setAddr(interpia.getAddr1() + " " + interpia.getAddr2());
		interpia.setJumin_no(interpia.getJumin_no1() + "-" + interpia.getJumin_no2());
		interpia.setPhone(interpia.getPhone1() + "-" + interpia.getPhone2() + "-" + interpia.getPhone3());
		interpia.setBirth(interpia.getB_year() + "년" + interpia.getB_month() + "월" + interpia.getB_year() + "일" + "("
				+ interpia.getLunarlift() + ")");

		interpiaService.insert(interpia);

		this.interpiaService.rydbrinsert(interpia);

		response.sendRedirect("main");

	}

	private String getFileDBName(String fileName) throws Exception {

		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);// 오늘 년도 구합니다.
		int month = c.get(Calendar.MONTH) + 1; // 오늘 월 구합니다.
		int date = c.get(Calendar.DATE); // 오늘 일 구합니다.
		String homedir = saveFolder + "/" + year + "-" + month + "-" + date;

		// homedir에 file 객체 생성
		File path1 = new File(homedir);

		if (!path1.isFile()) {

			System.out.println("파일이 존재하지 않아요.");
		}

		if (!(path1.exists())) {

			System.out.println("폴더 만들어요");
			path1.mkdir();// 새로운 폴더를 생성
		}

		// 난수를 구합니다.
		Random r = new Random();
		int random = r.nextInt(100000000);

		// 확장자 구하기 시작
		int index = fileName.lastIndexOf(".");
		// 문자열에서 특정 문자열의 위치 값(index)를 반환한다.
		// indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면,
		// lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환합니다.
		// (파일명에 점이 여러개 있을 경우 맨 마지막에 발견되는 문자열의 위치를 리턴합니다.)

		System.out.println("index = " + index);

		String fileExtension = fileName.substring(index + 1);
		System.out.println("fileExtension = " + fileExtension);
		// 확장자 구하기 끝

		// 새로운 파일명을 만듭니다.
		String refileName = "test" + year + month + date + random + "." + fileExtension;

		System.out.println("refileName = " + refileName);

		// 오라클 디비에 저장될 값
		String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
		System.out.println("fileDBName = " + fileDBName);

		return fileDBName;
	}

	@RequestMapping(value = "update", method = RequestMethod.GET)
	public ModelAndView update(@RequestParam("num") int num, @RequestParam("page") int page) throws Exception {
		System.out.println(num);

		interpia te = this.interpiaService.cont(num);

		String jumin = te.getJumin_no();
		StringTokenizer st1 = new StringTokenizer(jumin, "-");
		String jumin1 = st1.nextToken();// 첫번째
		String jumin2 = st1.nextToken();// 두번째
		te.setJumin_no1(jumin1);
		te.setJumin_no2(jumin2);

		String bith = te.getBirth();
		StringTokenizer st2 = new StringTokenizer(bith, "년|월|일|(|)");
		String year = st2.nextToken();
		String month = st2.nextToken();
		String date = st2.nextToken();
		String lunarlift = st2.nextToken();

		te.setB_year(year);
		te.setB_month(month);
		te.setB_date(date);
		te.setLunarlift(lunarlift);

		String addr = te.getAddr();
		StringTokenizer st3 = new StringTokenizer(addr, " ");
		String addr1 = st3.nextToken();
		String addr2 = st3.nextToken();
		te.setAddr1(addr1);
		te.setAddr2(addr2);

		String phone = te.getPhone();
		StringTokenizer st4 = new StringTokenizer(phone, "-");
		String phone1 = st4.nextToken();
		String phone2 = st4.nextToken();
		String phone3 = st4.nextToken();
		te.setPhone1(phone1);
		te.setPhone2(phone2);
		te.setPhone3(phone3);

		ModelAndView m = new ModelAndView("update");

		m.addObject("test", te);
		m.addObject("page", page);

		return m;
	}

	@RequestMapping(value = "update_ok", method = RequestMethod.POST)
	public ModelAndView update_ok(interpia te, @RequestParam("page") int page, HttpServletResponse response)
			throws Exception {

		System.out.println(te.getNum());

		String name = te.getKor_name();

		MultipartFile uploadfile = te.getPhotoload();
		if (!uploadfile.isEmpty()) {

			// 원래 파일명 구해오기
			String fileName = uploadfile.getOriginalFilename();

			// 원래 파일명 저장
			te.setOriginal(fileName);

			// DB에 저장할 파일명 구해옵니다.
			String fileDBName = getFileDBName(fileName);

			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));

			// 바뀐 파일명으로 저장
			te.setPhotoname(fileDBName);

		} else if (te.getOriginal() != null) {// 변경 하지 않았지만 이전 파일 그대로 인 경우
												// 데이터베이스에 있는 내용 그대로 적용합니다.
			te.setPhotoload(te.getPhotoload());
		} else if (te.getOriginal() == null) {// 파일 제거 선택한 경우

			File DelFile = new File(saveFolder + te.getPhotoload());
			if (DelFile.exists()) {// 기존이진파일이 존재하면
				DelFile.delete();// 기존이진파일 삭제

			}
		}

		te.setAddr(te.getAddr1() + " " + te.getAddr2());
		te.setJumin_no(te.getJumin_no1() + "-" + te.getJumin_no2());
		te.setPhone(te.getPhone1() + "-" + te.getPhone2() + "-" + te.getPhone3());
		te.setBirth(
				te.getB_year() + "년" + te.getB_month() + "월" + te.getB_year() + "일" + "(" + te.getLunarlift() + ")");

		// 초기화
		int limit = 5; // 한 화면에 출력할 레코드 갯수

		int listcount = interpiaService.ListCount(); // 총 리스트 수를 받아옵니다.

		// 총 페이지 수
		int maxpage = (listcount + limit - 1) / limit;

		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21, ...)
		int startpage = ((page - 1) / 10) * 10 + 1;

		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30, ...)
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		this.interpiaService.update(te);

		List<interpia> list = this.interpiaService.slelct(page);

		System.out.println("업데이트완료되었습니다.");
		System.out.println(page);

		ModelAndView m = new ModelAndView("main");
		m.addObject("list", list);
		m.addObject("page", page);
		m.addObject("page", page);
		m.addObject("maxpage", maxpage);
		m.addObject("startpage", startpage);
		m.addObject("endpage", endpage);
		m.addObject("listcount", listcount);

		return m;
	}

	@RequestMapping(value = "rydbr")
	public ModelAndView rydbr(@RequestParam("num") int num, @RequestParam("page") int page) throws Exception {

		interpia te = this.interpiaService.cont(num);
		String name = te.getKor_name();

		System.out.println(name);

		String jumin = te.getJumin_no();
		StringTokenizer st1 = new StringTokenizer(jumin, "-");
		String jumin1 = st1.nextToken();// 첫번째
		String jumin2 = st1.nextToken();// 두번째
		te.setJumin_no1(jumin1);
		te.setJumin_no2(jumin2);

		education list2 = this.interpiaService.select2(name);

		System.out.println(list2.getHighschool());

		if(list2.getHighschool() != null) {
			String highschool = list2.getHighschool();
			StringTokenizer st2 = new StringTokenizer(highschool, "고등학교|과 졸업|년|월");
			list2.setHighname(st2.nextToken());
			list2.setHighand(st2.nextToken());
			list2.setHighyear(st2.nextToken());
			list2.setHighmon(st2.nextToken());

		}

		System.out.println(list2.getJeonsanwon());

		if(list2.getJeonsanwon() != null) {
			String jeonsanwon = list2.getJeonsanwon();
			StringTokenizer st3 = new StringTokenizer(jeonsanwon, "전산원|과 졸업|년|월");
			list2.setJname(st3.nextToken());
			list2.setJand(st3.nextToken());
			list2.setJyear(st3.nextToken());
			list2.setJmon(st3.nextToken());
			System.out.println(list2.getJname());
		}
		
		if(list2.getCollege() != null) {
			String college = list2.getCollege();
			StringTokenizer st4 = new StringTokenizer(college, "전문대학|과 졸업|년|월");
			list2.setCname(st4.nextToken());
			list2.setCand(st4.nextToken());
			list2.setCyear(st4.nextToken());
			list2.setCmon(st4.nextToken());
		}
		
		if (list2.getUniversity() != null) {
			String university = list2.getUniversity();
			StringTokenizer st5 = new StringTokenizer(university, "대학교|과 졸업|년|월");
			list2.setUname(st5.nextToken());
			list2.setUand(st5.nextToken());
			list2.setUyear(st5.nextToken());
			list2.setUmon(st5.nextToken());
		}
		
		ModelAndView m = new ModelAndView("rydbr");
		m.addObject("list2", list2);
		m.addObject("test", te);
		m.addObject("page", page);

		return m;
	}

	@RequestMapping(value = "rydbr_ok", method = RequestMethod.POST)
	public ModelAndView rydbr_ok(education te, @RequestParam("page") int page, HttpServletResponse response)
			throws Exception {

		String name = te.getName();

		System.out.println(te.getJname());

		te.setJumin(te.getJumin1() + "-" + te.getJumin2());
		if (te.getHighname() != "") {
			te.setHighschool(te.getHighname() + "고등학교" + te.getHighand() + "과 졸업" + te.getHighyear() + "년"
					+ te.getHighmon() + "월");
		} else {
			te.setHighschool("");
		}

		if (te.getJname() != "") {

			te.setJeonsanwon(te.getJname() + "전산원" + te.getJand() + "과 졸업" + te.getJyear() + "년" + te.getJmon() + "월");
		} else {
			te.setJeonsanwon("");
		}
		if (te.getCname() != "") {
			te.setCollege(
					te.getCname() + "전문대학" + te.getCand() + "과 졸업" + te.getCyear() + "	년" + te.getCmon() + "월");
		} else {
			te.setCollege("");
		}
		if (te.getUname() != "") {
			te.setUniversity(te.getUname() + "대학교" + te.getUand() + "과 졸업" + te.getUyear() + "년" + te.getUmon() + "월");
		} else {
			te.setUniversity("");
		}
		// 초기화
		int limit = 5; // 한 화면에 출력할 레코드 갯수

		int listcount = interpiaService.ListCount(); // 총 리스트 수를 받아옵니다.

		// 총 페이지 수
		int maxpage = (listcount + limit - 1) / limit;

		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21, ...)
		int startpage = ((page - 1) / 10) * 10 + 1;

		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30, ...)
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		this.interpiaService.rydbrupdate(te);

		List<interpia> list = this.interpiaService.slelct(page);

		System.out.println("업데이트완료되었습니다.");
		System.out.println(page);

		ModelAndView m = new ModelAndView("main");
		m.addObject("list", list);
		m.addObject("page", page);
		m.addObject("page", page);
		m.addObject("maxpage", maxpage);
		m.addObject("startpage", startpage);
		m.addObject("endpage", endpage);
		m.addObject("listcount", listcount);

		return m;
	}

}
