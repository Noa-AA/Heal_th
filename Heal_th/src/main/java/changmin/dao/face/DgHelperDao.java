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

	/**
	 * 운동일기 삽입
	 * @param healthRecord
	 * @return
	 */
	public int insertRecord(HealthRecord healthRecord);

	/**
	 * 운동일기 조회
	 * @param dgHelperPaging
	 * @return
	 */
	public List<HealthRecord> selectRecord(DgHelperPaging dgHelperPaging);

	/**
	 * 페이징을 위한 운동일기 갯수조회
	 * @param userno
	 * @return
	 */
	public int selectCntAll(int userno);

	/**
	 * 유저의 바디정보 조회
	 * @param userno
	 * @return
	 */
	public BodyInfo selectBodyInfo(int userno);

	/**
	 * 유저정보 조회
	 * @param userno
	 * @return
	 */
	public Users selectUserInfo(int userno);

	/**
	 * 운동일기 삭제
	 * @param recordNo
	 */
	public void deleteRecord(int recordNo);

	/**
	 * 득마고치정보 조회
	 * @param userno
	 * @return
	 */
	public Dgmagotchi selectDgmaInfo(int userno);

	/**
	 * 득마고치정보 삽입
	 * @param userno
	 */
	public void insertDgmaInfo(int userno);

	/**
	 * 득마고치정보 수정(저장)
	 * @param dgmagotchi
	 */
	public void updateDgmaInfo(Dgmagotchi dgmagotchi);

	/**
	 * 득마고치정보 있는지 확인
	 * @param userno
	 * @return
	 */
	public int selectCntDgmaInfo(int userno);

	/**
	 * 득마고치 랭킹 조회
	 * @return
	 */
	public List<DgmaJoin> selectDgmaRanking();

	/**
	 * 득마고치 닉네임 조회
	 * @param userno
	 * @return
	 */
	public String selectMyNick(int userno);

	/**
	 * 득마고치 채팅 삽입
	 * @param dgmachat
	 */
	public void insertDgmaChat(Dgmachat dgmachat);

	/**
	 * 득마고치 채팅 조회
	 * @return
	 */
	public List<Dgmachat> selectDgmaChat();

}
