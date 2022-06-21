import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jd/pages/product_detail_page.dart';
import 'package:flutter_jd/providers/category_page_provider.dart';
import 'package:provider/provider.dart';

import '../model/category_content_model.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoryPageProvider>(create: (context) {
      var provider = CategoryPageProvider();
      provider.loadCategoryPageData();
      return provider;
    },
    child: Scaffold(
      appBar: AppBar(title: const Text("分类")),
      body:  Container(
        color: const Color(0xFFF4F4F4),
        child: Consumer<CategoryPageProvider>(builder: ((context, value, child) {
          // 加载动画
         if (value.isLoading && value.categoryContentList.isEmpty) {
            return const Center(
              child: CupertinoActivityIndicator(color: Colors.red,),
            );
         } 
         // error 界面
         if (value.isError) {
           return Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Text(value.errorMsg),
                 OutlinedButton(
                   child: const Text("刷新", style: TextStyle(color: Colors.blue),),
                   onPressed: () {
                     value.loadCategoryPageData();
                   },)
               ],
             ),
           );
         }
         return Row(
          children: [
            SizedBox(
              width: 90,
              child: ListView.builder(itemBuilder: (context, index) {
                return InkWell(
                  child: Container(
                    height: 50,
                    color: value.tabIndex == index ? Colors.white : const Color(0xFFF8F8F8),
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(value.categoryNavList[index], textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, color: value.tabIndex == index ? const Color(0xFFE93B3D) : const Color(0xFF333333)),),
                    ),
                    onTap: () {
                      if (value.tabIndex != index) {
                         value.loadCategoryContentData(index);
                         value.tabIndex = index;
                      }
                    },
                );
              },
              itemCount: value.categoryNavList.length,)
              ),
              Expanded(
                child: Stack(
                  children: [
                    ListView.builder(itemBuilder: (context, index) {
                          return generateCombinedWidget(value.categoryContentList[index]);},
                           itemCount: value.categoryContentList.length,), 
                    value.isLoading ? const Center(child: CupertinoActivityIndicator(),) : Container(),
                  ],
                )
                )
         ],);
      })),
      )
    ));
  }

  Widget generateCombinedWidget(CategoryContentModel model) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 30,
              margin: const EdgeInsets.only(top: 10.0, left: 10.0),
              child: Text(
                model.title, 
                style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
            ),
            Wrap(
              spacing: 7.0,
              runSpacing: 10.0,
              alignment: WrapAlignment.start,
              children: generateItemWidget(model.desc ?? []),
            )
          ],
        ),
    );
  }

  List<Widget> generateItemWidget(List<CategoryContentItemModel> items) {
     List<Widget> list = [];
     for (var i = 0; i < items.length; i++) {
        list.add(
          InkWell(
            child: Container(
            color: Colors.transparent,
            width: 60.0,
            child: Column(
              children: [
                Image.asset("assets${items[i].img}", width: 50, height: 50, colorBlendMode: BlendMode.clear,),
                const SizedBox(height: 8,),
                Text(items[i].text ?? "默认商品名称"),
              ],
            ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailPage(title: items[i].text)));
            },
          ),
          );
     }
     return list;
  }




}