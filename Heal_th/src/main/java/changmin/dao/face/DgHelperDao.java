package changmin.dao.face;

import java.util.List;

import changmin.dto.HealthRecord;
import changmin.util.Paging;

public interface DgHelperDao {

	public void insertRecord(String recordcon);

	public List<HealthRecord> selectRecord(Paging paging);

	public int selectCntAll();

}
