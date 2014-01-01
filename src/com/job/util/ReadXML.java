package com.job.util;

import java.io.File;


import org.dom4j.Document;

import org.dom4j.io.SAXReader;



public class ReadXML {
	public static Document load(String filename)
	{
		Document document=null;
		try
		{
			SAXReader saxReader=new SAXReader();
			document=saxReader.read(new File(filename));
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
		}
		return document;
	}
}
