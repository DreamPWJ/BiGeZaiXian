package com.juhuawang.util.pay.zhongguo;/*
 * @(#)P7SignTest.java 1.0 2008-9-23
 * Copyright (c) 2008 Bank Of China Software Center
 * All rights reserved.
 */

import java.io.*;

/**
 * P7SignTest.java
 * pkcs7格式签名工具
 * 
 * @version 1.0
 * @author SUNY
 * Written Date: 2008-9-23
 */
public class P7Sign {

	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		//参数检查
		if (args.length < 2 || args.length > 5) {
			System.out.println("Usage: \n"
					+ "B2B.P7Sign keystorefile keystorepassword [inputfile [outputfile]]\n");
			System.exit(-1);//是指所有程序（方法，类等）停止，系统停止运行
		}
		if ("-debug".equals(args[args.length - 1]))
			PKCS7Tool.setDebug(true);
		//keypassword默认与keystorepassword相同
		PKCS7Tool tool = PKCS7Tool.getSigner("E:\\B2B.pfx", "111111", "111111");
		//默认输入
		InputStream in = System.in;
		//默认输出
		OutputStream out = System.out;
		try {
			//如果有输入输出文件，使用文件代替标准输入输出
			if (args.length > 2)
				in = new FileInputStream(args[2]);
			if (args.length > 3)
				out = new FileOutputStream(args[3]);
			//读输入
			byte[] data = readData(in);
			//签名
			String signature = tool.sign(data);
			//输出签名
			out.write(signature.getBytes());
			System.out.println("[SIGN OK]");
		} finally {
			if (in != null && System.in != in)
				in.close();
			if (out != null && System.out != out)
				out.close();
		}
	}

	/**
	 * 读取输入流
	 * @param in 输入流
	 * @return 数据
	 * @throws IOException
	 */
	private static byte[] readData(InputStream in) throws IOException {
		ByteArrayOutputStream bai = new ByteArrayOutputStream();
		byte[] buf = new byte[256];
		int len;
		while ((len = in.read(buf)) > 0)
			bai.write(buf, 0, len);
		return bai.toByteArray();
	}
}
