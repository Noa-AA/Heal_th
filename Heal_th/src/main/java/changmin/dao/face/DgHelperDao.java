package changmin.dao.face;

import java.util.List;

import changmin.dto.BodyInfo;
import changmin.dto.HealthRecord;
import changmin.util.DgHelperPaging;
import yerim.dto.Users;

public interface DgHelperDao {

	public int insertRecord(HealthRecord healthRecord);

	public List<HealthRecord> selectRecord(DgHelperPaging dgHelperPaging);

	public int selectCntAll();

	public BodyInfo selectBodyInfo(int userno);

	public Users selectUserInfo(int userno);

	public void deleteRecord(int recordNo);

}
