package dao;

import jdbc.JDBConnect;
import dto.MemberDTO;

public class MemberDAO extends JDBConnect {
	
	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String query = "select * from member where id=? and pass=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();
			
			//System.out.println(uid +  upass);
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				
			}
			
			//System.out.println(dto.getId()+"앵");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public boolean insertMember(String id, String pass, String name, 
								String gender, String birthday, String email, 
								String phoneNum, String address) {
		boolean check = false;
		String query = "insert into member2(id, pass, name, gender, birthday, email, phoneNum, address) values(?,?,?,?,?,?,?,?)";
		try {
			psmt=con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pass);
			psmt.setString(3, name);
			psmt.setString(4, gender);
			psmt.setString(5, birthday);
			psmt.setString(6, email);
			psmt.setString(7, phoneNum);
			psmt.setString(8, address);
			psmt.executeUpdate();
			return check;
		}catch(Exception e) {
			System.out.println("회원가입 중 예외발생");
			e.printStackTrace();
			check = true;
		}
		return check;
	}

}
