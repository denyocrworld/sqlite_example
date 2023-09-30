import 'dart:math';

import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/material.dart';
import 'package:sqlite_example/core.dart';
import 'package:sqlite_example/service/product_service/product_service.dart';
import '../view/product_list_view.dart';

class ProductListController extends State<ProductListView> {
  static late ProductListController instance;
  late ProductListView view;

  @override
  void initState() {
    instance = this;
    getProducts();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List products = [];
  getProducts() async {
    products = await ProductService.get();
    setState(() {});
  }

  addProduct() async {
    var faker = Faker.instance;
    await ProductService.create(
      productName: faker.commerce.productName(),
      price: (Random().nextInt(100) + 10),
    );
    getProducts();
  }
}
