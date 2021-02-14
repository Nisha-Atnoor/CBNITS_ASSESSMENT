import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final cart;
  final sum;
  final quantity;
  CartScreen({this.cart,this.sum,this.quantity});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text(cart[index].title),
                  Row(
                    children: [
                      Card(child: Image.network(cart[index].thumbNail,height: 200, width: 200,)),
                      SizedBox(width: 20,),
                      Column(
                        children: [
                          Text('Price: ${cart[index].price.toString()}'),
                          // SizedBox(height: 8,),
                          // Row(
                          //   children: [
                          //     Icon(Icons.remove),
                          //     Text(' Items '),
                          //     Icon(Icons.add),
                          //   ],
                          // )
                        ],
                      )
                    ],
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: cart.length,
            shrinkWrap: true,),
        ),
        Container(
          margin: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text('Total Checkout Price: ${sum.toString()}',style: TextStyle(fontSize: 25.0),),
              Text('Total quantity: $quantity',style: TextStyle(fontSize: 25.0)),
            ],
          ),
        )
      ],
    );
  }
}
