// 定义请求的方法
enum HttpMethod { get, post,delete }

abstract class BaseRequest {

  var pathParams;
  // 是否使用https
  bool useHttps = true;

  // 设置域名
  String authority() {
    return "";
  }

  HttpMethod httpMethod();

  String path();

  String url() {
    Uri uri;
    String pathStr = path();
    if (pathParams != null) {
      if (path().endsWith("/")) {
        pathStr = "${path()}$pathParams";
      } else {
        pathStr = "${path()}/$pathParams";
      }
    }
    // http和https的切换
    if (useHttps) {
       uri = Uri.https(authority(), pathStr, pathParams);
    } else {
       uri = Uri.http(authority(), pathStr, pathParams);
    }
    return uri.toString();
  }

  bool needLogin();

  Map<String, dynamic> params = {};
  // 添加参数
  BaseRequest add(String k, dynamic v) {
    params[k] = v;
    return this;
  }

  Map<String, dynamic> header = {};
  // 添加header
  BaseRequest addHeader(String k, dynamic v) {
    
  }

}
