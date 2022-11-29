package changmin.service.face;

import java.util.List;

import changmin.dto.HealthRecord;
import changmin.util.Paging;

public interface DgHelperService {

	/**
	 * 운동기록 저장하기
	 * 
	 * @param recordcon - 저장할 운동기록
	 * @param userno 
	 */
	public void addRecord(String recordcon, int userno);

	public List<HealthRecord> getRecordList(Paging paging, int userno);

	public Paging getPaging(String curPage, int userno);


}
