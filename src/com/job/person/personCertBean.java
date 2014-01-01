package com.job.person;

public class personCertBean {
  private int argCount;
  private static final int argMax=100;
  private String[] certName=new String[argMax];
  private String[] certTime=new String[argMax];
  private String[] certExpl=new String[argMax];
public int getArgCount() {
	return argCount;
}
public void setArgCount(int argCount) {
	this.argCount = argCount;
}
public String[] getCertName() {
	return certName;
}
public void setCertName(String[] certName) {
	this.certName = certName;
}
public String[] getCertTime() {
	return certTime;
}
public void setCertTime(String[] certTime) {
	this.certTime = certTime;
}
public String[] getCertExpl() {
	return certExpl;
}
public void setCertExpl(String[] certExpl) {
	this.certExpl = certExpl;
}
  
  
}
