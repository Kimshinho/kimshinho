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

		// �ʱ�ȭ
		int limit = 5; // �� ȭ�鿡 ����� ���ڵ� ����

		int listcount = this.interpiaService.ListCount(); // �� ����Ʈ ���� �޾ƿɴϴ�.

		// �� ������ ��
		int maxpage = (listcount + limit - 1) / limit;

		// ���� �������� ������ ���� ������ ��(1, 11, 21, ...)
		int startpage = ((page - 1) / 10) * 10 + 1;

		// ���� �������� ������ ������ ������ ��(10, 20, 30, ...)
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		List<interpia> list = this.interpiaService.slelct(page);// ����Ʈ�� �޾ƿɴϴ�.

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

		// �ʱ�ȭ
		int limit = 5; // �� ȭ�鿡 ����� ���ڵ� ����

		int selectcount = interpiaService.selectListCount(m); // �� ����Ʈ ���� �޾ƿɴϴ�.

		System.out.println(selectcount);
		// �� ������ ��
		int maxpage = (selectcount + limit - 1) / limit;

		// ���� �������� ������ ���� ������ ��(1, 11, 21, ...)
		int startpage = ((page - 1) / 10) * 10 + 1;

		// ���� �������� ������ ������ ������ ��(10, 20, 30, ...)
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		List<interpia> list = this.interpiaService.slelctlist(m);// ����Ʈ�� �޾ƿɴϴ�.

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
		System.out.println("���ó��������");

		MultipartFile uploadfile = interpia.getPhotoload();
		if (!uploadfile.isEmpty()) {

			// ���� ���ϸ� ���ؿ���
			String fileName = uploadfile.getOriginalFilename();

			// ���� ���ϸ� ����
			interpia.setOriginal(fileName);

			// DB�� ������ ���ϸ� ���ؿɴϴ�.
			String fileDBName = getFileDBName(fileName);

			// transferTo(File path) : ���ε��� ������ �Ű������� ��ο� �����մϴ�.
			uploadfile.transferTo(new File(saveFolder + fileDBName));

			// �ٲ� ���ϸ����� ����
			interpia.setPhotoname(fileDBName);
		}

		interpia.setAddr(interpia.getAddr1() + " " + interpia.getAddr2());
		interpia.setJumin_no(interpia.getJumin_no1() + "-" + interpia.getJumin_no2());
		interpia.setPhone(interpia.getPhone1() + "-" + interpia.getPhone2() + "-" + interpia.getPhone3());
		interpia.setBirth(interpia.getB_year() + "��" + interpia.getB_month() + "��" + interpia.getB_year() + "��" + "("
				+ interpia.getLunarlift() + ")");

		interpiaService.insert(interpia);

		this.interpiaService.rydbrinsert(interpia);

		response.sendRedirect("main");

	}

	private String getFileDBName(String fileName) throws Exception {

		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);// ���� �⵵ ���մϴ�.
		int month = c.get(Calendar.MONTH) + 1; // ���� �� ���մϴ�.
		int date = c.get(Calendar.DATE); // ���� �� ���մϴ�.
		String homedir = saveFolder + "/" + year + "-" + month + "-" + date;

		// homedir�� file ��ü ����
		File path1 = new File(homedir);

		if (!path1.isFile()) {

			System.out.println("������ �������� �ʾƿ�.");
		}

		if (!(path1.exists())) {

			System.out.println("���� ������");
			path1.mkdir();// ���ο� ������ ����
		}

		// ������ ���մϴ�.
		Random r = new Random();
		int random = r.nextInt(100000000);

		// Ȯ���� ���ϱ� ����
		int index = fileName.lastIndexOf(".");
		// ���ڿ����� Ư�� ���ڿ��� ��ġ ��(index)�� ��ȯ�Ѵ�.
		// indexOf�� ó�� �߰ߵǴ� ���ڿ��� ���� index�� ��ȯ�ϴ� �ݸ�,
		// lastIndexOf�� ���������� �߰ߵǴ� ���ڿ��� index�� ��ȯ�մϴ�.
		// (���ϸ� ���� ������ ���� ��� �� �������� �߰ߵǴ� ���ڿ��� ��ġ�� �����մϴ�.)

		System.out.println("index = " + index);

		String fileExtension = fileName.substring(index + 1);
		System.out.println("fileExtension = " + fileExtension);
		// Ȯ���� ���ϱ� ��

		// ���ο� ���ϸ��� ����ϴ�.
		String refileName = "test" + year + month + date + random + "." + fileExtension;

		System.out.println("refileName = " + refileName);

		// ����Ŭ ��� ����� ��
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
		String jumin1 = st1.nextToken();// ù��°
		String jumin2 = st1.nextToken();// �ι�°
		te.setJumin_no1(jumin1);
		te.setJumin_no2(jumin2);

		String bith = te.getBirth();
		StringTokenizer st2 = new StringTokenizer(bith, "��|��|��|(|)");
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

			// ���� ���ϸ� ���ؿ���
			String fileName = uploadfile.getOriginalFilename();

			// ���� ���ϸ� ����
			te.setOriginal(fileName);

			// DB�� ������ ���ϸ� ���ؿɴϴ�.
			String fileDBName = getFileDBName(fileName);

			// transferTo(File path) : ���ε��� ������ �Ű������� ��ο� �����մϴ�.
			uploadfile.transferTo(new File(saveFolder + fileDBName));

			// �ٲ� ���ϸ����� ����
			te.setPhotoname(fileDBName);

		} else if (te.getOriginal() != null) {// ���� ���� �ʾ����� ���� ���� �״�� �� ���
												// �����ͺ��̽��� �ִ� ���� �״�� �����մϴ�.
			te.setPhotoload(te.getPhotoload());
		} else if (te.getOriginal() == null) {// ���� ���� ������ ���

			File DelFile = new File(saveFolder + te.getPhotoload());
			if (DelFile.exists()) {// �������������� �����ϸ�
				DelFile.delete();// ������������ ����

			}
		}

		te.setAddr(te.getAddr1() + " " + te.getAddr2());
		te.setJumin_no(te.getJumin_no1() + "-" + te.getJumin_no2());
		te.setPhone(te.getPhone1() + "-" + te.getPhone2() + "-" + te.getPhone3());
		te.setBirth(
				te.getB_year() + "��" + te.getB_month() + "��" + te.getB_year() + "��" + "(" + te.getLunarlift() + ")");

		// �ʱ�ȭ
		int limit = 5; // �� ȭ�鿡 ����� ���ڵ� ����

		int listcount = interpiaService.ListCount(); // �� ����Ʈ ���� �޾ƿɴϴ�.

		// �� ������ ��
		int maxpage = (listcount + limit - 1) / limit;

		// ���� �������� ������ ���� ������ ��(1, 11, 21, ...)
		int startpage = ((page - 1) / 10) * 10 + 1;

		// ���� �������� ������ ������ ������ ��(10, 20, 30, ...)
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		this.interpiaService.update(te);

		List<interpia> list = this.interpiaService.slelct(page);

		System.out.println("������Ʈ�Ϸ�Ǿ����ϴ�.");
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
		String jumin1 = st1.nextToken();// ù��°
		String jumin2 = st1.nextToken();// �ι�°
		te.setJumin_no1(jumin1);
		te.setJumin_no2(jumin2);

		education list2 = this.interpiaService.select2(name);

		System.out.println(list2.getHighschool());

		if(list2.getHighschool() != null) {
			String highschool = list2.getHighschool();
			StringTokenizer st2 = new StringTokenizer(highschool, "����б�|�� ����|��|��");
			list2.setHighname(st2.nextToken());
			list2.setHighand(st2.nextToken());
			list2.setHighyear(st2.nextToken());
			list2.setHighmon(st2.nextToken());

		}

		System.out.println(list2.getJeonsanwon());

		if(list2.getJeonsanwon() != null) {
			String jeonsanwon = list2.getJeonsanwon();
			StringTokenizer st3 = new StringTokenizer(jeonsanwon, "�����|�� ����|��|��");
			list2.setJname(st3.nextToken());
			list2.setJand(st3.nextToken());
			list2.setJyear(st3.nextToken());
			list2.setJmon(st3.nextToken());
			System.out.println(list2.getJname());
		}
		
		if(list2.getCollege() != null) {
			String college = list2.getCollege();
			StringTokenizer st4 = new StringTokenizer(college, "��������|�� ����|��|��");
			list2.setCname(st4.nextToken());
			list2.setCand(st4.nextToken());
			list2.setCyear(st4.nextToken());
			list2.setCmon(st4.nextToken());
		}
		
		if (list2.getUniversity() != null) {
			String university = list2.getUniversity();
			StringTokenizer st5 = new StringTokenizer(university, "���б�|�� ����|��|��");
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
			te.setHighschool(te.getHighname() + "����б�" + te.getHighand() + "�� ����" + te.getHighyear() + "��"
					+ te.getHighmon() + "��");
		} else {
			te.setHighschool("");
		}

		if (te.getJname() != "") {

			te.setJeonsanwon(te.getJname() + "�����" + te.getJand() + "�� ����" + te.getJyear() + "��" + te.getJmon() + "��");
		} else {
			te.setJeonsanwon("");
		}
		if (te.getCname() != "") {
			te.setCollege(
					te.getCname() + "��������" + te.getCand() + "�� ����" + te.getCyear() + "	��" + te.getCmon() + "��");
		} else {
			te.setCollege("");
		}
		if (te.getUname() != "") {
			te.setUniversity(te.getUname() + "���б�" + te.getUand() + "�� ����" + te.getUyear() + "��" + te.getUmon() + "��");
		} else {
			te.setUniversity("");
		}
		// �ʱ�ȭ
		int limit = 5; // �� ȭ�鿡 ����� ���ڵ� ����

		int listcount = interpiaService.ListCount(); // �� ����Ʈ ���� �޾ƿɴϴ�.

		// �� ������ ��
		int maxpage = (listcount + limit - 1) / limit;

		// ���� �������� ������ ���� ������ ��(1, 11, 21, ...)
		int startpage = ((page - 1) / 10) * 10 + 1;

		// ���� �������� ������ ������ ������ ��(10, 20, 30, ...)
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		this.interpiaService.rydbrupdate(te);

		List<interpia> list = this.interpiaService.slelct(page);

		System.out.println("������Ʈ�Ϸ�Ǿ����ϴ�.");
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
