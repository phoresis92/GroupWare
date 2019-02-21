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
import dto.PageInfo;
import project.groupware.member.MemberJoin;

@Controller
public class Approval_Controller {
	
	@Resource(name="ApvService")
	ApvService apvService;

	@RequestMapping(value="/approval", method=RequestMethod.GET)
	public String approval(Model model) {
		
		ArrayList<Approval_Cate> apvCateList =  apvService.getAllCate();
		
		model.addAttribute("apvCateList", apvCateList);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 d일");
		
		model.addAttribute("now",sdf.format(new Date()));
		
		return "/approval/writeForm1";
	}
	
	@RequestMapping(value="/approval", method=RequestMethod.POST)
	public String approvalWrite(Approval_Dto dto, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		dto.setApproval_member_id(((MemberJoin) session.getAttribute("member")).getMember_id());
		
		boolean ck = false;
		
		int seq = 0;
		if(dto.getApproval_id() == 0) {
			seq = apvService.getSeqNum();
			dto.setApproval_id(seq);
			ck = true;
		}
		
		if(dto.getApproval_cc().equals("")) {
		
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
		
		try {
		apvService.deleteTemp(dto.getApproval_id());
		}catch(Exception e) {
			
		}
		
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
	
	
	@RequestMapping(value="/approval/myApvList", method=RequestMethod.GET)
	public String myApvList(HttpServletRequest req, Model model, @RequestParam (value="page") int page ) {
		
		HttpSession session = req.getSession();
		
		MemberJoin mj = (MemberJoin) session.getAttribute("member");
		
		ArrayList<Approval_Dto> apvList =  apvService.getMyAllApv(mj.getMember_id());
		model.addAttribute("apvList", apvList);
		
		model.addAttribute("auth" , 0);
		
		model.addAttribute("pageInfo", paging(page,apvList));
		
		return "/approval/myApvList";
		
	} // myApvList end
	

	@RequestMapping(value="/approval/myApvDetail", method=RequestMethod.POST)
	public String approvalDetail(@RequestParam(value="approval_id") int approval_id, @RequestParam(value="auth", required=false) int auth, Model model) {
		
		Approval_Dto dto = apvService.getApvDetail(approval_id);
		
		System.out.println(dto);
		
		model.addAttribute("apvDto", dto);
		model.addAttribute("auth", auth);
		
		return "/approval/myApvDetail";
		
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
		
		MemberJoin mj = (MemberJoin) session.getAttribute("member");
		
		ArrayList<Approval_Dto> apvList =  apvService.getNotAuthApv(mj.getMember_id());
		model.addAttribute("apvList", apvList);
		
		model.addAttribute("pageInfo", paging(page,apvList));
		
		model.addAttribute("auth" , 1);
		
		return "/approval/myApvList";
	} // myApvList end
	
	@ResponseBody
	@RequestMapping(value="/approval/notAuthApvCount", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String notAuthApvCount(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		MemberJoin mj = (MemberJoin) session.getAttribute("member");
		
		ArrayList<Approval_Dto> apvList =  apvService.getNotAuthApv(mj.getMember_id());
		
		return apvList.size()+"";
	} // myApvList end
	
	
	@RequestMapping(value="/approval/yesAuthApvList", method=RequestMethod.GET)
	public String yesAuthApvList(HttpServletRequest req, Model model, @RequestParam (value="page") int page ) {
		
		HttpSession session = req.getSession();
		
		MemberJoin mj = (MemberJoin) session.getAttribute("member");
		
		ArrayList<Approval_Dto> apvList =  apvService.getYesAuthApv(mj.getMember_id());
		model.addAttribute("apvList", apvList);
		
		
		model.addAttribute("pageInfo", paging(page,apvList));
		
		model.addAttribute("auth" , 0);
		
		return "/approval/myApvList";
	} // myApvList end
	
	public PageInfo paging(int page, ArrayList apvList) {
		//==========================================================
		
		
		
		int countList = 10; //페이지당 게시물 수
		int countPage = 10; //페이지 수
		
		
		int totalCount = apvList.size(); // 총 게시물 수
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

	@RequestMapping("/approval/approve")
	public String approve(@RequestParam(value="where") int where, @RequestParam(value="what") int what, @RequestParam(value="approval_id") int approval_id, @RequestParam(value="why") String why) {
		
		System.out.println(where);
		System.out.println(what);
		System.out.println(approval_id);
		System.out.println(why);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("approval_id", approval_id);
		map.put("what", what);
		map.put("why", why);
		
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
		
		MemberJoin mj = (MemberJoin) session.getAttribute("member");
		
		ArrayList<Approval_Dto> apvList =  apvService.getTempApvList(mj.getMember_id());
		model.addAttribute("apvList", apvList);
		
		model.addAttribute("pageInfo", paging(page,apvList));
		
		model.addAttribute("auth" , 2);
		
		return "/approval/myApvList";
	} // myApvList end
	
	
	@RequestMapping(value="/approval/reWrite", method=RequestMethod.POST)
	public String reWrite(@RequestParam(value="approval_id") int approval_id, Model model) {
		
		Approval_Dto apv =  apvService.getApvDetail(approval_id);
		
		model.addAttribute("apvReWrite", apv);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 d일");
		
		model.addAttribute("now",sdf.format(new Date()));
		
		return "/approval/writeForm1";
	}
	
	@RequestMapping(value="/approval/deleteTemp", method=RequestMethod.POST)
	public String deleteTemp(@RequestParam(value="approval_id") int approval_id) {
		
		int result =  apvService.deleteTemp(approval_id);
		
		System.out.println("result : "+result);
		
		return "/approval/writeForm1";
	}
	
	
	
}