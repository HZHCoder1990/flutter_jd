
import 'package:dio/dio.dart';

class ComResponse<T> {
   final int code;
   final String msg;
   final T? data;
   // 命名可选参数，在调用的时候可以不传递，但是变量声明为 final(即必须有值，不能为null)， 所以需要把变量类型修改为option类型(可以为null)
   ComResponse({required this.code, required this.msg, this.data});
}

class Request {

  static var dio = Dio();

  static Future<ComResponse<T>> requestData<T>(String path, {Map<String, dynamic>? queryParameters, dynamic body, String method = 'get'}) async {
     
     try {
      Response response = method == 'get' ?
            await dio.get(path, queryParameters: queryParameters) : 
            await dio.post(path, data: body);
            return ComResponse(
              code: response.data["code"],
              msg: response.data["msg"],
              data: response.data["data"]
              );
     } on DioError catch(e) {
        // 只会返回服务器的错误
        String message = e.message;
        if (e.type == DioErrorType.connectTimeout) {
           message = "连接超时";
        } else if (e.type == DioErrorType.receiveTimeout) {
          message = "接受超时";
        } else if (e.type == DioErrorType.response) {
          message = "404";
        }
        return Future.error(message);
     }
  }
}