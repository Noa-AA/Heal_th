package hyanghee.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import hyanghee.dao.face.SearchDao;
import hyanghee.dto.Beforeafter;
import hyanghee.dto.SearchDto;
import hyanghee.service.face.SearchService;

@Service
public class SearchServiceImpl implements SearchService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	
	@Autowired SearchDao searchDao;


//	@Override
//	public List<SearchDto> listAll(int search_option, String keyword, int startNo, int endNo) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	
}
