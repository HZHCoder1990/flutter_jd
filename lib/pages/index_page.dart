
import 'package:flutter/material.dart';
import 'package:flutter_jd/pages/cart_page.dart';
import 'package:flutter_jd/pages/category_page.dart';
import 'package:flutter_jd/pages/home_page.dart';
import 'package:flutter_jd/pages/user_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: 0,
        children: const [
          HomePage(),
          CategoryPage(),
          CartPage(),
          UserPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
           BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
           BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
           BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "购物车"),
           BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "我的")
        ],
      ),
    );
  }
}