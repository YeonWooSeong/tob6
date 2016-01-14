package com.tob.admin;

import java.io.IOException;
import java.lang.Integer;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class AdminTest {
	public static class NaverParse {

	    public static void main(String args[]) {
	        // System.out.println(parse("")); // 뭘 의미하는지는 알겠지?
	        return;
	    }

	 public static String getContent(Element element, String tagName)
	 {
	   NodeList list = element.getElementsByTagName(tagName);
	   Element cElement = (Element)list.item(0);
	   
	   if (cElement.getFirstChild()!=null) {
	   return cElement.getFirstChild().getNodeValue(); // Integer로 설정되어 있는 값들은 여기서 
	                                                                                            // Null point exception 발생....
	   } else {
	   return "";
	   }
	 }

	 public static String parse(String uri)
	 {
	     String s_out = "";
	  DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

	  try
	  {
	   DocumentBuilder builder = dbf.newDocumentBuilder();
	   Document doc = builder.parse(uri);
	   
	   //Document doc = builder.parse("http://openapi.naver.com/search?key=c1b406b32dbbbbeee5f2a36ddc14067f&query=book&display=100&start=1&target=book_adv&d_isbn=8985966812");
	   Element root = doc.getDocumentElement();
	   NodeList list = root.getElementsByTagName("item");

	      for(int i=0; i<list.getLength();i++){
	    Element element = (Element)list.item(i);    
	                s_out += "<hr/>";           
	                String s_temp = "";
	                s_out += "title : " + getContent(element, "title") + "<br/>";
	                s_out += "link : " + getContent(element, "link") + "<br/>";
	                s_out += "image : " + getContent(element, "image") + "<br/>";
	                s_out += "author : " + getContent(element, "author") + "<br/>";
	                s_out += "publisher : " + getContent(element, "publisher") + "<br/>";
	                s_out += "isbn : " + getContent(element, "isbn") + "<br/>";
	                s_out += "description : " + getContent(element, "description") + "<br/>";
	   }

	  }
	  catch (ParserConfigurationException e){ e.printStackTrace(); }
	  catch (SAXException e){ e.printStackTrace(); }
	  catch(IOException e){ e.printStackTrace(); }
	  return s_out;
	 }
	}

}
