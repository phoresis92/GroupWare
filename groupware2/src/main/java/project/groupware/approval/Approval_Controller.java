package project.groupware.approval;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.Approval_Cate;
import dto.Approval_Dto;
import dto.ApvPayment_Dto;
import dto.Calendar_Cate;
import dto.Calendar_Dto;
import dto.MemDeposit;
import dto.PageInfo;
import project.groupware.calendar.Calendar_Service;
import project.groupware.member.Member;

@Controller
public class Approval_Controller {
	
	@Resource(name="ApvService")
	ApvService apvService;
	
	@Resource(name="Cal_Service")
	private Calendar_Service cal_Service;

	
	//================================================================================================================================================================
	@RequestMapping(value="/approval", method=RequestMethod.GET)
	public String approval(Model model) {
		
		ArrayList<Approval_Cate> apvCateList =  apvService.getAllCate();
		
		model.addAttribute("apvCateList", apvCateList);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 d일");
		
		model.addAttribute("now",sdf.format(new Date()));
		
		return "/approval/writeForm1";
	}
	
	@RequestMapping(value="/approval", method=RequestMethod.POST)
	public String approvalWrite(Approval_Dto dto, HttpServletRequest req, @RequestParam (value="countVacat", required=false) String countVacat ) {
		
		System.out.println(dto.getApproval_startdate());
		System.out.println(dto.getApproval_enddate());
		
		HttpSession session = req.getSession();
		dto.setApproval_member_id(((Member) session.getAttribute("member")).getMember_id());
		
		boolean ck = false;
		
		int seq = 0;
		if(dto.getApproval_id() == 0) {
			seq = apvService.getSeqNum();
			dto.setApproval_id(seq);
			ck = true;
		}
		
		
		if(dto.getApproval_cc().equals("") || dto.getApproval_cc().equals("1_wholeVacat") || dto.getApproval_cc().equals("2_halfVacat_AM") || dto.getApproval_cc().equals("2_halfVacat_PM")) {
		
			if(dto.getApproval_cc().equals("1_wholeVacat")) {
				

				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("approval_member_id", dto.getApproval_member_id());
				map.put("countVacat", countVacat);
				
				int result = apvService.decreVacat(map);
				
				System.out.println("result : "+ result);
				
				
			}else if(dto.getApproval_cc().equals("2_halfVacat_AM") || dto.getApproval_cc().equals("2_halfVacat_PM")) {
				
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("approval_member_id", dto.getApproval_member_id());
				map.put("countVacat", 0.5);
				
				int result = apvService.decreVacat(map);
				
				System.out.println("result : "+ result);
				
			}
			
		String file_path = "C:\\Users\\hushe\\dev\\eclipse-jee-2018-12-R-win32-x86_64\\gware\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\Approval_File\\";

		MultipartFile file = dto.getFile();
		
		
		if(!dto.getFile().getOriginalFilename().equals("")) {

			//String fileName = p.getFile1().getOriginalFilename();
			String fileName = mkFileName(file, dto.getApproval_cate(), seq);
			String path = file_path + fileName;
			File f = new File(path);// 업로드된 파일을 복사할 파일 생성
			// c:/img 폴더에 동일한 이름으로 파일 생성
			try {
				file.transferTo(f);
			}catch(IllegalStateException e) {
				e.printStackTrace();
			}catch(IOException e) {
				e.printStackTrace();
			}
			dto.setApproval_filepath("/Approval_File/"+fileName);
			dto.setApproval_filename(fileName);
			
		}
		
		apvService.deleteTemp(dto.getApproval_id());
		
		int result = apvService.createApv(dto);
		
		System.out.println("insert result : "+result);
		
		/*
		 * String[] arr = dto.getApproval_filename().split("\\)\\)\\)");
		 * System.out.println(arr[0]); System.out.println(arr[1]);
		 */
		}else {
			
			if(ck) { //처음 들어온 임시저장
				int result = apvService.createApv(dto);
				System.out.println("insert result : "+result);
			}else { //재수정 임시저장
				
				System.out.println(dto);
				
				int result = apvService.saveReWrite(dto);
				System.out.println("insert result : "+result);
				
			}
			
		}
		
		return "redirect:/approval";
	}
	
