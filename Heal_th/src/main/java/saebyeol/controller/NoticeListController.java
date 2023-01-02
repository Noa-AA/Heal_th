package saebyeol.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import saebyeol.dto.Criteria;
import saebyeol.dto.Notice;
import saebyeol.dto.Page;
import saebyeol.service.face.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeListController {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//서비스 객체
	@Autowired NoticeService noticeService;
	
	@RequestMapping("/list")
	public void list(Model model, Criteria cri ) {
		logger.info("list 페이지---");
		
		model.addAttribute("list", noticeService.getPaging(cri));
		
		int total = noticeService.getTotal(cri);
		
		Page page = new Page(cri, total);
		
		model.addAttribute("page", page);
	 
	}
	
	@RequestMapping("/view")
	public String view(Notice viewNotice, Model model) {
		logger.info("/notice/write");
		
		viewNotice = noticeService.view(viewNotice);
		
		model.addAttribute("viewNotice",viewNotice);
		
		return "notice/view";
		
		
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite(Model model) {
		
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Notice notice, RedirectAttributes rttr) {
		
		noticeService.write(notice);
		
		rttr.addFlashAttribute("result", "write success");
		
		return "redirect:/notice/list";
		
	}
	
	@GetMapping("/update")
	public String update(Notice notice, Model model) {
		notice = noticeService.view(notice);
		
		model.addAttribute("updateNotice", notice);
		
		return "notice/update";
	}
	
	@PostMapping("/update")
	public String updateProcess(Notice notice, RedirectAttributes rttr) {
		logger.info("{}",notice);
		noticeService.update(notice);
		rttr.addFlashAttribute("result", "update success");
		
		return "redirect:/notice/view?noticeNo=" + notice.getNoticeNo();
	}
	
	@RequestMapping("/delete")
	public String delete(Notice notice, RedirectAttributes rttr) {
		noticeService.delete(notice);
		rttr.addFlashAttribute("result", "delete success");
		
		return "redirect:/notice/list";
	}

}
