package com.job.person;

public class personHistoryBean {
  private static final int argMax=100;
  private int argCount;
  private String[] name=new String[argMax];
  private String[] update=new String[argMax];
  private String[] priv=new String[argMax];
public int getArgCount() {
	return argCount;
}
public void setArgCount(int argCount) {
	this.argCount = argCount;
}
public String[] getName() {
	return name;
}
public void setName(String[] name) {
	this.name = name;
}
public String[] getUpdate() {
	return update;
}
public void setUpdate(String[] update) {
	this.update = update;
}
public String[] getPriv() {
	return priv;
}
public void setPriv(String[] priv) {
	this.priv = priv;
}
  
}
