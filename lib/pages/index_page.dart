
import 'package:flutter/material.dart';
import 'package:flutter_jd/pages/cart_page.dart';
import 'package:flutter_jd/pages/category_page.dart';
import 'package:flutter_jd/pages/home_page.dart';
import 'package:flutter_jd/pages/user_page.dart';
import 'package:provider/provider.dart';

import '../providers/bottom_nav_provider.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BottomNavProvider>(builder: (context, provider, _) => IndexedStack(
        index: provider.currentIndex,
        children: const [
          HomePage(),
          CategoryPage(),
          CartPage(),
          UserPage()
        ],
      ),
      ),
      bottomNavigationBar: Consumer<BottomNavProvider>(builder: ((context, value, child) => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: value.currentIndex,
        items: const [
           BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
           BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
           BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "购物车"),
           BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "我的")
        ],
        onTap: (index) {
          value.currentIndex = index;
        },
      )
      ),
      ),
    );
  }
}