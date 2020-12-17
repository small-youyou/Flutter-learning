import 'dart:io';

import 'dart:convert' as convert;
import 'package:dio/dio.dart';

class UploadFile {
  ///上传的服务器地址
  static String netUploadUrl = "http://47.110.150.159:8080/upload";

  ///dio 实现文件上传
  static Future<String> fileUplod(String localPath) async {
    ///创建Dio
    List l = localPath.split("/");
    String fileName = l[l.length - 1];
    BaseOptions option = new BaseOptions(
        //     // baseUrl: API_PREFIX,
        //     // connectTimeout: CONNECT_TIMEOUT,
        //     // receiveTimeout: RECEIVE_TIMEOUT,
        //     // headers: params,
        //     contentType: 'multipart/form-data',
        responseType: ResponseType.plain);
    // Dio dio = new Dio(option);
    Dio dio = new Dio(option);
    Map<String, dynamic> map = Map();
    map["fileName"] = await MultipartFile.fromFile(localPath);

    // map["json"] = convert.jsonEncode({
    //   "keywords": "1",
    //   "touserid": "666",
    //   "fromuserid": "456",
    //   "title": "qingchun"
    // });

    ///通过FormData
    FormData formData = FormData.fromMap(map);

    ///发送post
    Response response = await dio.post(
      netUploadUrl, data: formData,

      ///这里是发送请求回调函数
      ///[progress] 当前的进度
      ///[total] 总进度
      onSendProgress: (int progress, int total) {
        print("当前进度是 $progress 总进度是 $total");
      },
    );

    ///服务器响应结果
    print("url：" + response.data.toString());
    return response.data.toString();
  }
}
