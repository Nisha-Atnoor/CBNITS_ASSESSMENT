import 'package:cbnits_assessment/model/products_model.dart';
import 'package:cbnits_assessment/ui/cart.dart';
import 'package:cbnits_assessment/ui/product_list_screen.dart';
import 'package:flutter/material.dart';

class TabApp extends StatefulWidget {
  final String product;
  TabApp({this.product});

  @override
  _TabAppState createState() => _TabAppState();
}

class _TabAppState extends State<TabApp> {
  List<ProductsModel> cart = [];
  int sum = 0;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.product),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Product List',
                ),
                Tab(
                  text: 'Cart List',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ProductList(product: widget.product,valueSetter: (selectedProduct){
                setState(() {
                  sum=0;
                   cart.add(selectedProduct);
                    cart.forEach((element) {
                    sum = sum + element.price;
                  });

                });
                count++;
                }),
              CartScreen(cart: cart,sum: sum,quantity:count),
            ],
          ),
        ));
  }
}
