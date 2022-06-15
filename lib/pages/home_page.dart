import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            color: Colors.orange,
            child: const Text("第一行文字", style: TextStyle(color: Colors.red),),
          ),
           Container(
             color: Colors.yellow,
            child:const Text("第二行文字哈哈哈", style: TextStyle(color: Colors.lightBlue),),
          ),
        ],
        )
    );
  }
}