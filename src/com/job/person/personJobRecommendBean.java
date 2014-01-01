package com.job.person;

public class personJobRecommendBean {
	private int argCount;
	  private static final int argMax=100;
	  private String[] wAddr=new String[argMax];
	  private String[] rType=new String[argMax];
	  private String[] sPosi=new String[argMax];
	  private String[] cPosi=new String[argMax];
	  
	public int getArgCount() {
		return argCount;
	}
	public void setArgCount(int argCount) {
		this.argCount = argCount;
	}
	public String[] getwAddr() {
		return wAddr;
	}
	public void setwAddr(String[] wAddr) {
		this.wAddr = wAddr;
	}
	public String[] getrType() {
		return rType;
	}
	public void setrType(String[] rType) {
		this.rType = rType;
	}
	public String[] getsPosi() {
		return sPosi;
	}
	public void setsPosi(String[] sPosi) {
		this.sPosi = sPosi;
	}
	public String[] getcPosi() {
		return cPosi;
	}
	public void setcPosi(String[] cPosi) {
		this.cPosi = cPosi;
	}
  
  
}
