
class HomePageModel {
  
  late List<Swipers>? swipers;
  late List<Logos>? logos;
  late List<Quicks>? quicks;
  late PageRow? pageRow;

  HomePageModel({this.swipers, this.logos, this.quicks, this.pageRow});
  HomePageModel.fromJson(Map<String, dynamic> json) {
        swipers = <Swipers>[];
        json["swipers"]?.forEach((v) {
          swipers?.add(Swipers.fromJson(v));
        });

        logos = <Logos>[];
        json["logos"]?.forEach((v) {
          logos?.add(Logos.fromJson(v));
        });

        quicks = <Quicks>[];
        json["quicks"]?.forEach((v) {
          quicks?.add(Quicks.fromJson(v));
        });

        pageRow = PageRow.fromJson(json["pageRow"]);
  }
}

class Swipers {

  final String image;
  Swipers(this.image); // 如果加了{} image需要声明为可选类型 "?"
  Swipers.fromJson(Map<String, dynamic> json) : image = json["image"];
}

class Logos {

  final String image;
  final String title;
  Logos(this.image, this.title);
  Logos.fromJson(Map<String, dynamic> json) : image = json["image"], title = json["title"];
}

class Quicks {

  final String image;
  final String price;
  Quicks(this.image, this.price);
  Quicks.fromJson(Map<String, dynamic> json) : image = json["image"], price = json["price"];
}

class PageRow {

   final List<String> ad1;
   final List<String> ad2;
   PageRow(this.ad1, this.ad2);
   // 通过Map的key取出的是 dynamic类型，需要转换一下类型: xx.cast<T>()
   PageRow.fromJson(Map<String, dynamic> json) : ad1 = json["ad1"].cast<String>(), ad2 = json["ad2"].cast<String>();
}