package yerim.dto;


public class SmsResponse {
	private String requestId;
	private String requestTime;
	private String statusCode;
	private String statusName;
	private String code;
	
	public SmsResponse() {}

	public SmsResponse(String requestId, String requestTime, String statusCode, String statusName, String code) {
		super();
		this.requestId = requestId;
		this.requestTime = requestTime;
		this.statusCode = statusCode;
		this.statusName = statusName;
		this.code = code;
	}

	@Override
	public String toString() {
		return "SmsResponse [requestId=" + requestId + ", requestTime=" + requestTime + ", statusCode=" + statusCode
				+ ", statusName=" + statusName + ", code=" + code + "]";
	}

	public String getRequestId() {
		return requestId;
	}

	public void setRequestId(String requestId) {
		this.requestId = requestId;
	}

	public String getRequestTime() {
		return requestTime;
	}

	public void setRequestTime(String requestTime) {
		this.requestTime = requestTime;
	}

	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	
 
	
	
}
