package com.job.person;

public class personExpBean {
  private static final int argMax=100;
  private int argCount;
  
  private String[] start_year,start_month,
                 end_year,end_month,
                 name,tool,
                 hw_env,sw_env,
                 description,duty,
                 save=new String[argMax];

public int getArgCount() {
	return argCount;
}

public void setArgCount(int argCount) {
	this.argCount = argCount;
}

public String[] getStart_year() {
	return start_year;
}

public void setStart_year(String[] start_year) {
	this.start_year = start_year;
}

public String[] getStart_month() {
	return start_month;
}

public void setStart_month(String[] start_month) {
	this.start_month = start_month;
}

public String[] getEnd_year() {
	return end_year;
}

public void setEnd_year(String[] end_year) {
	this.end_year = end_year;
}

public String[] getEnd_month() {
	return end_month;
}

public void setEnd_month(String[] end_month) {
	this.end_month = end_month;
}

public String[] getName() {
	return name;
}

public void setName(String[] name) {
	this.name = name;
}

public String[] getTool() {
	return tool;
}

public void setTool(String[] tool) {
	this.tool = tool;
}

public String[] getHw_env() {
	return hw_env;
}

public void setHw_env(String[] hw_env) {
	this.hw_env = hw_env;
}

public String[] getSw_env() {
	return sw_env;
}

public void setSw_env(String[] sw_env) {
	this.sw_env = sw_env;
}

public String[] getDescription() {
	return description;
}

public void setDescription(String[] description) {
	this.description = description;
}

public String[] getDuty() {
	return duty;
}

public void setDuty(String[] duty) {
	this.duty = duty;
}

public String[] getSave() {
	return save;
}

public void setSave(String[] save) {
	this.save = save;
}
  
}
