
class API {

  // 常量: 小驼峰命名
  static const String baseUrl = "http://localhost:8080/flutter_jd/datas";
  // 首页数据
  static const String homeApi = "$baseUrl/home.json";
  // 分类左边导航数据
  static const String categoryNav = "$baseUrl/navigationLeft.json";
  // 分类右侧数据(热门推荐)
  static const String hotRecommand = "$baseUrl/hotRecommand.json";
  // 分类右侧数据(其他推荐)
  static const String otherRecommand = "$baseUrl/otherRecommand.json";
}