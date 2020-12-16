import 'dart:async';
import 'dart:convert' as convert;
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';

class Base64Convert {
  static String base64Encode(String data) {
    var content = convert.utf8.encode(data);
    var digest = convert.base64Encode(content);
    return digest;
  }

  /*
  * Base64解密
  */
  static String base64Decode(String data) {
    List<int> bytes = convert.base64Decode(data);
    // 网上找的很多都是String.fromCharCodes，这个中文会乱码
    //String txt1 = String.fromCharCodes(bytes);
    String result = convert.utf8.decode(bytes);
    return result;
  }

  /*
  * 通过图片路径将图片转换成Base64字符串
  */
  // static image2Base64(String path) async {
  //   File file = new File(path);

  //   List<int> imageBytes = await file.readAsBytes();
  //   print("萨芬的拉开附近拉水电费");
  //   print("文件长度是：  " + imageBytes.length.toString());
  //   return convert.base64Encode(imageBytes);
  // }

  static Future image2Base64(String path) async {
    File file = new File(path);

    List<int> imageBytes = await file.readAsBytes();

    var r = base64Encode(imageBytes.toString());

    return r;
  }

  /*
  * 将图片文件转换成Base64字符串
  */
  static Future imageFile2Base64(File file) async {
    List<int> imageBytes = await file.readAsBytes();
    return convert.base64Encode(imageBytes);
  }

  /*
  * 将Base64字符串的图片转换成图片
  */
  static Widget base642Image(String base64Txt) {
    // Uint8List decodeTxt = convert.base64.decode(base64Txt);
    Uint8List decodeTxt = convert
        .base64Decode(base64Txt.replaceAll('\r', '').replaceAll('\n', ''));

    print("***************这是base64解码后的字符串*************");
    print(decodeTxt);
    return Image.memory(
      decodeTxt,

      width: 100, fit: BoxFit.fitWidth,
      gaplessPlayback: true, //防止重绘
      repeat: ImageRepeat.noRepeat,
      scale: 1.0,
    );

    // return decodeTxt;
  }
}
