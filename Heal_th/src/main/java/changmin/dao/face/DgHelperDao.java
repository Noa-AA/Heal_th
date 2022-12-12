package changmin.dao.face;

import java.util.List;

import changmin.dto.BodyInfo;
import changmin.dto.DgmaJoin;
import changmin.dto.Dgmachat;
import changmin.dto.Dgmagotchi;
import changmin.dto.HealthRecord;
import changmin.util.DgHelperPaging;
import yerim.dto.Users;

public interface DgHelperDao {

	public int insertRecord(HealthRecord healthRecord);

	public List<HealthRecord> selectRecord(DgHelperPaging dgHelperPaging);

	public int selectCntAll(int userno);

	public BodyInfo selectBodyInfo(int userno);

	public Users selectUserInfo(int userno);

	public void deleteRecord(int recordNo);

	public Dgmagotchi selectDgmaInfo(int userno);

	public void insertDgmaInfo(int userno);

	public void updateDgmaInfo(Dgmagotchi dgmagotchi);

	public int selectCntDgmaInfo(int userno);

	public List<DgmaJoin> selectDgmaRanking();

	public String selectMyNick(int userno);

	public void insertDgmaChat(Dgmachat dgmachat);

	public List<Dgmachat> selectDgmaChat();

}
