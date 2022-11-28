package changmin.service.face;

import java.util.List;

import changmin.dto.HealthRecord;
import changmin.util.Paging;

public interface DgHelperService {

	/**
	 * 운동기록 저장하기
	 * 
	 * @param recordcon - 저장할 운동기록
	 */
	public void insertRecord(String recordcon);

	public List<HealthRecord> getRecordList(Paging paging);

	public Paging getPaging(String curPage);


}
