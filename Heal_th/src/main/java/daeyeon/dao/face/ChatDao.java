package daeyeon.dao.face;

import java.util.List;

import daeyeon.dto.Chat;
import daeyeon.dto.ChatFile;
import daeyeon.dto.ChatRoom;
import daeyeon.dto.RoomList;
import daeyeon.util.ChatIntroPaging;
import yerim.dto.Users;


public interface ChatDao {
	
	
	/**
	 * 페이징을 위한 멘토 리스트 개수조회
	 * 
	 * @param myUserNo - 조회에서 제외할 내 번호
	 * @return - 조회된 전체 리스트 개수
	 */
	public int selectCntAll(Users myUserNo);
	

	/**
	 * chat/intro
	 * 
	 * 회원등급 3이상인 회원 조회하기
	 * 
	 * @return 회원등급 3이상인 회원 목록
	 */
	public List<Users> selectUsers(ChatIntroPaging chatIntroPaging);

	
	/**	 
	 * chat/intro
	 * 
	 * 검색된 회원의 총 수
	 * 
	 * @param chatIntroPaging
	 * @return
	 */
	public int selectSearchCntAll(ChatIntroPaging chatIntroPaging);
	
	/**
	 * chat/intro
	 * 
	 * 검색된 회원 리스트
	 * 
	 * @param chatIntroPaging
	 * @return
	 */
	public List<Users> selectSearchUsers(ChatIntroPaging chatIntroPaging);
	

	/**
	 * chat/pointCompare
	 * 
	 * @param users 자신의 유저번호가 담긴 dto
	 * @return 조회된 자신의 포인트
	 */
	public int selectMyPoint(Users users);


	/**
	 * chat/createChatRoom
	 * 
	 * 상대방 포인트 증가시키기
	 * 
	 * @param Users - 조회할 rankingNo, userNo 가 들어간 dto
	 */
	public void updateYourPoint(Users users);

	
	/**
	 * chat/createChatRoom
	 * 
	 * 자신의 포인트 감소시키기
	 * 
	 * 	@param Users - 조회할 rankingNo, userNo 가 들어간 dto
	 */
	public void updateMyPoint(Users users);
	
	
	/**
	 * chat/createChatRoom
	 * 
	 * 채팅방 만들기
	 * 
	 * @return int - 생성된 채팅방번호
	 */
	public int insertChatRoom(ChatRoom chatRoom);

	
	/**
	 * chat/createChatRoom
	 * 
	 * @param chatRoom - 추가될 상대방의 회원번호, 채팅방번호
	 */
	public void insertChatListByMy(ChatRoom chatRoom);
	
	/**
	 * chat/createChatRoom
	 * 
	 * @param chatRoom - 추가될 상대방의 회원번호, 채팅방번호
	 */
	public void insertChatListByYou(ChatRoom chatRoom);

	
	
	/**
	 * chat/chatRoom
	 * 
	 * 자신의 회원번호가 속한 채팅방번호와 상대방 닉네임 조회하기
	 * 
	 * @param myUserNo - 자신의 회원번호
	 * @return - 조회된 채팅방번호와 상대방 닉네임
	 */
	public List<RoomList> selectRoomList(Users myUserNo);
	
	
	/**
	 * chat/chatRoom
	 * 
	 * 채팅중에 마지막 채팅과 방번호 조회하기
	 * 
	 * @return - 조회된 마지막채팅 내역과 채팅방번호
	 */
	public List<Chat> selectLastChat();

	
	/**
	 * chat/chatArea
	 * 
	 * 룸번호로 상대방 이름 조회하기
	 * 
	 * @param roomNo - 방번호와 자신의 회원번호가 저장되있는 dto
	 * @return - 같은 채팅방의 상대방 이름
	 */
	public String selectReciverNick(RoomList roomNo);
	
	
	/**
	 * chat/chatArea
	 * 
	 * @param roomNo - 룸번호
	 * @return - 상대방 프로필 사진
	 */
	public String selectReciverProfile(RoomList roomNo);


	/**
	 * chat/chatArea
	 * 
	 * 채팅내용 테이블에 저장하기
	 * 
	 * @param chat - 회원번호, 채팅방 번호, 채팅 내용이 담긴 Chat dto
	 */
	public void insertChat(Chat chat);

	
	/**
	 * 세션에 있는 내 유저넘버로 내 닉네임 조회하기
	 * 
	 * @param myUserNo - 내 유저번호
	 * @return - 조회된 유저닉네임
	 */
	public String selectSenderNick(int myUserNo);


	/**
	 * chat/chatArea
	 * 
	 * 채팅내용 불러오기
	 * 
	 * @param roomNo - 조회할 채팅방 번호
	 * @return List<Chat> - 채팅내용
	 */
	public List<Chat> selectChat(RoomList roomNo);


	/**
	 * chat테이블의 chat_no 마지막값 구하기
	 * 
	 * @return
	 */
	public int selectChatNo();	
	
	/**
	 * chat/fileup
	 *
	 * 파일 저장하기
	 * 
	 * @param chatFile - insert 파일정보
	 */
	public void insertFile(ChatFile chatFile);


	
	/**
	 * main
	 * 포인트가 제일 높은 세명 조회
	 * 
	 * @return List<Users> - 조회된 회원목록
	 */
	public List<Users> selectTopUsers();










	
	


	


	

	
	

}
