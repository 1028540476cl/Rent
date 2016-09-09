package cn.cl.rent.top.main;

public class Top {
	private int id;
	private int typeSign;
	private String typeName;
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTypeSign() {
		return typeSign;
	}
	public void setTypeSign(int typeSign) {
		this.typeSign = typeSign;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	@Override
	public String toString() {
		return "Top [id=" + id + ", typeSign=" + typeSign + ", typeName="
				+ typeName + "]";
	}
	
}
