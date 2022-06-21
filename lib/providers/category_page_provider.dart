
import 'package:flutter/material.dart';
import 'package:flutter_jd/model/category_content_model.dart';
import '../config/request_config.dart';
import '../net/request.dart';

class CategoryPageProvider with ChangeNotifier {
      
     bool isLoading = false;
     bool isError = false;
     String errorMsg = "";
     List<String> categoryNavList = [];
     List<CategoryContentModel> categoryContentList = [];
     // 点中的索引
     int tabIndex = 0;

    void loadCategoryPageData() {
      isLoading = true;
      isError = false;
      Request.requestData(API.categoryNav).then((res) {
        isLoading = false;
           if (res.data is List) {
              for (var i = 0; i < res.data.length; i++) {
                 categoryNavList.add(res.data[i]);
              }
              loadCategoryContentData(tabIndex);
           }
         notifyListeners();
      }).catchError((error) {
         isLoading = false;
         errorMsg = error;
         isError = true;
         notifyListeners();
      });
    }
    void loadCategoryContentData(int index) {
      String? url;
      if (index % 2 == 0) {
        url = API.hotRecommand;
      } else {
        url = API.otherRecommand;
      }
      isLoading = true;
      isError = false;
      Request.requestData(url).then((res) {
         isLoading = false;
         if (res.data is List) {
          categoryContentList.clear();
           for (var i = 0; i < res.data.length; i++) {
             CategoryContentModel model = CategoryContentModel.fromJson(res.data[i]);
             categoryContentList.add(model);
           }
         }
         notifyListeners();
      }).catchError((error) {
         isLoading = false;
         notifyListeners();
      });
    }
}