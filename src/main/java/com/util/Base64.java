package com.util;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import java.io.IOException;

/**
 * @Author: 王小萌
 * @Date: 2018/5/1 下午1:44
 * @Param: {需要编码的内容 }
 * @Return: {编码后的内容 }
 * @Descripton: <>
 */
public class Base64 {

    public static String encode(String encodeContent){
        if(encodeContent == null){
            return null;
        }
        BASE64Encoder encoder = new BASE64Encoder();
        return encoder.encode(encodeContent.getBytes());
    }

    public static String encode(byte[] encodeText){
        return encode(new String(encodeText));
    }

    //解密方法
    public static String decode(String decodeContent){
        byte[] bytes = null;
        if(decodeContent == null){
            return null;
        }
        try {
            bytes = new BASE64Decoder().decodeBuffer(decodeContent);
        } catch (IOException e) {
            throw new RuntimeException("error",e);
        }
            return new String(bytes);
    }

}