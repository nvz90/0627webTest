package dao;

import jdbc.JDBConnect;
import java.util.ArrayList;
import dto.CartDTO;

public class CartDAO extends JDBConnect{
	private static CartDAO instance = new CartDAO();
	
	public static CartDAO getInstance() {
		  return instance;
	}
	
	public void addCart(String userId, String productId, String pname, Integer price, Integer quantity, Integer subtotal) {
		String query = "insert into cart(userId, productId, pname, price, quantity, subtotal) values(?,?,?,?,?,?)";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, userId);
			psmt.setString(2, productId);
			psmt.setString(3,pname);
			psmt.setInt(4, price);
			psmt.setInt(5, quantity);
			psmt.setInt(6, subtotal);
			psmt.executeUpdate();
		}catch(Exception e){
			System.out.println("장바구니 등록 중 예외 발생");
			e.printStackTrace();
		}
	}
	public void deleteAllCart(String userId) {
		String query = "delete from cart where userId=? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, userId);
			psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("장바구니 전체 상품 삭제 중 예외 발생");
		}
	}
	public void deleteCart(String productId, String userId) {
		String query = "delete from cart where productId = ? and userId = ? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, productId);
			psmt.setString(2, userId);
			psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("장바구니 단일 상품 삭제 중 예외 발생");
		}
	}
	public void updateCart(String productId, String userId) {
		String query = "update cart set quantity = quantity + 1 where productId = ? and userId = ?";		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, productId);
			psmt.setString(2, userId);
			psmt.executeUpdate();
			System.out.println("####");
		}catch(Exception e) {
			System.out.println("장바구니 상품 수량 변경 중 예외 발생");
		}
		
	}
	public ArrayList<CartDTO> selectCart(String userId) {
		ArrayList<CartDTO> cart = new ArrayList<CartDTO>();
		String query = "select * from cart where userId = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, userId);
			rs = psmt.executeQuery();
			while(rs.next()) {
				CartDTO dto = new CartDTO();
				
				dto.setUserId(rs.getString("userId"));
				dto.setProductId(rs.getString("productId"));
				dto.setPname(rs.getString("pname"));
				dto.setPrice(rs.getInt("price"));
				dto.setQuantity(rs.getInt("quantity"));
				dto.setSubtotal(rs.getInt("subtotal"));
				
				cart.add(dto);
			}
		}catch(Exception e) {
			System.out.println("장바구니 상품 조회 중 예외 발생");
			e.printStackTrace();
		}
		return cart;
	}

}
