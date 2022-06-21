class CategoryContentModel {

  late String title;
  late List<CategoryContentItemModel>? desc;

  CategoryContentModel(this.title, this.desc);
  CategoryContentModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    if (json["desc"] is List) {
      desc = [];
      for (var i = 0; i < json["desc"].length; i++) {
        desc?.add(CategoryContentItemModel.fromJson(json["desc"][i]));
      }
  }
  } 
}

class CategoryContentItemModel {
  late String? text;
  late String? img;
  
  CategoryContentItemModel({this.text, this.img});
  CategoryContentItemModel.fromJson(Map<String, dynamic> json) {
    text = json["text"];
    img = json["img"];
  }
}

