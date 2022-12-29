package saebyeol.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import net.coobird.thumbnailator.Thumbnails;
import saebyeol.dto.AttachImage;
import saebyeol.dto.Criteria;
import saebyeol.dto.Page;
import saebyeol.dto.Prodcategory;
import saebyeol.dto.Product;
import saebyeol.service.face.AttachService;
import saebyeol.service.face.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//Product 서비스 객체
	@Autowired ProductService productService;
	
	//Attach 서비스객체
	@Autowired AttachService attachService;
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Criteria cri, Model model) {
		logger.info("상품목록페이지 접속");
		
		List<Product> list = productService.list(cri);
		logger.info("{}", list);
		model.addAttribute("list", list);
		
		model.addAttribute("page", new Page(cri, productService.getTotal(cri)));
		
	}

	@GetMapping("/enroll")
	public void productEnroll(Model model) throws JsonProcessingException {
		logger.info("상품등록페이지 접속");
		ObjectMapper objm = new ObjectMapper();
		List list = productService.cateList();
		logger.info("{}", list);

		String cateList = objm.writeValueAsString(list);
		model.addAttribute("cateList", cateList);
		
		logger.info("변경 전.........." + list);
		logger.info("변경 후.........." + cateList);
	}
	
	//상품 등록
	@PostMapping("/enroll")
	public String productEnroll(Product product, RedirectAttributes rttr) {
		
		logger.info("상품등록페이지 접속");
		
		logger.info("productEnroll post : " + product);
		
		productService.productEnroll(product);
		rttr.addFlashAttribute("enroll_result", product.getpName());
		
		return "redirect:/product/list";
	}
	
	//상품 조회, 수정 페이지
	@GetMapping({"/detail", "/modify"})
	public void getInfo(int prodNo, Criteria cri, Model model) throws JsonProcessingException{
		logger.info("getInfo() : " + prodNo);
		ObjectMapper mapper = new ObjectMapper();
		
		/* 카테고리 리스트 데이터 */
		model.addAttribute("cateList", mapper.writeValueAsString(productService.cateList()));		
		
		/* 목록 페이지 조건 정보 */
		model.addAttribute("cri", cri);
		
		/* 조회 페이지 정보 */
		model.addAttribute("productInfo", productService.getDetail(prodNo));
		
		
	}
	
//	@GetMapping("/detail/{prodNo}")
//	public String detail(@PathVariable("prodNo")int prodNo, Model model) {
//
//		model.addAttribute("productInfo", productService.getInfo(prodNo));
//			
//		return "/detail";
//	}
	
	@PostMapping("/modify")
	public String modify(Product product, RedirectAttributes rttr) {
		logger.info("modifyPOST---" + product);
		
		int result = productService.modify(product);
		
		rttr.addFlashAttribute("modify_result", result);
		
		return "redirect:/product/list";
	}
	
	@PostMapping("/delete")
	public String delete(int prodNo, RedirectAttributes rttr) {
		logger.info("delete ---");
		logger.info("prodNo {}", prodNo);
		List<AttachImage> fileList = productService.getAttachInfo(prodNo);
		
		if(fileList != null) {
			
			List<Path> pathList = new ArrayList();
			
			fileList.forEach(vo ->{
				
				// 원본 이미지
				Path path = Paths.get("D:\\upload", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName());
				pathList.add(path);
				
				// 섬네일 이미지
				path = Paths.get("D:\\upload", vo.getUploadPath(), "s_" + vo.getUuid()+"_" + vo.getFileName());
				pathList.add(path);
				
			});
			
			pathList.forEach(path ->{
				path.toFile().delete();
			});
			
		}		
		
		int result = productService.delete(prodNo);
		
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/product/list";
	}
	
	//이미지 출력
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
	
	
	//이미지 정보 반환
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AttachImage>> getAttachList(int prodNo){
		logger.info("--- getAttachList : " + prodNo);
		
		return new ResponseEntity<List<AttachImage>>(attachService.getAttachList(prodNo), HttpStatus.OK);
		
	}
	
	/* 상품 검색 */
	@GetMapping("/search")
	public String searchGoodsGET(Criteria cri, Model model) {
		
		logger.info("cri : " + cri);
		
		List<Product> list = productService.getProductList(cri);
		logger.info("pre list : " + list);
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			logger.info("list : " + list);
		} else {
			model.addAttribute("listcheck", "empty");
			
			return "search";
		}
		
		model.addAttribute("page", new Page(cri, productService.productGetTotal(cri)));
		
		return "search";
		
	}	
	
}











