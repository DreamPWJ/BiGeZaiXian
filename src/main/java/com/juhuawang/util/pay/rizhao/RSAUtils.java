package com.juhuawang.util.pay.rizhao;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.crypto.Cipher;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPrivateKeySpec;
import java.security.spec.RSAPublicKeySpec;

/**
 * RSA数字加密解密算法以base64编码解码及公共类
 *
 * @author pwj
 */
public final class RSAUtils {

    private final static String CHARSET = "UTF-8";
    private final static String CIPHER_STR = "RSA/ECB/PKCS1Padding";

    private final static int MAX_ENCRYPT_BLOCK = 117;
    private final static int MAX_DECRYPT_BLOCK = 128;
    private final static String KEY_MODULES = "95984012661351382120493431519320707626959862950582384531640095854247013773487601892784820904399407369415795292371262881816685065529272426945658756120126538255144255190278601408965290316725406401892310945738062311960762605209413834939545912912355343346861442044770377155452932542596618760807538057215388214599";
    private final static String KEY_EXPONENT_PRIVATE = "8922205855210836929948669985133615375489257748980696195534605855380514944353364827972673893367123757487846940218895180982151233947301945846666053409277366183077214044500852467292872989966368733151911158007291131581374460456590126873875583927432058995328878404729554558029276194269633233630151407480159036513";
    private final static String KEY_EXPONENT_PUBLIC = "65537";

    /**
     * 字节数组转换成十六进制的字符串
     *
     * @param bytes
     * @return
     */
    public static String byteArray2HexString(byte[] bytes) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            String tmp = Integer.toHexString(0xFF & b);
            if (tmp.length() < 2) {
                tmp = "0" + tmp;
            }
            sb.append(tmp);
        }

        return sb.toString();
    }

    /**
     * 字符串转换成十六进制的字节数组
     */
    public static byte[] hexString2ByteArray(String hexStr) {
        if (hexStr.length() % 2 != 0) {
            System.out.println("Hex string length is not even!");
            return null;
        }

        byte[] bytes = new byte[hexStr.length() / 2];
        int j = 0;
        for (int i = 0; i < bytes.length; i++) {
            char c0 = hexStr.charAt(j++);
            char c1 = hexStr.charAt(j++);
            bytes[i] = (byte) (parse(c0) << 4 | parse(c1));
        }

        return bytes;
    }


    private static int parse(char c) {
        if (c >= 'a') {
            return (c - 'a' + 10) & 0x0F;
        }

        if (c >= 'A') {
            return (c - 'A' + 10) & 0x0F;
        }

        return (c - '0') & 0x0F;
    }

    /**
     * RSA数字解密
     */
    public static String decode(String src) throws Exception {
        BigInteger bn = new BigInteger(KEY_MODULES);
        BigInteger bd = new BigInteger(KEY_EXPONENT_PRIVATE);
        RSAPrivateKeySpec keySpec = new RSAPrivateKeySpec(bn, bd);
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        PrivateKey privateKey = keyFactory.generatePrivate(keySpec);

        Cipher rsa = Cipher.getInstance(CIPHER_STR);
        rsa.init(Cipher.DECRYPT_MODE, privateKey);

        byte[] bytes = hexString2ByteArray(src);
        int len = bytes.length;

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        int offset = 0;
        byte[] buffer;
        int i = 0;
        //对数据分段解密
        while (len - offset > 0) {
            if (len - offset > MAX_DECRYPT_BLOCK) {
                buffer = rsa.doFinal(bytes, offset, MAX_DECRYPT_BLOCK);
            } else {
                buffer = rsa.doFinal(bytes, offset, len - offset);
            }
            baos.write(buffer, 0, buffer.length);
            i++;
            offset = i * MAX_DECRYPT_BLOCK;
        }

        byte[] decryptData = baos.toByteArray();
        baos.flush();
        baos.close();

        return new String(decryptData, CHARSET);
    }

    /**
     * RSA数字加密
     *
     * @param src
     * @return
     * @throws Exception
     */
    public static String encode(String src) throws Exception {
        BigInteger bn = new BigInteger(KEY_MODULES);
        BigInteger be = new BigInteger(KEY_EXPONENT_PUBLIC);
        RSAPublicKeySpec keySpec = new RSAPublicKeySpec(bn, be);
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        PublicKey publicKey = keyFactory.generatePublic(keySpec);//公钥对象

        Cipher rsa = Cipher.getInstance(CIPHER_STR);
        rsa.init(Cipher.ENCRYPT_MODE, publicKey);

        byte[] bytes = src.getBytes(CHARSET);
        int len = bytes.length;

        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        int offset = 0;
        byte[] buffer;
        int i = 0;
        while (len - offset > 0) {
            if (len - offset > MAX_ENCRYPT_BLOCK) {
                buffer = rsa.doFinal(bytes, offset, MAX_ENCRYPT_BLOCK);
            } else {
                buffer = rsa.doFinal(bytes, offset, len - offset);
            }
            baos.write(buffer, 0, buffer.length);
            i++;
            offset = i * MAX_ENCRYPT_BLOCK;
        }
        byte[] encryptData = baos.toByteArray();
        baos.flush();
        baos.close();

        return byteArray2HexString(encryptData);
    }

    /**
     * base64解码
     */
    public static String base64Decode(String src) throws IOException {
        BASE64Decoder decoder = new BASE64Decoder();
        return new String(decoder.decodeBuffer(src), CHARSET);
    }

    /**
     * base64编码
     *
     * @param bytes
     * @return
     */
    public static String base64Encode(byte[] bytes) {
        BASE64Encoder encoder = new BASE64Encoder();
        return encoder.encode(bytes);
    }
}
