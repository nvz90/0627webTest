package dao;

import jdbc.JDBConnect;
import java.util.ArrayList;
import dto.OrderDTO;

public class OrderDAO extends JDBConnect{
	private static OrderDAO instance = new OrderDAO();
	
	public static OrderDAO getInstance() {
		  return instance;
	}
	public void addOrder(String userId, String name, String day, String country, String zipcode, String address,
						String productId, String pname, Integer price, Integer quantity, Integer total) {
		String query = "insert into orderinfo(userId, name, day, country, zipcode, address, "
											+ "productId, pname, price, quantity, total) "
											+ "values(?,?,?,?,?,?,?,?,?,?,?)";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, userId);
			psmt.setString(2, name);
			psmt.setString(3,day);
			psmt.setString(4, country);
			psmt.setString(5, zipcode);
			psmt.setString(6, address);
			psmt.setString(7, productId);
			psmt.setString(8, pname);
			psmt.setInt(9,price);
			psmt.setInt(10, quantity);
			psmt.setInt(11, total);
			psmt.executeUpdate();
		}catch(Exception e){
			System.out.println("영수증 등록 중 예외 발생");
			e.printStackTrace();
		}
	}
}
