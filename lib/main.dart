

import 'package:flutter/material.dart';
import 'package:flutter_jd/pages/index_page.dart';
import 'package:flutter_jd/providers/bottom_nav_provider.dart';
import 'package:provider/provider.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider.value(
        value: BottomNavProvider(),
        child: const IndexPage(),
        ),
    );
  }
}