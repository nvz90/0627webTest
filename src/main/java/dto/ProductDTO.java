package dto;

import java.io.Serializable;
// 클라이언트 요청하면 서버에서 받으면 데이터베이스 서블릿 이것저것 해서 다시 반환값을 클라이언트에 주는 데 객체형태로 ?? 
public class ProductDTO implements Serializable {
	private static final long serialVersionUID = 1L;	// 구별하기위한 이름
	
	private String userId;
	private String productId;	// 상품 아이디
	private String pname;		// 상품명
	private Integer unitPrice;	// 상품가격 
	private String description;	// 상품 설명
	private String mnufacturer; // 제조사
	private String category; 	// 분류
	private long unitsInStock;	// 재고 수
	private String condition;	// 신상 중고 재생
	private String imageName;
	private int quantity;	//장바구니 수량
	
	public ProductDTO(){
		super();
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getMnufacturer() {
		return mnufacturer;
	}

	public void setMnufacturer(String mnufacturer) {
		this.mnufacturer = mnufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}
	
	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}
