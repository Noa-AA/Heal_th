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
	 * @param userno 
	 */
	public void addRecord(String recordcon, int userno);

	public List<HealthRecord> getRecordList(DgHelperPaging DgHelperPaging, int userno);

	public DgHelperPaging getDgHelperPaging(String curPage, int userno);

	public BodyInfo getBodyInfo(int userno);

	public int getCntRecord(List<HealthRecord> recordList);

	public Users getUserInfo(int userno);


}
