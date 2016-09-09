package cn.cl.rent.goods.Action;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import cn.cl.rent.dbutil.Jdbc;
import cn.cl.rent.dbutil.ResponseUtil;
import cn.cl.rent.goods.dao.GoodsDao;
import cn.cl.rent.goods.main.Goods;


import com.opensymphony.xwork2.ActionSupport;

public class GoodsadminAction extends ActionSupport implements ServletRequestAware{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	private Jdbc jb = new Jdbc();
	private GoodsDao goodsDao = new GoodsDao();
	private String payfor;//将jsp中的是否已交换状态获取过来
	private String state;//将jsp中的是否审核状态获取过来
	private String typeid;//将jsp中的信息类别获取过来
	private String dlid;//封装一个id值，传递到删除javascript代码中
	private Goods goods;
	private String uid;//获取uid的值
	
	
	
	
	
	public String getUid() {
		return uid;
	}


	public void setUid(String uid) {
		this.uid = uid;
	}


	public Goods getGoods() {
		return goods;
	}


	public void setGoods(Goods goods) {
		this.goods = goods;
	}


	public String getDlid() {
		return dlid;
	}


	public void setDlid(String dlid) {
		this.dlid = dlid;
	}


	public String getPayfor() {
		return payfor;
	}


	public void setPayfor(String payfor) {
		this.payfor = payfor;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public String getTypeid() {
		return typeid;
	}


	public void setTypeid(String typeid) {
		this.typeid = typeid;
	}


	public String searchGoods()throws Exception{
		request.setAttribute("mainPage", "/adminjsps/admin/searchInfo.jsp");
		StringBuffer sb=new StringBuffer("select * from t_goods t1,t_topnews t2 where t1.typeid=t2.id ");
		if(!"all".equals(payfor)){
			sb.append(" and t1.payfor="+payfor);
		}
		if(!"all".equals(state)){
			sb.append(" and t1.state="+state);
		}
		sb.append(" and t1.typeid="+typeid+" order by t1.infoDate desc ");
		Connection conn = jb.getConn();
		ArrayList<Goods> searchGoodsList=goodsDao.getList(conn, sb.toString());
		request.setAttribute("searchGoodsList", searchGoodsList);
		return "searchGoods";
	}
	public String deleteGoods()throws Exception{//管理员删除物品
		Connection conn=jb.getConn();
		int delNum=goodsDao.deleteGoods(conn, dlid);
		boolean delFlag;
		if(delNum==1){
			delFlag=true;
		}else{
			delFlag=false;
		}
		ResponseUtil.write(delFlag);
		return null;
	}
	public String detailsCheckGoods()throws Exception{// 管理员审核跳转
		request.setAttribute("mainPage", "/adminjsps/operate/CheckGoods.jsp");
		Connection conn =jb.getConn();
		 goods = goodsDao.getGoodsById(conn, uid);
		 request.setAttribute("goods", goods);
		return "checkGoods";
	}
	public String payGoods()throws Exception{
		request.setAttribute("mainPage", "/adminjsps/operate/payGoods.jsp");
		Connection conn =jb.getConn();
		goods = goodsDao.getGoodsById(conn, uid);
		 request.setAttribute("goods", goods);
		return "checkGoods";
	}
	public String checkGoods()throws Exception{
		Connection conn =jb.getConn();
		int num =goodsDao.checkGoods(conn, uid);
		boolean delFag;
		if(num==1){
			delFag=true;
		}else{
			delFag=false;
		}
		ResponseUtil.write(delFag);
		return null;	
		}
	public String checkfGoods()throws Exception{
		Connection conn =jb.getConn();
		int num =goodsDao.checkfGoods(conn, uid);
		boolean delFag;
		if(num==1){
			delFag=true;
		}else{
			delFag=false;
		}
		ResponseUtil.write(delFag);
		return null;	
		}
	public String checktfGoods()throws Exception{
		Connection conn =jb.getConn();
		int num =goodsDao.checktfGoods(conn, uid);
		boolean delFag;
		if(num==1){
			delFag=true;
		}else{
			delFag=false;
		}
		ResponseUtil.write(delFag);
		return null;	
		}
	
	public String searchpayGoods()throws Exception{//管理员查看详细内容，并操作
		request.setAttribute("mainPage", "/adminjsps/operate/searchpayGoods.jsp");
		Connection conn =jb.getConn();
		goods = goodsDao.getGoodsById(conn, uid);
		 request.setAttribute("goods", goods);
		return "checkGoods";
	}
	public String jiemian()throws Exception{//在详情界面删除物品跳转
		{
			return "jiemian";
		}
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
		
	}

}
