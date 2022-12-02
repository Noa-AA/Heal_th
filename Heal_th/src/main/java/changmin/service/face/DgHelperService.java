package changmin.service.face;

import java.util.List;

import changmin.dto.BodyInfo;
import changmin.dto.HealthRecord;
import changmin.util.DgHelperPaging;
import yerim.dto.Users;

public interface DgHelperService {

	/**
	 * 운동기록 저장하기
	 * 
	 * @param recordcon - 저장할 운동기록
	 * @return 
	 */
	public int addRecord(HealthRecord healthRecord);

	public List<HealthRecord> getRecordList(DgHelperPaging DgHelperPaging, int userno);

	public DgHelperPaging getDgHelperPaging(String curPage, int userno);

	public BodyInfo getBodyInfo(int userno);

	public Users getUserInfo(int userno);

	public void removeRecord(int recordNo);


}
