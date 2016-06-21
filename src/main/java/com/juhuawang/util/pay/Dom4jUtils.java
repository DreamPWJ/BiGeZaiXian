package com.juhuawang.util.pay;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import java.util.*;

/**
 * Created by pwj on 15/6/3.
 * Dom4j公共类 处理解析xml操作
 */
public final class Dom4jUtils {

    /**
     * 将内存中的xml元素内容转换成没有空格的String字符串的方法（可用于以xml格式传递数据）
     *
     * @param element
     */
    public static String getXmlContentWithoutWhitespace(Element element) {
        StringBuilder buffer = new StringBuilder();

        buffer.append("<").append(element.getName());
        //获取元素属性集合
        Iterator<Attribute> attrIter = element.attributeIterator();
        //遍历xml元素集合
        while (attrIter.hasNext()) {
            Attribute attr = attrIter.next();//获取属性
            buffer.append(" ").append(attr.getName()).append("=\"").append(attr.getValue()).append("\"");//拼接字符串
        }

        buffer.append(">");
        //元素下面是否还有内容
        if (element.hasContent()) {
            List<Element> list = element.elements();//获取元素下面的集合
            if (list.isEmpty()) {
                buffer.append(element.getText());//没有下级元素后 追加字符串
            } else {
                ListIterator<Element> li = list.listIterator();
                while (li.hasNext()) {
                    Element child = li.next();//获取子集元素
                    buffer.append(getXmlContentWithoutWhitespace(child));//如果有下级元素 递归调用
                }
            }
        }

        buffer.append("</").append(element.getName()).append(">");

        return buffer.toString();
    }


    /**
     * DOM4j将xml格式的字符串转成xml格式数据并且解析xml 存入map中
     *
     * @param protocolXML
     */
    public static Map<String, Object> parseStringXML(String protocolXML) {

        Map<String, Object> xmlmap = new HashMap<String, Object>();
        try {
            //Document对象创建
            Document doc = (Document) DocumentHelper.parseText(protocolXML);
            //获取根节点
            Element roots = doc.getRootElement();
            // System.out.println("根节点" + roots.getName());
            Iterator Elements = roots.elementIterator();
            //根节点迭代遍历
            while (Elements.hasNext()) {
                Element user = (Element) Elements.next();
                // System.out.println("节点" + user.getName() + "\t   text=" + user.getText());
                List subElements = user.elements();
                List user_subElements = user.elements(user.getName());//指定获取那个元素
                // System.out.println("size==" + subElements.size());
                for (int i = 0; i < subElements.size(); i++) {
                    Element ele = (Element) subElements.get(i);
                    //获取信息的节点名 节点文本信息
                    xmlmap.put(ele.getName(), ele.getText());
                    // System.out.println("叶级节点名： "+ele.getName() + " : " + "叶级节点文本："+ele.getText() + " ");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return xmlmap;
    }

}
