package com.job.person;

public class personMsgBean {
  private final int argMax=100;
  private int arg1Count,arg2Count,arg3Count;
  private String[] jMsg=new String[argMax];
  private String[] hMsg=new String[argMax];
  private String[] oMsg=new String[argMax];
public int getArg1Count() {
	return arg1Count;
}
public void setArg1Count(int arg1Count) {
	this.arg1Count = arg1Count;
}
public int getArg2Count() {
	return arg2Count;
}
public void setArg2Count(int arg2Count) {
	this.arg2Count = arg2Count;
}
public int getArg3Count() {
	return arg3Count;
}
public void setArg3Count(int arg3Count) {
	this.arg3Count = arg3Count;
}
public String[] getjMsg() {
	return jMsg;
}
public void setjMsg(String[] jMsg) {
	this.jMsg = jMsg;
}
public String[] gethMsg() {
	return hMsg;
}
public void sethMsg(String[] hMsg) {
	this.hMsg = hMsg;
}
public String[] getoMsg() {
	return oMsg;
}
public void setoMsg(String[] oMsg) {
	this.oMsg = oMsg;
}
  
  
}
