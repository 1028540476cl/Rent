package cn.cl.rent.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import cn.cl.rent.user.main.User;



public class UserDao {
	/**
	 * 查询出是否存在用户
	 * @param conn
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public User login(Connection conn,User user)throws Exception{
		String sql="select* from t_user where loginname=? and loginpass=?";
		User formuser=null;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user.getLoginname());
		pstmt.setString(2,user.getLoginpass());
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			 formuser = new User();
			formuser.setUid(rs.getInt("uid"));
			formuser.setLoginname(rs.getString("loginname"));
			formuser.setLoginpass(rs.getString("loginpass"));
			formuser.setStates(rs.getBoolean("states"));
		}
		return formuser;
	}
}
