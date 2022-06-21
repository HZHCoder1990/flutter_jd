import 'package:flutter/material.dart';
import 'package:flutter_jd/model/home_page_model.dart';
import '../config/request_config.dart';
import '../net/request.dart';

class HomePageProvider with ChangeNotifier {

     HomePageModel? model;
     bool isLoading = false;
     bool isError = false;
     String errorMsg = "";
    // 请求首页数据
    void loadHomePageData() {
      isLoading = true;
      isError = false;
      Request.requestData(API.homeApi).then((res) {
        isLoading = false;
         if (res.code == 200) {
           model = HomePageModel.fromJson(res.data);
         }
         notifyListeners();
      }).catchError((error) {
         isLoading = false;
         errorMsg = error;
         isError = true;
         notifyListeners();
      });
    }
}