package cn.cl.rent.goods.main;

import java.util.Date;

public class Goods {
	private int id;
	private int typeSign;
	private int uid;
	private int typeid;
	private String title;
	private String content;
	private String linkman;
	private String phone;
	private String qq;
	private Date infoDate;
	private int state;
	private int payfor;
	private String typeName;
	private String imagea;
	private String imageb;
	
	

	public int getTypeSign() {
		return typeSign;
	}
	public void setTypeSign(int typeSign) {
		this.typeSign = typeSign;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getTypeid() {
		return typeid;
	}
	public void setTypeid(int typeid) {
		this.typeid = typeid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getLinkman() {
		return linkman;
	}
	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public Date getInfoDate() {
		return infoDate;
	}
	public void setInfoDate(Date infoDate) {
		this.infoDate = infoDate;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getPayfor() {
		return payfor;
	}
	public void setPayfor(int payfor) {
		this.payfor = payfor;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getImagea() {
		return imagea;
	}
	public void setImagea(String imagea) {
		this.imagea = imagea;
	}
	public String getImageb() {
		return imageb;
	}
	public void setImageb(String imageb) {
		this.imageb = imageb;
	}
	@Override
	public String toString() {
		return "Goods [uid=" + uid + ", typeid=" + typeid + ", title=" + title
				+ ", content=" + content + ", linkman=" + linkman + ", phone="
				+ phone + ", qq=" + qq + ", infoDate=" + infoDate + ", state="
				+ state + ", payfor=" + payfor + ", typeName=" + typeName
				+ ", imagea=" + imagea + ", imageb=" + imageb + "]";
	}

	
	

}
