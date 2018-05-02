package com.util;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @Author: 王小萌
 * @Date: 2018/5/1 下午2:11
 * @Param: {加密明文 }
 * @Return: {加密密文 }
 * @Descripton: <信息摘要算法 >
 */
public class MD5{

    /**
     * MD5加密算法
     * @param {需要转化为MD5码的字符串}
     * @return 返回一个32位16进制的字符串
     */
    public static String MD5(String key) {
        char hexDigits[] = {
                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'
        };
        try {
            byte[] btInput = key.getBytes();
            // 获得MD5摘要算法的 MessageDigest 对象
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            // 使用指定的字节更新摘要
            mdInst.update(btInput);
            // 获得密文
            byte[] md = mdInst.digest();
            // 把密文转换成十六进制的字符串形式
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            return null;
        }
    }

    public static void main(String[] args){

        String MD5_String;
        MD5_String = MD5("weiqingde");
        System.out.println(MD5_String);
    }
}
