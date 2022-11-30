package yerim.dto;

public class Request {
	
	private String recivedPhoneNumber;
	private String title;
	private String content;
	
	public Request() {}

	public Request(String recivedPhoneNumber, String title, String content) {
		super();
		this.recivedPhoneNumber = recivedPhoneNumber;
		this.title = title;
		this.content = content;
	}

	@Override
	public String toString() {
		return "Request [recivedPhoneNumber=" + recivedPhoneNumber + ", title=" + title + ", content=" + content + "]";
	}

	public String getRecivedPhoneNumber() {
		return recivedPhoneNumber;
	}

	public void setRecivedPhoneNumber(String recivedPhoneNumber) {
		this.recivedPhoneNumber = recivedPhoneNumber;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	
}
