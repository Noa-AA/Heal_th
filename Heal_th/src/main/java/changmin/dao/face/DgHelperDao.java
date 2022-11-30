package changmin.dao.face;

import java.util.List;

import javax.servlet.http.HttpSession;

import changmin.dto.BodyInfo;
import changmin.dto.HealthRecord;
import changmin.util.Paging;

public interface DgHelperDao {

	public void insertRecord(String recordcon);

	public List<HealthRecord> selectRecord(Paging paging);

	public int selectCntAll();

	public BodyInfo selectBodyInfo(int userno);

}
