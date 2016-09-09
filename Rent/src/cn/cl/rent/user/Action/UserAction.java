package cn.cl.rent.user.Action;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import cn.cl.rent.dbutil.Jdbc;
import cn.cl.rent.user.dao.UserDao;
import cn.cl.rent.user.main.User;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport implements ServletRequestAware{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	private User user;
	private Jdbc jb= new Jdbc();

	UserDao userdao = new UserDao();
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	public String isLogin()throws Exception{//用session判断管理员是否已经登录
		HttpSession session=request.getSession();
		Object object=session.getAttribute("userlogin");
		if(object==null || !(object instanceof User)){
			return "login";
		}else{
			return "main";
		}
	}
	public String login()throws Exception{//管理员登录，并将登录信息封装在session中
		HttpSession session =request.getSession();
		Connection conn  = jb.getConn();
		User userlogin = userdao.login(conn, user);
		if( userlogin==null){
			request.setAttribute("error", "密码或用户名错误");
			return "login";
		}else{
			session.setAttribute("userlogin", userlogin);
			return "main";
		}	
		
	}
	public String loginOut()throws Exception{//注销管理员登录
		HttpSession session=request.getSession();
		session.removeAttribute("userlogin");
		return "loginOut";
	}
	
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

}
