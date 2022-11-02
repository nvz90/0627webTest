package dao;

import jdbc.JDBConnect;
import java.util.ArrayList;
import dto.ProductDTO;


public class ProductDAO extends JDBConnect {
	//객체하나만 만듬 메모리 절약
	private static ProductDAO instance = new ProductDAO();
		
	public static ProductDAO getInstance() {
		  return instance;
	}
	
	public void addProduct(String productId, String pname, int unitPrice, 
			 				String description,String mnufacturer, String category, 
			 				long unitsInStock, String condition, String imageName, String userId) {
		String query = "insert into product(productId, pname, unitPrice, description, mnufacturer, category, unitsInStock, condi, imageName, userId) values(?,?,?,?,?,?,?,?,?,?)";
	    
	    try {
	    	psmt= con.prepareStatement(query);
	    	psmt.setString(1, productId);	
	    	psmt.setString(2, pname);
	    	psmt.setInt(3, unitPrice);
	   		psmt.setString(4, description);
	    	psmt.setString(5, mnufacturer);
	   		psmt.setString(6, category);
	   		psmt.setLong(7, unitsInStock);
	    	psmt.setString(8, condition);
	   		psmt.setString(9, imageName);
	   		psmt.setString(10, userId); 
	   		psmt.executeUpdate();	
	   	}catch(Exception e) {
	   		System.out.println("상품 등록 중 예외발생");
	   		e.printStackTrace();
	    }
	}
	public ArrayList<ProductDTO> getAllProducts(){
		ArrayList<ProductDTO> products = new ArrayList<ProductDTO>();
		String query = "select * from product";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				
				dto.setProductId(rs.getString("productId"));
				dto.setPname(rs.getString("pname"));
				dto.setUnitPrice(rs.getInt("unitPrice"));
				dto.setDescription(rs.getString("description"));
				dto.setMnufacturer(rs.getString("mnufacturer"));
				dto.setCategory(rs.getString("category"));
				dto.setUnitsInStock(rs.getLong("unitsInStock"));
				dto.setCondition(rs.getString("condi"));
				dto.setImageName(rs.getString("imageName"));
				
				products.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("상품 조회 중 예외 발생");
			e.printStackTrace();
		}
		return products;
	}
	public ProductDTO getProductById(String productId){
		ProductDTO dto = new ProductDTO();
		String query = "select * from product where productId = ?";

		try {
			psmt= con.prepareStatement(query);
	    	psmt.setString(1, productId);		
			rs = psmt.executeQuery();
			while(rs.next()) {
				
				dto.setUserId(rs.getString("userId"));
				dto.setProductId(rs.getString("productId"));
				dto.setPname(rs.getString("pname"));
				dto.setUnitPrice(rs.getInt("unitPrice"));
				dto.setDescription(rs.getString("description"));
				dto.setMnufacturer(rs.getString("mnufacturer"));
				dto.setCategory(rs.getString("category"));
				dto.setUnitsInStock(rs.getLong("unitsInStock"));
				dto.setCondition(rs.getString("condi"));
				dto.setImageName(rs.getString("imageName"));
			}
			/*
			 * System.out.println("method Test  " + dto.getProductId());
			 * System.out.println("method Test  " + dto.getPname());
			 * System.out.println("method Test  " + dto.getUnitPrice());
			 * System.out.println("method Test  " + dto.getDescription());
			 * System.out.println("method Test  " + dto.getMnufacturer());
			 * System.out.println("method Test  " + dto.getCategory());
			 * System.out.println("method Test  " + dto.getUnitsInStock());
			 * System.out.println("method Test  " + dto.getCondition());
			 * System.out.println("method Test  " + dto.getImageName());
			 */
			
		}catch(Exception e){
			System.out.println("getProductById 메서드 실행중 예외");
			e.printStackTrace();
		}
		return dto;
	}
	public void updateProduct(String productId, String pname, int unitPrice, String description,
								String mnufacturer, String category, long unitsInStock,
								String condition, String imageName ) {
		String query = "update product set pname = ?, unitPrice = ?, description = ?, mnufacturer = ?, category = ?, unitsInStock = ?, condi = ?, imageName = ? where productId = ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, pname);
			psmt.setInt(2, unitPrice);
			psmt.setString(3, description);
			psmt.setString(4, mnufacturer);
			psmt.setString(5, category);
			psmt.setLong(6, unitsInStock);
			psmt.setString(7, condition);
			psmt.setString(8, imageName);
			psmt.setString(9, productId);
			psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("상품 수정 중 예외발생");
			e.printStackTrace();
		}
	}
	public void deleteProduct(String productId) {
		String query = "delete from product where productId = ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, productId);
			psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("상품 삭제 중 예외발생");
		}
	}
	
}
