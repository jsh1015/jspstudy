package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
//Model ����� ����ϴ� Ŭ����(db�� ������ ����� ���� Ŭ����)
//Dao : Data Access Object
public class MemberDao {
	public Member selectOne(String id) {
		//id : ȭ�鿡 �Էµ� ���̵�
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = 
				"select * from member where binary id=?"; //binary:��ҹ��ڱ���
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id); //�����Է¹��� id���� �Է�
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Member mem = new Member(); //�����ü�� ����� db������
				mem.setId(rs.getString("id"));
				mem.setPass(rs.getString("pass"));
				mem.setName(rs.getString("name"));
				mem.setGender(rs.getInt("gender"));
				mem.setEmail(rs.getString("email"));
				mem.setTel(rs.getString("tel"));
				mem.setPicture(rs.getString("picture"));
				return mem;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { //
			DBConnection.close(conn,pstmt,rs); //������ ������
		}
		return null; //�����߻��� null �ƴϸ� mem
	}
	
	public String idselect(String email, String tel) {
		  Connection conn = DBConnection.getConnection();
		  PreparedStatement pstmt = null;
		  ResultSet rs = null;
		  String sql = "select id from member where email=? and tel=?";
		  try {
			  pstmt = conn.prepareStatement(sql);
			  pstmt.setString(1, email);
			  pstmt.setString(2, tel);
			  rs = pstmt.executeQuery();
			  if(rs.next()) {
				  String id = rs.getString("id");
				  return id;
			  }
		  }catch(SQLException e) {
			  e.printStackTrace();
		  }finally {
			  DBConnection.close(conn, pstmt, rs);
		  }
		  return null;
	}
	
	public String pwselect(String id, String email, String tel) {
		  Connection conn = DBConnection.getConnection();
		  PreparedStatement pstmt = null;
		  ResultSet rs = null;
		  String sql = "select pass from member where id=? and email=? and tel=?";
		  try {
			  pstmt = conn.prepareStatement(sql);
			  pstmt.setString(1, id);
			  pstmt.setString(2, email);
			  pstmt.setString(3, tel);
			  rs = pstmt.executeQuery();
			  if(rs.next()) {
				  String pass = rs.getString("pass");
				  return pass;
			  }
		  }catch(SQLException e) {
			  e.printStackTrace();
		  }finally {
			  DBConnection.close(conn, pstmt, rs);
		  }
		  return null;
	}

	
	public int insert(Member m) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into member (id,pass,name,gender,email,tel,picture)"
				+"values(?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPass());
			pstmt.setString(3, m.getName());
			pstmt.setInt(4, m.getGender());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getTel());
			pstmt.setString(7, m.getPicture());
			//int executeUpdate() : ����� ���ڵ� �Ǽ� (1,0)
			return pstmt.executeUpdate(); //DB�� insert ����:1, ����:0 ���� join.jsp result �� �Ѿ
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(conn, pstmt, null);
		}
		return 0; //insert ����
	}
	
	public List<Member> list() {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Member> list = new ArrayList<Member>();
		String sql = "select * from member";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Member m = new Member();
				m.setId(rs.getString("id"));
				m.setPass(rs.getString("pass"));
				m.setName(rs.getString("name"));
				m.setGender(rs.getInt("gender"));
				m.setTel(rs.getString("tel"));
				m.setEmail(rs.getString("email"));
				m.setPicture(rs.getString("picture"));
				list.add(m);
			}
			return list;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { //
			DBConnection.close(conn,pstmt,rs); //������ ������
		}
		return null;
	}
	
	public int update(Member m) {
		//����ڰ� �Է��� ȸ�� ����. ����� ����
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = 
				"update member set name=?,gender=?,email=?,tel=?,picture=? where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getName());
			pstmt.setInt(2, m.getGender());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getTel());
			pstmt.setString(5, m.getPicture());
			pstmt.setString(6, m.getId());
			return pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(conn, pstmt, null);
		}
		return 0;
	}
	
	public int passupdate(String login, String rpass) {
		  Connection conn = DBConnection.getConnection();
		  PreparedStatement pstmt = null;
		  String sql = "update member set pass=? where id=?";
		  try {
		   pstmt = conn.prepareStatement(sql);
		   pstmt.setString(1, rpass);
		   pstmt.setString(2, login);
		   return pstmt.executeUpdate();
		  }catch(SQLException e) {
		   e.printStackTrace();
		  }finally {
		   DBConnection.close(conn, pstmt, null);
		  }
		  return 0;
	}
	
	public int delete(String id) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "delete from member where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			return pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			DBConnection.close(conn, pstmt, null);
		}
		return 0;
	}
}