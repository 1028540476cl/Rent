package cn.cl.rent.goods.Action;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import cn.cl.rent.dbutil.Jdbc;
import cn.cl.rent.goods.dao.GoodsDao;
import cn.cl.rent.goods.main.Goods;

public class GoodsAction extends ActionSupport implements ServletRequestAware{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String uid;//jsp界面过来的具体的物品id
	private String typeid;//jsp界面过来的这一类物品id
	private Goods goods;//把查询到的物品封装起来
	private Goods info;
	private String searchType ;//把点击的按键封装起来
	private String condition;//把选择了的属性封装起来
	private String keyword;//把输入查询的文本封装起来
	private HttpServletRequest request;
	private Jdbc jb = new Jdbc();
	GoodsDao goodsDao = new GoodsDao();
	
	
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public Goods getInfo() {
		return info;
	}
	public void setInfo(Goods info) {
		this.info = info;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getTypeid() {
		return typeid;
	}
	public void setTypeid(String typeid) {
		this.typeid = typeid;
	}
	
	public String GoodsList()throws Exception{//查询全部物品
		Connection conn = jb.getConn();
		String sql = "select * from t_goods t1,t_topnews t2 where t1.typeid=t2.typeSign order by t1.infoDate desc";
		ArrayList<Goods> GoodList=goodsDao.getList(conn, sql);
		request.setAttribute("GoodList", GoodList);
		return "GoodsList";
	}
	public String getGoodsByType()throws Exception{		//查询分类全部结果
		request.setAttribute("mainPage", "/jsps/Goods/show/searchInfo.jsp");
		String sql="select * from t_goods t1,t_topnews t2 where t1.typeid=t2.id and t1.typeid="+typeid+" order by t1.infoDate desc";
		Connection conn=jb.getConn();
		ArrayList<Goods> searchGoodsList=goodsDao.getList(conn, sql);
		request.setAttribute("searchGoodsList", searchGoodsList);
		return "searchGoods";
	}
	public String getGoodsByTypet()throws Exception{			//查询分类的还可以交换的结果
		request.setAttribute("mainPage", "/jsps/Goods/show/searchInfott.jsp");
		String sql="select * from t_goods t1,t_topnews t2 where t1.typeid=t2.id and t1.typeid="+typeid+" and t1.payfor=1 order by t1.infoDate desc";
		Connection conn=jb.getConn();
		ArrayList<Goods> searchGoodsList=goodsDao.getList(conn, sql);
		request.setAttribute("searchGoodsList", searchGoodsList);
		return "searchGoods";
	}
	public String getGoodsByTypes()throws Exception{			//查询分类的已经交换了的结果
		request.setAttribute("mainPage", "/jsps/Goods/show/searchInfos.jsp");
		String sql="select * from t_goods t1,t_topnews t2 where t1.typeid=t2.id and t1.typeid="+typeid+" and t1.payfor=0 order by t1.infoDate desc";
		Connection conn=jb.getConn();
		ArrayList<Goods> searchGoodsList=goodsDao.getList(conn, sql);
		request.setAttribute("searchGoodsList", searchGoodsList);
		return "searchGoods";
	}
	public String detailsGoods()throws Exception{// 查看交换物品的详细信息
		request.setAttribute("mainPage", "/jsps/Goods/show/detailsInfo.jsp");
		Connection conn=jb.getConn();
		goods=goodsDao.getGoodsById(conn, uid);
		return "detailsGoods";
	}
	public String addGoods()throws Exception{//发布交换物品
		request.setAttribute("mainPage", "/jsps/addGoods/addInfo.jsp");
		return "addGoods";
	}
	public String addInfo()throws Exception{
		Connection conn=jb.getConn();
		int num=goodsDao.addGoods(conn, info);
		if(num==1){
			request.setAttribute("mainPage", "/jsps/addGoods/addInfoSuccess.jsp");
			return "addInfoSuccess";
		}else{
			request.setAttribute("error", "发布信息失败，请重新发布");
			request.setAttribute("mainPage", "/jsps/addGoods/addInfo.jsp");
			return "addInfo";
		}
	}
	public String searchGoods()throws Exception{//搜索物品
		request.setAttribute("mainPage", "/jsps/Goods/show/searchInfor.jsp");
		StringBuffer sb=new StringBuffer("select * from t_goods t1,t_topnews t2 where t1.typeid=t2.id ");
		if("like".equals(searchType)){
			sb.append(" and t1."+condition+" like '%"+keyword+"%'");
		}else{
			sb.append(" and t1."+condition+"='"+keyword+"'");
		}
		sb.append(" order by t1.infoDate desc ");
		Connection conn=jb.getConn();
		ArrayList<Goods> searchGoodsList=goodsDao.getList(conn, sb.toString());
		request.setAttribute("searchGoodsList", searchGoodsList);
		return "searchSuccess";
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
		
	}

}
