import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {

  final String? title;
  const ProductDetailPage({Key? key, this.title}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.title}的详情页"),),
      body: Container(),
    );
  }
}