package com.job.enter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

/**
 * @author 
 * @date 2013-9-23
 * @fileName 
 * @version 0.0.1
 * 璇诲彇xml鐨勯厤缃枃浠�
 */
public class ReadXML {
	
	
	/**
	 * 璇诲彇xml寰楀埌Document瀵硅薄
	 */
	public Document getDocument(String path){
		Document doc = null;
		try{
			SAXReader reader = new SAXReader();
			File file = new File(path);
			InputStream in = new FileInputStream(file);
		    reader.setEncoding("UTF-8");
			doc = reader.read(in);
			return doc;
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * 鍐欏嚭xml,涓昏鏄慨鏀瑰悗瑕侀噸鏂板啓鍑�
	 */
	public void writeXml(Document doc ,String path){
		try {
			OutputFormat format = OutputFormat.createPrettyPrint();
			format.setEncoding("UTF-8");
			File f = new File(path);
			//System.out.println("file-->"+f.getPath());
			OutputStream out = new FileOutputStream(f);
			XMLWriter writer = new XMLWriter(out, format);
			writer.write(doc);  
	        writer.close(); 
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 鏍煎紡鍖朞UT
	 */
	public PrintWriter getOut(HttpServletResponse response, PrintWriter out) {
		try {
			response.setHeader("Cache-Control", "no-cache");
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
		} catch (IOException e) {
		}
		return out;
	}

	/**
	 * ajax鎵撳嵃杩斿洖鍙傛暟
	 * 
	 * @param str
	 */
	public void ajaxPri(String str, HttpServletResponse response) {
		 PrintWriter out = null;
		out = this.getOut(response, out);
		out.print(str);
		out.flush();
		out.close();
	}
}
