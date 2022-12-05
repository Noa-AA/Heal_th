package yerim.dto;

public class Msg {
	
	private String to;
	private String content;
	
	
	public Msg() {}


	public Msg(String to, String content) {
		super();
		this.to = to;
		this.content = content;
	}


	@Override
	public String toString() {
		return "Msg [to=" + to + ", content=" + content + "]";
	}


	public String getTo() {
		return to;
	}


	public void setTo(String to) {
		this.to = to;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}
	
	

}
