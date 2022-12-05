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

	/**
	 * 개별회원의 운동기록에 대한 페이징
	 * @param curPage
	 * @param userno
	 * @return
	 */
	public DgHelperPaging getDgHelperPaging(String curPage, int userno);

	/**
	 * 개별회원의 페이징된 운동기록 조회
	 * @param DgHelperPaging
	 * @param userno
	 * @return
	 */
	public List<HealthRecord> getRecordList(DgHelperPaging DgHelperPaging, int userno);

	/**
	 * 개별회원의 바디인포 조회
	 * @param userno
	 * @return
	 */
	public BodyInfo getBodyInfo(int userno);

	/**
	 * 세션에 로그인한 유저정보 조회
	 * @param userno
	 * @return
	 */
	public Users getUserInfo(int userno);

	/**
	 * 운동일기 삭제
	 * @param recordNo
	 */
	public void removeRecord(int recordNo);

	/**
	 * 운동일기 수정
	 * @param recordNo
	 */
	public void changeRecord(int recordNo);


}
