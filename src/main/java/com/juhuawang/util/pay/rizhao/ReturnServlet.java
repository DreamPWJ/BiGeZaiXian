package com.juhuawang.util.pay.rizhao;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by pwj  on 2015/11/10 0010.
 * 支付成功返回的servlet类
 */
@WebServlet("/returnServlet")
public class ReturnServlet extends HttpServlet {
    private static final long serialVersionUID = 6936131509609404861L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        String sendStr = request.getParameter("sendStr");
        try {
            //先RSA解密后base64解码
            String xml = RSAUtils.base64Decode(RSAUtils.decode(sendStr));
            Document doc = DocumentHelper.parseText(xml);
            Element root = doc.getRootElement();
            Element opReq = root.element("opReq");
            String returnCode = opReq.element("RESPCODE").getTextTrim();
            String returnMsg = opReq.element("RESPSSAGE").getTextTrim();

            if ("0".equals(returnCode)) {
                returnCode = "成功";
            } else if ("1".equals(returnCode)) {
                returnCode = "失败";
            } else if ("9".equals(returnCode)) {
                returnCode = "超时";
            }
            request.setAttribute("msg", xml);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/return.jsp");
            dispatcher.forward(request, response);
    /*		response.sendRedirect("/return.jsp");*/
/*			PrintWriter out = response.getWriter();
			out.print("<html><head><title>日聚电子商务平台</title></head>");
			out.print("<body><h1>支付"+returnCode+"</h1>");
			out.print("<br>");
			out.print("<h3>"+returnMsg+"</h3></body>");
			out.close();*/
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
