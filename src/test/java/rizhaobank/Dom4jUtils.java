package rizhaobank;

import org.dom4j.Attribute;
import org.dom4j.Element;

import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

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
}
