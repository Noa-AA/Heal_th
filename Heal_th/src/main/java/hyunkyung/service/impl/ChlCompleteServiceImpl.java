package hyunkyung.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyunkyung.dao.face.ChlCompleteDao;
import hyunkyung.service.face.ChlCompleteService;

@Service
public class ChlCompleteServiceImpl implements ChlCompleteService{

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ChlCompleteDao chlCompleteDao;
}
