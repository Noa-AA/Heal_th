package changmin.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import changmin.dao.face.DgHelperDao;
import changmin.service.face.DgHelperService;

@Service
public class DgHelperServiceImpl implements DgHelperService {

	private Logger logger = LoggerFactory.getLogger(DgHelperServiceImpl.class);

	@Autowired private DgHelperDao dgHelperDao;
	
	@Override
	public void insertRecord(String recordcon) {
		dgHelperDao.insertRecord(recordcon);
	}
	
}
