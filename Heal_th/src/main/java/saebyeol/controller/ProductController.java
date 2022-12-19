package saebyeol.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import saebyeol.dto.Product;
import saebyeol.service.face.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//서비스 객체
	@Autowired ProductService productService;
	
	@RequestMapping("/list")
	public ModelAndView list(ModelAndView mav) {
		logger.info("/list");
		mav.setViewName("/product/list");
		mav.addObject("list", productService.listProduct());
		return mav;
		
	}
	
}
