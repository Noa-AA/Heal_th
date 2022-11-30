package changmin.dao.face;

import java.util.List;

import changmin.dto.BodyInfo;
import changmin.dto.HealthRecord;
import changmin.util.ChangMinPaging;

public interface DgHelperDao {

	public void insertRecord(String recordcon);

	public List<HealthRecord> selectRecord(ChangMinPaging ChangMinPaging);

	public int selectCntAll();

	public BodyInfo selectBodyInfo(int userno);

}
