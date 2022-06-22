import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jd/model/home_page_model.dart';
import 'package:flutter_jd/providers/home_page_provider.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:provider/provider.dart'; 

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<HomePageProvider>(create: (context) {
      var provider = HomePageProvider();
      provider.loadHomePageData();
      return provider;
    },
    // Container: 如果存在子容器，则wrapper子容器，否则和父容器一样大小
    child: Scaffold(
      appBar: AppBar(title: const Text("首页")),
      body: Container(
        color: const Color(0xFFF4F4F4),
        child: Consumer<HomePageProvider>(builder: ((context, value, child) {
          // 加载动画
         if (value.isLoading) {
            return const Center(
              child: CupertinoActivityIndicator(color: Colors.red,),
            );
         } 
         // error 界面r
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
                     value.loadHomePageData();
                   },)
               ],
             ),
           );
         }
         
         HomePageModel? model = value.model;
        return ListView(
          children: [
            buildBanner(model),
            buildLogos(model),
            // 掌上秒杀头部
            buildMSHeaderWidget(),
            // 秒杀商品
            buildMSMerchant(model),
            bulidAD(model?.pageRow?.ad1 ?? []),
            bulidAD(model?.pageRow?.ad2 ?? []),
          ],
        );
      })),
      )
    ));
  }

  Widget bulidAD(List<String> ads) {
    List<Widget> list = [];
    for (var i = 0; i < ads.length; i++) {
      list.add(
        Expanded(
        child: Image.asset("assets${ads[i]}"),
      ));
    }
    return Row(
      children: list,
    );
  }

  Container buildMSMerchant(HomePageModel? model) {
    return Container(
            height: 120,
            color: Colors.white,
            child: ListView.builder(itemBuilder: ((context, index){
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Image.asset(
                      "assets${model?.quicks?[index].image}",
                       width: 85,
                       height: 85,
                    ),
                    Text("${model?.quicks?[index].price}", style: const TextStyle(color: Colors.red, fontSize: 16.0),)
                  ],
                ),
              );
            }),
            scrollDirection: Axis.horizontal,
            itemCount: model?.quicks?.length,),
          );
  }

  Container buildMSHeaderWidget() {
    return Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/image/bej.png", width: 90, height: 20),
                const Spacer(),
                const Text("更多秒杀"),
                const Icon(CupertinoIcons.right_chevron, size: 14)
              ],
            ),

          );
  }

  AspectRatio buildBanner(HomePageModel? model) {
    return AspectRatio(
            aspectRatio: 72/35,
            child: Swiper(
                    itemCount: model?.swipers?.length ?? 0,
                    pagination: const SwiperPagination(),
                    autoplay: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset("assets${model?.swipers?[index].image}");
                    },
        ),
      );
  }
  Widget buildLogos(HomePageModel? model) {

    List<Widget> list = [];
    int count = model?.logos?.length ?? 0;
    for (var i = 0; i < count; i++) {
       list.add(
         SizedBox(
           width: 60.0,
           child: Column(
             children: [
               Image.asset("assets${model?.logos?[i].image}", width: 50, height: 50,),
               Text("${model?.logos?[i].title}")
             ],
           ),
         )
       );
    }
    return Container(
      color: Colors.white,
      height: 170,
      padding: const EdgeInsets.all(10.0),
      child: Wrap(
        spacing: 7.0, // item之间水平间距
        runSpacing: 10.0, // tem之间垂直间距
        alignment: WrapAlignment.spaceAround,
        children: list,),
    );
  }
}