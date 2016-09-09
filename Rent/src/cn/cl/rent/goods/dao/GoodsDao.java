package cn.cl.rent.goods.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import cn.cl.rent.goods.main.Goods;

public class GoodsDao {
	/**
	 * 将goods数据表的数据显示出来
	 * @param conn
	 * @param sql
	 * @return
	 * @throws Exception
	 */
	public ArrayList<Goods> getList(Connection conn ,String sql)throws Exception{
		ArrayList<Goods> GoodsList = new ArrayList<Goods>();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			Goods goods = new Goods();
			goods.setId(rs.getInt("id"));
			goods.setUid(rs.getInt("uid"));
			goods.setTypeSign(rs.getInt("typeSign"));
			goods.setTypeid(rs.getInt("typeid"));
			goods.setTitle(rs.getString("title"));
			goods.setPhone(rs.getString("phone"));
			goods.setContent(rs.getString("content"));
			goods.setQq(rs.getString("qq"));
			goods.setLinkman(rs.getString("linkman"));
			goods.setInfoDate(rs.getDate("infoDate"));
			goods.setPayfor(rs.getInt("payfor"));
			goods.setState(rs.getInt("state"));
			goods.setTypeName(rs.getString("typeName"));
			goods.setImagea(rs.getString("imagea"));
			
			GoodsList.add(goods);
		}
		
		return GoodsList;
	}
	public Goods getGoodsById(Connection conn,String uid)throws Exception{
		String sql="select * from t_goods t1,t_topnews t2 where t1.typeid=t2.id and t1.uid=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, uid);
		ResultSet rs=pstmt.executeQuery();
		Goods goods = new Goods();
		while(rs.next()){
			
			goods.setUid(rs.getInt("uid"));
			goods.setId(rs.getInt("id"));
			goods.setTypeSign(rs.getInt("typeSign"));
			goods.setTypeid(rs.getInt("typeid"));
			goods.setTitle(rs.getString("title"));
			goods.setPhone(rs.getString("phone"));
			goods.setContent(rs.getString("content"));
			goods.setQq(rs.getString("qq"));
			goods.setLinkman(rs.getString("linkman"));
			goods.setInfoDate(rs.getDate("infoDate"));
			goods.setPayfor(rs.getInt("payfor"));
			goods.setState(rs.getInt("state"));
			goods.setTypeName(rs.getString("typeName"));
			goods.setImagea(rs.getString("imagea"));
		
		}
		return goods;
	}
	
	public int addGoods(Connection conn,Goods goods)throws Exception{
		String sql="insert into t_goods values(null,?,?,?,?,?,?,?,now(),0,1)";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		
		pstmt.setInt(1, goods.getTypeid());
		pstmt.setString(2, goods.getImagea());
		pstmt.setString(3, goods.getTitle());
		pstmt.setString(4, goods.getContent());
		pstmt.setString(5, goods.getLinkman());
		pstmt.setString(6, goods.getPhone());
		pstmt.setString(7, goods.getQq());
		
		return pstmt.executeUpdate();
	}
	
	public int deleteGoods(Connection conn,String id)throws Exception{
		String sql="delete from t_goods where uid=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		return pstmt.executeUpdate();
	}
	
	public int checkGoods(Connection conn,String id)throws Exception{
		String sql="update t_goods set state=1 where uid=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		return pstmt.executeUpdate();
	}
	public int checkfGoods(Connection conn,String id)throws Exception{
		String sql="update t_goods set payfor=0 where uid=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		return pstmt.executeUpdate();
	}
	public int checktfGoods(Connection conn,String id)throws Exception{
		String sql="update t_goods set payfor=1 where uid=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		return pstmt.executeUpdate();
	}

}