	public String mkFileName(MultipartFile f, int num, int idx ) {
		
		String originFileName = f.getOriginalFilename();
		/*
		 * int dot = originFileName.indexOf("."); String front =
		 * originFileName.substring(0, dot); String back =
		 * originFileName.substring(dot);
		 */
		String returnName = num+"_"+idx+")))"+originFileName;
		return returnName;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/approval/apv_textImg", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public void textImg(HttpServletRequest request, HttpServletResponse response, MultipartFile file) {
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			// 업로드할 폴더 경로
			//String realFolder = request.getSession().getServletContext().getRealPath("profileUpload");
			String realFolder = "C:\\Users\\hushe\\dev\\eclipse-jee-2018-12-R-win32-x86_64\\gware\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\Approval_textImg\\";
			UUID uuid = UUID.randomUUID();
	
			// 업로드할 파일 이름
			String org_filename = file.getOriginalFilename();
			String str_filename = uuid.toString() +")))"+ org_filename;
	
			System.out.println("원본 파일명 : " + org_filename);
			System.out.println("저장할 파일명 : " + str_filename);
	
			String filepath = realFolder + str_filename;
			System.out.println("파일경로 : " + filepath);
	
			File f = new File(filepath);
			if (!f.exists()) {
				f.mkdirs();
			}
			
			file.transferTo(f);
			
			out.println("/Approval_textImg/"+str_filename);
			out.close();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	//========================================================================================================================================================일반결재
	
	@RequestMapping(value="/approval/myApvList", method=RequestMethod.GET)
	public String myApvList(HttpServletRequest req, Model model, @RequestParam (value="page") int page ) {
		
		HttpSession session = req.getSession();
		
		Member mj = (Member) session.getAttribute("member");
		
		ArrayList<Approval_Dto> apvList = null;
		try {
		apvList =  apvService.getMyAllApv(mj.getMember_id());
		
		model.addAttribute("apvList", apvList);
		
		model.addAttribute("auth" , 0);
		
		model.addAttribute("pageInfo", paging(page,apvList));
		
		model.addAttribute("toSearch", "myApvList");
		
		}catch(Exception e) {
			
		}
		return "/approval/myApvList";
		
	} // myApvList end
	

	@RequestMapping(value="/approval/myApvDetail", method=RequestMethod.POST)
	public String approvalDetail(@RequestParam(value="approval_id") int approval_id, @RequestParam(value="auth", required=false) int auth, Model model) {
		
		Approval_Dto dto = apvService.getApvDetail(approval_id);
		
		System.out.println(dto);
		
		System.out.println(dto.getApproval_startdate());
		System.out.println(dto.getApproval_enddate());
		
		model.addAttribute("apvDto", dto);
		model.addAttribute("auth", auth);
		
		if(dto.getApproval_cate() == 1) {
			return "/approval/myApvDetail1";
		}else if(dto.getApproval_cate() == 2) {
			
			return "/approval/myApvDetail2";
		}else if(dto.getApproval_cate() == 3) {
			
			ArrayList<ApvPayment_Dto> list = apvService.getAllPayApv(approval_id);
			model.addAttribute("payList", list);
			
			HashMap<Integer,String> titleMap = new HashMap<Integer,String>();
			titleMap.put(2, "교통비");
			titleMap.put(3, "사무비품");
			titleMap.put(4, "출장비");
			titleMap.put(5, "식대");
			titleMap.put(6, "주유비");
			model.addAttribute("titleMap", titleMap);
			
			HashMap<Integer,String> bankMap = new HashMap<Integer,String>();
			bankMap.put(2, "우리");
			bankMap.put(3, "신한");
			bankMap.put(4, "농협");
			model.addAttribute("bankMap", bankMap);
			
			return "/approval/myApvDetail3";
			
		}
		return "/approval/myApvList";
	}
	
	
	
	@RequestMapping("/approval/down")
	public ModelAndView download(@RequestParam(value="path") String path) throws Exception {
		
		String base_path ="C:/Users/hushe/dev/eclipse-jee-2018-12-R-win32-x86_64/gware/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/webapps";
		
		
		File downloadFile = new File(base_path+path);
		System.out.println(base_path+path);
		System.out.println(downloadFile);
		//param1: 뷰 페이지경로, param2: 뷰 페이지에서 부를 데이터이름, param3: 뷰 페이지로 전달할 값
		return new ModelAndView ("download", "downloadFile", downloadFile);
	}
	
	
	
	@RequestMapping(value="/approval/notAuthApvList", method=RequestMethod.GET)
	public String notAuthApv(HttpServletRequest req, Model model, @RequestParam (value="page") int page ) {
		
		HttpSession session = req.getSession();
		
		Member mj = (Member) session.getAttribute("member");
		
		ArrayList<Approval_Dto> apvList =  apvService.getNotAuthApv(mj.getMember_id());
		model.addAttribute("apvList", apvList);
		
		model.addAttribute("pageInfo", paging(page,apvList));
		
		model.addAttribute("auth" , 1); // 결재  notAuthApvList
		
		model.addAttribute("toSearch", "notAuthApvList");
		
		return "/approval/myApvList";
	} // myApvList end
	
	@ResponseBody
	@RequestMapping(value="/approval/notAuthApvCount", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String notAuthApvCount(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		Member mj = (Member) session.getAttribute("member");
		
		ArrayList<Approval_Dto> apvList =  apvService.getNotAuthApv(mj.getMember_id());
		
		return apvList.size()+"";
	} // myApvList end
	
	
	@RequestMapping(value="/approval/yesAuthApvList", method=RequestMethod.GET)
	public String yesAuthApvList(HttpServletRequest req, Model model, @RequestParam (value="page") int page ) {
		 
		HttpSession session = req.getSession();
		
		Member mj = (Member) session.getAttribute("member");
		
		ArrayList<Approval_Dto> apvList =  apvService.getYesAuthApv(mj.getMember_id());
		model.addAttribute("apvList", apvList);
		
		
		model.addAttribute("pageInfo", paging(page,apvList));
		
		model.addAttribute("auth" , 0); 
		
		model.addAttribute("toSearch", "yesAuthApvList");

		return "/approval/myApvList";
	} // myApvList end
	
	public PageInfo paging(int page, ArrayList apvList) {
		//==========================================================
		
		
		
		int countList = 10; //페이지당 게시물 수
		int countPage = 10; //페이지 수
		int totalCount = 0;
		try {
			totalCount = apvList.size(); // 총 게시물 수
		}catch(Exception e) {
			System.out.println("게시물 없음");
		}
		int totalPage = totalCount / countList; // 총 페이지 수;
		if(totalCount%countList>0) { totalPage++; }
		if(totalPage < page) { page = totalPage; }
		
		int startPage = ((page-1)  / countPage ) * countPage + 1; 
		int endPage = startPage + countPage - 1;
		if (endPage > totalPage) { endPage = totalPage; }
		
		//==========================================================
		
		int startNum = (page-1) * countList +1;
		int endNum = page * countList;
		
		//ArrayList<BoardBean> boardList = boardListService.getboardlist(startNum , endNum);
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setTotalPage(totalPage);
		pageInfo.setCountList(countList);
		if(totalCount != 0) {
			startNum--;
			endNum--;
		}
		pageInfo.setStartNum(startNum);
		pageInfo.setEndNum(endNum);
		pageInfo.setTotalCount(totalCount);
		
		return pageInfo;
	}

	
	//===================================================================================================================================결재
	@RequestMapping("/approval/approve")
	public String approve(@RequestParam(value="where") int where, @RequestParam(value="what") int what, @RequestParam(value="approval_id") int approval_id, @RequestParam(value="why", required=false) String why) {
		
		System.out.println(where);
		System.out.println(what);
		System.out.println(approval_id);
		System.out.println(why);
		
		Approval_Dto dto = apvService.getApvDetail(approval_id);
		System.out.println(dto);
		String cc = dto.getApproval_cc();
		
		int end = 0;
		if(dto.getApproval_mem2() == null || dto.getApproval_mem2() == "") {
			end = 1;
		}else if(dto.getApproval_mem3() == null || dto.getApproval_mem3() == "") {
			end = 2;
		}else {
			end = 3;
		}
		
		
		try {
		if(cc.equals("1_wholeVacat") && what == 2) {
			Date sd = dto.getApproval_startdate();
			Date ed = dto.getApproval_enddate();
			long calDate = sd.getTime() - ed.getTime(); 
			long calDateDays = calDate / ( 24*60*60*1000); 
			calDateDays = Math.abs(calDateDays);
			
			System.out.println("calDateDays"+ calDateDays);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("approval_member_id", dto.getApproval_member_id());
			map.put("countVacat", calDateDays+1);
			
			int result = apvService.recoverVacat(map);
			System.out.println(result);
		}else if((cc.equals("2_halfVacat_AM") || cc.equals("2_halfVacat_PM") ) && what == 2) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("approval_member_id", dto.getApproval_member_id());
			map.put("countVacat", 0.5);
			
			int result = apvService.recoverVacat(map);
			System.out.println(result);
		}
		
		if(cc.equals("1_wholeVacat") && what == 1 && end == where) {
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			
			Calendar_Dto calDto = new Calendar_Dto();
			calDto.setCalendar_allDay(1);
			Calendar_Cate cal_cate = cal_Service.getVacatNum("연차");
			calDto.setCalendar_cate(cal_cate.getCal_cate_id());
			calDto.setCalendar_color(cal_cate.getCal_cate_color());
			calDto.setCalendar_content("<p>연차 결재승인 완료</p>");
			calDto.setCalendar_title("연차");
			calDto.setCalendar_member_id(dto.getApproval_member_id());
			calDto.setCalendar_start(sdf.format(dto.getApproval_startdate()));
			calDto.setCalendar_end(sdf.format(dto.getApproval_enddate()));
			cal_Service.addCal(calDto);
			System.out.println("calDto: " + calDto);
		}else if(cc.equals("2_halfVacat_AM") && what == 1 && end == where) {
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String st = sdf.format(dto.getApproval_startdate());
			String en = sdf.format(dto.getApproval_enddate());
			
			Calendar_Dto calDto = new Calendar_Dto();
			calDto.setCalendar_allDay(0);
			Calendar_Cate cal_cate = cal_Service.getVacatNum("반차");
			calDto.setCalendar_cate(cal_cate.getCal_cate_id());
			calDto.setCalendar_color(cal_cate.getCal_cate_color());
			calDto.setCalendar_content("<p>반차 결재승인 완료</p>");
			calDto.setCalendar_title("반차");
			calDto.setCalendar_member_id(dto.getApproval_member_id());
			calDto.setCalendar_start(st + " " + "09:00:00");
			calDto.setCalendar_end(en + " " + "13:00:00");
			cal_Service.addCal(calDto);
			System.out.println("calDto: " + calDto);
			
		}else if(cc.equals("2_halfVacat_PM") && what == 1 && end == where) {
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String st = sdf.format(dto.getApproval_startdate());
			String en = sdf.format(dto.getApproval_enddate());
			
			Calendar_Dto calDto = new Calendar_Dto();
			calDto.setCalendar_allDay(0);
			Calendar_Cate cal_cate = cal_Service.getVacatNum("반차");
			calDto.setCalendar_cate(cal_cate.getCal_cate_id());
			calDto.setCalendar_color(cal_cate.getCal_cate_color());
			calDto.setCalendar_content("<p>반차 결재승인 완료</p>");
			calDto.setCalendar_title("반차");
			calDto.setCalendar_member_id(dto.getApproval_member_id());
			calDto.setCalendar_start(st + " " + "14:00:00");
			calDto.setCalendar_end(en + " " + "18:00:00");
			cal_Service.addCal(calDto);
			System.out.println("calDto: " + calDto);
			
		}
		
		}catch(Exception e) {
			
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("approval_id", approval_id);
		map.put("what", what);
		map.put("why", why);
		map.put("end", end);
		
		int result = 0;
		
		if(where == 1) {
			result = apvService.authApv1(map);
		}
		if(where == 2) {
			result = apvService.authApv2(map);
		}
		if(where == 3) {
			result = apvService.authApv3(map);
		}
		
		System.out.println(result);
		return "redirect:/approval/notAuthApvList?page=1";
	}
	
	
	@RequestMapping(value="/approval/tempApvList", method=RequestMethod.GET)
	public String tempApvList(HttpServletRequest req, Model model, @RequestParam (value="page") int page ) {
		
		HttpSession session = req.getSession();
		
		Member mj = (Member) session.getAttribute("member");
		
		ArrayList<Approval_Dto> apvList =  apvService.getTempApvList(mj.getMember_id());
		model.addAttribute("apvList", apvList);
		
		model.addAttribute("pageInfo", paging(page,apvList));
		
		model.addAttribute("auth" , 2);
		
		model.addAttribute("toSearch", "tempApvList");
		
		return "/approval/myApvList";
	} // myApvList end
	
	
	@RequestMapping(value="/approval/reWrite", method=RequestMethod.POST)
	public String reWrite(@RequestParam(value="approval_id") int approval_id, Model model, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		Member m = (Member) session.getAttribute("member");
		
		Approval_Dto apv =  apvService.getApvDetail(approval_id);
		
		model.addAttribute("apvReWrite", apv);
		
		System.out.println("this is reWrite"+apv);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 d일");
		SimpleDateFormat sdf2 = new SimpleDateFormat("MM/dd/yyyy");
		
		model.addAttribute("now",sdf.format(new Date()));
		
		if(apv.getApproval_auth1() == 2 || apv.getApproval_auth2() == 2 || apv.getApproval_auth3() == 2) {
			model.addAttribute("isReturn", 1); //재상신의 경우 저장 불가
		}else {
			model.addAttribute("isReturn", 0);
		}
		
		if(apv.getApproval_cate() == 1) {
			return "/approval/writeForm1";
		}else if(apv.getApproval_cate() == 2) {
			
			
			Date en = apv.getApproval_enddate();
			long te = en.getTime() - ( 24*60*60*1000);
			en = new Date(te);
			
			model.addAttribute("stdate", sdf2.format(apv.getApproval_startdate()));
			model.addAttribute("endate", sdf2.format(en));
			
			System.out.println(sdf2.format(apv.getApproval_startdate()));
			System.out.println(sdf2.format(apv.getApproval_enddate()));
			
			
			return "/approval/writeForm2";
		}else if(apv.getApproval_cate() == 3) {
			
			MemDeposit depo = apvService.getDeposit(m.getMember_id());
			model.addAttribute("deposit", depo);
			
			ArrayList<ApvPayment_Dto> payList =  apvService.getAllPayApv(approval_id);
			
			
			JSONArray jArr = new JSONArray();
			for(ApvPayment_Dto pay : payList) {
				JSONObject jObj = new JSONObject();
				jObj.put("pay_date", sdf2.format(pay.getPay_date()));
				jObj.put("pay_title", pay.getPay_title());
				jObj.put("pay_cash", pay.getPay_cash());
				jObj.put("pay_bank", pay.getPay_bank());
				jObj.put("pay_deposit", pay.getPay_deposit());
				jObj.put("pay_dpowner", pay.getPay_dpowner());
				jObj.put("pay_comment", pay.getPay_comment());
				jArr.add(jObj);
			}
			model.addAttribute("payList", jArr);
			
			return "/approval/writeForm3";
		}
		
		return "/approval";
	}
	
	@RequestMapping(value="/approval/deleteTemp", method=RequestMethod.POST)
	public String deleteTemp(@RequestParam(value="approval_id") int approval_id, @RequestParam(value="auth", required=false) int auth) {
		
		int result =  apvService.deleteTemp(approval_id);
		
		System.out.println("result : "+result);
		
		if(auth == 3) {//관리자 결재 삭제 후 
			return "/approval/writeForm1";
		}
		
		return "/approval/writeForm1";
		
	}
	
	
	@RequestMapping(value="/approval/delWant", method=RequestMethod.POST)
	public String delWant(@RequestParam(value="approval_id") int approval_id, @RequestParam(value="approval_cc") String approval_cc) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("approval_id", approval_id);
		map.put("approval_cc", "wantToDel_"+approval_cc);
		
		int result =  apvService.delWant(map);
		
		System.out.println("result : "+result);
		
		return "/approval/writeForm1";
	}
	
	
//==================================================================================================================================================================================휴가결재
	@RequestMapping(value="/apv_Vacat", method=RequestMethod.GET)
	public String apv_Vacat(Model model) {
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 d일");
		
		model.addAttribute("now",sdf.format(new Date()));
		
		return "/approval/writeForm2";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/apv_Vacat/getVacation", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String getVacation(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		Member mj = (Member) session.getAttribute("member");
		
		double result =  apvService.getMember_vacation(mj.getMember_id());
		
		return result+"";
	} // myApvList end
	
	
//==================================================================================================================================================================================지출결재
	
	@RequestMapping(value="/apv_payment", method=RequestMethod.GET)
	public String apv_payment(HttpServletRequest req ,Model model) {
		
		HttpSession session = req.getSession();
		
		Member m = (Member) session.getAttribute("member");
		
		//ToDo
		//member Join 가져 올 것
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 d일");
		model.addAttribute("now",sdf.format(new Date()));
		
		MemDeposit depo = apvService.getDeposit(m.getMember_id());
		model.addAttribute("deposit", depo);
		
		System.out.println(depo);
		
		return "/approval/writeForm3";
		
	}
	
	@RequestMapping(value="/apv_payment/approval", method=RequestMethod.POST)
	public String payment_approval(Approval_Dto dto, @RequestParam(value="maxCount") int maxCount, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		dto.setApproval_member_id(((Member) session.getAttribute("member")).getMember_id());
		
		
		boolean ck = false;
		int seq = 0;
		if(dto.getApproval_id() == 0) {
			seq = apvService.getSeqNum();
			dto.setApproval_id(seq);
			ck = true;
		}
		
		String file_path = "C:\\Users\\hushe\\dev\\eclipse-jee-2018-12-R-win32-x86_64\\gware\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\Approval_File\\";

		MultipartFile file = dto.getFile();
		
		
		if(!dto.getFile().getOriginalFilename().equals("")) {

			//String fileName = p.getFile1().getOriginalFilename();
			String fileName = mkFileName(file, dto.getApproval_cate(), seq);
			String path = file_path + fileName;
			File f = new File(path);// 업로드된 파일을 복사할 파일 생성
			// c:/img 폴더에 동일한 이름으로 파일 생성
			try {
				file.transferTo(f);
			}catch(IllegalStateException e) {
				e.printStackTrace();
			}catch(IOException e) {
				e.printStackTrace();
			}
			dto.setApproval_filepath("/Approval_File/"+fileName);
			dto.setApproval_filename(fileName);
			
		}
		
		System.out.println(dto);
		
		int createResult = 0;
		if(ck) {
		createResult = apvService.createApv(dto);
		}
		
		System.out.println("insert result : "+ createResult);
		
		ArrayList<ApvPayment_Dto> list = new ArrayList<ApvPayment_Dto>();
		for(int i = 0 ; i < maxCount ; i++) {
			ApvPayment_Dto pay = new ApvPayment_Dto();
			
			if(ck) {
			pay.setApproval_id(seq);
			}else {
				pay.setApproval_id(dto.getApproval_id());
			}
			pay.setPay_date(new Date(req.getParameter("pay_date"+i)));
			pay.setPay_title(Integer.parseInt(req.getParameter("pay_title"+i).substring(1)));
			pay.setPay_cash(Integer.parseInt(req.getParameter("pay_cash"+i)));
			pay.setPay_bank(Integer.parseInt(req.getParameter("pay_bank"+i).substring(1)));
			pay.setPay_deposit(req.getParameter("pay_deposit"+i));
			pay.setPay_dpowner(req.getParameter("pay_dpowner"+i));
			pay.setPay_comment(req.getParameter("pay_comment"+i));
			
			int modiResult = 0;
			if(i == 0) {
				modiResult = apvService.dropApv_pay(pay);
				System.out.println("pay modify : "+ modiResult);
			}
			createResult = apvService.createApv_pay(pay);
			
			System.out.println("pay insert : "+ createResult);
			
			list.add(pay);
		}
		
		
		System.out.println(list);
		

		
		return "/member/main";
	}; // payment_approval end
	
	//======================================================================================================================================================================== Apv List 

	
	@RequestMapping(value="/apvList/search", method=RequestMethod.POST)
	public String search(HttpServletRequest req, Model model, @RequestParam (value="page") int page) {
		
		HttpSession session = req.getSession();
		Member mj = (Member) session.getAttribute("member");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", mj.getMember_id());
		
		String length = req.getParameter("length");
		System.out.println(length);
		map.put("length", length);
		
		try {
			int cate1 = Integer.parseInt(req.getParameter("cate1"));
			System.out.println(cate1);
			map.put("cate1", cate1);
		}catch(Exception e) {
			map.put("cate1", null);
		}
		try {
			int cate2 = Integer.parseInt(req.getParameter("cate2"));
			System.out.println(cate2);
			map.put("cate2", cate2);
		}catch(Exception e) {
			map.put("cate2", null);
		}
		try {
			int cate3 = Integer.parseInt(req.getParameter("cate3"));
			System.out.println(cate3);
			map.put("cate3", cate3);
		}catch(Exception e) {
			map.put("cate3", null);
		}
		String condition = req.getParameter("condition");
		System.out.println(condition);
		map.put("condition", condition);
		
		String word = req.getParameter("word");
		System.out.println(word);
		if(condition.equals("apvNum")) {
			try {
				System.out.println(Integer.parseInt(word));
				map.put("word", Integer.parseInt(word));
			}catch(Exception e) {
				
			}
		}else {
			map.put("word", "%"+word+"%");
		}
		
		ArrayList<Approval_Dto> list = null;
		String toSearch = req.getParameter("toSearch");
		if(toSearch.equals("myApvList")) {
			list = apvService.getSearchmyApvList(map);
			model.addAttribute("auth" , 0); 
			model.addAttribute("toSearch" , "myApvList"); 
		}else if(toSearch.equals("tempApvList")) {
			list = apvService.getSearchtempApvList(map);
			model.addAttribute("auth" , 2);
			model.addAttribute("toSearch" , "tempApvList"); 
		}else if(toSearch.equals("yesAuthApvList")) {
			list = apvService.getSearchyesAuthApvList(map);
			model.addAttribute("auth" , 0); // 결재  notAuthApvList
			model.addAttribute("toSearch" , "yesAuthApvList"); 
		}else if(toSearch.equals("allApvList")) {
			list = apvService.getSearchallApvList(map);
			model.addAttribute("auth" , 0); // 결재  notAuthApvList
			model.addAttribute("toSearch" , "allApvList"); 
		}else if(toSearch.equals("apvDelList")) {
			list = apvService.getSearchapvDelList(map);
			model.addAttribute("auth" , 3); // 결재  notAuthApvList
			model.addAttribute("toSearch" , "apvDelList"); 
		}
		
		
		model.addAttribute("apvList", list);
		
		model.addAttribute("pageInfo", paging(page, list));
		
		
		map.put("word", word);
		model.addAttribute("map", map);
		
		return "/approval/myApvList";
		
/*		JSONArray jarr = new JSONArray();
		for(Approval_Dto apv : list) {
			
		
		String result = "";
		
		String member_name1 = apv.getMember_name1();
		String member_name2 = apv.getMember_name2();
		String member_name3 = apv.getMember_name3();
		
		int approval_auth1 = apv.getApproval_auth1();
		int approval_auth2 = apv.getApproval_auth2();
		int approval_auth3 = apv.getApproval_auth3();
		
		String apv_auth_name1 = apv.getApv_auth_name1();
		String apv_auth_name2 = apv.getApv_auth_name2();
		String apv_auth_name3 = apv.getApv_auth_name3();
		
		if(member_name3 == null || approval_auth3 == 3 || approval_auth3 == 4) {
			if(member_name2 == null || approval_auth2 == 3 || approval_auth2 == 4) {
				result = apv_auth_name1;
			}else if(approval_auth2 == 0 || approval_auth1 == 0) {
				result = apv_auth_name1;
			}else if(approval_auth2 == 4) {
				result = apv_auth_name1;
			}else {
				result = apv_auth_name2;
			}
		}else if(approval_auth2 == 0) {
			result = apv_auth_name1;
		}else if(approval_auth2 == 3 && approval_auth1 == 0) {
			result = apv_auth_name1;
		}else {
			result = apv_auth_name3;
		}
			
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
			JSONObject jobj = new JSONObject();
			jobj.put("approval_id", apv.getApproval_id());
			jobj.put("member_name", apv.getMember_name());
			jobj.put("approval_title", apv.getApproval_title());
			jobj.put("apv_cate_name", apv.getApv_cate_name());
			jobj.put("approval_auth", result);
			jobj.put("approval_indate", sdf.format(apv.getApproval_indate()));
			
			jarr.add(jobj);
		}
		
		
		return jarr.toJSONString();*/
	} // search end
	
	
	
	@RequestMapping("/apv_payment/statistics")
	public ModelAndView payment_approval() {
		ModelAndView mav = new ModelAndView("/manager/statistics3");
		for (int i = 2; i < 6; i++) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("pay_title", i);
			ArrayList<ApvPayment_Dto> list = apvService.getPayTitle(map);
			mav.addObject("title_"+i, list);			
		}
		return mav;
	}

	
}
