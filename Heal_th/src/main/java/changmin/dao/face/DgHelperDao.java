package changmin.dao.face;

import java.util.List;

import changmin.dto.BodyInfo;
import changmin.dto.HealthRecord;
import changmin.util.DgHelperPaging;
import yerim.dto.Users;

public interface DgHelperDao {

	public void insertRecord(String recordcon);

	public List<HealthRecord> selectRecord(DgHelperPaging DgHelperPaging);

	public int selectCntAll();

	public BodyInfo selectBodyInfo(int userno);

	public Users selectUserInfo(int userno);

}
