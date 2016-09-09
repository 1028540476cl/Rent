package cn.cl.rent.top.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import cn.cl.rent.top.main.Top;

public class TopDao {

	public ArrayList<Top> TopList(Connection conn)throws Exception{
		ArrayList<Top> TopList = new ArrayList<Top>();
		String sql="select * from t_topnews order by typeSign";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			Top top = new Top();
			top.setId(rs.getInt("id"));
			top.setTypeName(rs.getString("typeName"));
			top.setTypeSign(rs.getInt("typeSign"));
			TopList.add(top);
		}
		return TopList;
	}

}
