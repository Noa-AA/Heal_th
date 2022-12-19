package unhak.dto;

public class CategoryDto {

	private int PCateNo;
	private String PCateName;
	
	public CategoryDto() {
	}
	
	
	
	@Override
	public String toString() {
		return "CategoryDto [PCateNo=" + PCateNo + ", PCateName=" + PCateName + "]";
	}
	public CategoryDto(int pCateNo, String pCateName) {
		super();
		PCateNo = pCateNo;
		PCateName = pCateName;
	}
	public int getPCateNo() {
		return PCateNo;
	}
	public void setPCateNo(int pCateNo) {
		PCateNo = pCateNo;
	}
	public String getPCateName() {
		return PCateName;
	}
	public void setPCateName(String pCateName) {
		PCateName = pCateName;
	}
	
	
	
}
