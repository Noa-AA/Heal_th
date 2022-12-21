package changmin.dto;

public class MyMessage {

	private int messageNo;
	private String messageCon;
	private String messageDate;
	private int messageCheck;
	private int userNo;
	
	public MyMessage() {}

	public MyMessage(int messageNo, String messageCon, String messageDate, int messageCheck, int userNo) {
		super();
		this.messageNo = messageNo;
		this.messageCon = messageCon;
		this.messageDate = messageDate;
		this.messageCheck = messageCheck;
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "MyMessage [messageNo=" + messageNo + ", messageCon=" + messageCon + ", messageDate=" + messageDate
				+ ", messageCheck=" + messageCheck + ", userNo=" + userNo + "]";
	}

	public int getMessageNo() {
		return messageNo;
	}

	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}

	public String getMessageCon() {
		return messageCon;
	}

	public void setMessageCon(String messageCon) {
		this.messageCon = messageCon;
	}

	public String getMessageDate() {
		return messageDate;
	}

	public void setMessageDate(String messageDate) {
		this.messageDate = messageDate;
	}

	public int getMessageCheck() {
		return messageCheck;
	}

	public void setMessageCheck(int messageCheck) {
		this.messageCheck = messageCheck;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	
}
