package cn.cl.rent.top.action;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import cn.cl.rent.dbutil.Jdbc;
import cn.cl.rent.goods.dao.GoodsDao;
import cn.cl.rent.goods.main.Goods;
import cn.cl.rent.top.dao.TopDao;
import cn.cl.rent.top.main.Top;

import com.opensymphony.xwork2.ActionSupport;

public class TopAction  extends ActionSupport implements ServletRequestAware{
	
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static Jdbc jb = new Jdbc();  
	private GoodsDao goodsDao = new GoodsDao();
	private static TopDao topDao = new TopDao();
	private static ArrayList<Top> toplist ;
	private HttpServletRequest request;
	@Override
	
	public String execute() throws Exception {
		Connection conn = null;
		conn = jb.getConn();
		
		//这是 物品还未被交换走的信息查询
	
		String sql = "select * from t_goods t1,t_topnews t2 where t1.typeid=t2.typeSign and t1.state=1 and t1.payfor=1  order by t1.infoDate desc";
		ArrayList<Goods> GoodList=goodsDao.getList(conn, sql);
		request.setAttribute("GoodList", GoodList);
		
		//这是已经交换走信息查询
		List rentGoodList = new ArrayList();
		if(toplist!=null&&toplist.size()!=0){
			for(int i=0;i<toplist.size();i++){
				Top top  = toplist.get(i);
				String sql2 = "select * from t_goods t1,t_topnews t2 where t1.typeid=t2.typeSign and t1.state=1 and t1.payfor=0 and t1.typeid="+top.getId()+" order by t1.infoDate ";
				List<Goods> onSubList = goodsDao.getList(conn, sql2);
				rentGoodList.add(onSubList);
			}
			
		}
		request.setAttribute("rentGoodList",rentGoodList);
  		HttpSession session = request.getSession();
		session.setAttribute("toplist", toplist);
		return "index"; 
	} 
	static{ 
		Connection conn = null; 
		try {
			conn=jb.getConn();
			toplist = topDao.TopList(conn);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();  
		}finally{
			try { 
				 jb.close(conn);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		 this.request=request;
		
	}
	  
 
}


