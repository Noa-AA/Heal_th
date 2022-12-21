package saebyeol.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.coobird.thumbnailator.Thumbnails;
import saebyeol.dto.AttachImage;
import saebyeol.dto.Product;
import saebyeol.service.face.AttachService;
import saebyeol.service.face.ProductService;
import saebyeol.utill.SaebyeolPaging;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//Product 서비스 객체
	@Autowired ProductService productService;
	
	//Attach 서비스객체
	@Autowired AttachService attachService;
	
	
	@RequestMapping("/list")
	public void list(@RequestParam(defaultValue = "0") int curPage, Model model) {
		logger.info("상품목록페이지 접속");
		SaebyeolPaging paging = productService.getPaging(curPage);
		logger.debug("{}", paging);
		model.addAttribute("paging", paging);
		
		List<Product> list = productService.list(paging);
		for( Product p : list )	logger.debug("{}", p);
		model.addAttribute("list", list);
		
	}

	@GetMapping("/enroll")
	public void productEnroll() {
		logger.info("상품등록페이지 접속");
	}
	
	//상품 등록
	@PostMapping("/enroll")
	public String productEnroll(Model model, Product product, RedirectAttributes rttr) {
		
		logger.info("상품등록페이지 접속");
		List list = productService.cateList();
	
		model.addAttribute("list", list);
		
		logger.info("productEnroll post : " + product);
		
		productService.productEnroll(product);
		rttr.addFlashAttribute("enroll_result", product.getpName());
		
		return "redirect:/product/list";
	}
	
	@RequestMapping("/view")
	public String view(Product viewProduct, Model model){
		logger.info("상세보기");
		
		viewProduct = productService.view(viewProduct);
		
		model.addAttribute("viewProduct", viewProduct);
		
		return "product/view";
	}
	
	@GetMapping("/update")
	public String update(Product product, Model model) {
		product = productService.view(product);
		
		model.addAttribute("updateProduct", product);
		
		return "product/update";
	}
	
	@PostMapping("/update")
	public String updateProcess(Product product) {
		logger.info("{}", product);
		productService.update(product);
		
		return "redirect:/product/view?prodNo=" + product.getProdNo();
		
	}
	
	@RequestMapping("/delete")
	public String delete(Product product) {
		productService.delete(product);
		
		return "redirect:/product/list";
	}
	
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName){
		logger.info("--- getImage : " + fileName);
		File file = new File("D:\\upload\\" + fileName);
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//이미지 파일 삭제
	@ PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName){
		logger.info("--- deleteFile : " + fileName);
		File file = null;
		
		try {
			//썸네일 파일 삭제
			file = new File("D:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			
			//원본 파일 삭제
			String originFileName = file.getAbsolutePath().replace("s_", "");
			logger.info("originFileName : " + originFileName);
			file = new File(originFileName);
			file.delete();
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
		}
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	
	//첨부 파일 업로드
	@PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AttachImage>> uploadAjaxActionPOST(MultipartFile[] pImage1) {
		logger.info("--- uploadAjaxActionPOST ---");
		
		//이미지 파일 체크
		for(MultipartFile multipartFile : pImage1) {
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			try {
				type = Files.probeContentType(checkfile.toPath());
				logger.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(!type.startsWith("image")) {
				List<AttachImage> list = null;
				return new ResponseEntity<>(list,HttpStatus.BAD_REQUEST);
			}
		
		}
		
		String uploadFolder = "D:\\upload";
		
		//날짜 폴더 경로
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		String datePath = str.replace("-", File.separator);
		
		//폴더 생성
		File uploadPath = new File(uploadFolder, datePath);
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		List<AttachImage> list = new ArrayList();
		
		for(MultipartFile multipartFile : pImage1) {
			
			//이미지 정보 객체
			AttachImage vo = new AttachImage();
			
			//파일 이름
			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);
			
			//UUID 적용 파일 이름
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);
			
			uploadFileName = uuid + "_" + uploadFileName;
			
			//파일위치
			File saveFile = new File(uploadPath, uploadFileName);
			
			//저장
			try {
				multipartFile.transferTo(saveFile);
				
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
				
				Thumbnails.of(saveFile).size(160, 160).toFile(thumbnailFile);
				
			} catch (IllegalStateException e) {
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			list.add(vo);
		}
		ResponseEntity<List<AttachImage>> result = new ResponseEntity<List<AttachImage>>(list, HttpStatus.OK);
		
		return result;
	}
	
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AttachImage>> getAttachList(int prodNo){
		logger.info("--- getAttachList : " + prodNo);
		
		return new ResponseEntity(attachService.getAttachList(prodNo), HttpStatus.OK);
		
	}
	
}











