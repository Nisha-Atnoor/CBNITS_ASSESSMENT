
import 'package:cbnits_assessment/model/products_model.dart';
import 'package:cbnits_assessment/services/product_services.dart';
import 'package:flutter/material.dart';


class ProductList extends StatefulWidget {
  final String product;
  final ValueSetter<ProductsModel> valueSetter;
  ProductList({this.product,this.valueSetter});

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  Future<List<ProductsModel>> future;
  bool isAddedToCart = false;
  int count;

  @override
  void initState() {
    super.initState();
    ProductServices productsServices = new ProductServices();
    productsServices.setCategoryName(widget.product);
    future = productsServices.fetchElectronics();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context,snapshot){
          if(snapshot.hasError){
            print(snapshot.error);
          }
          else if(snapshot.hasData){
            var data = snapshot.data;
            return Container(
              margin: EdgeInsets.fromLTRB(10.0,0.0,10.0,10.0),
              child: ListView.separated(
                  separatorBuilder: (context,__) => Divider(thickness: 3,color: Colors.black26,),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context,index){
                    return Column(
                      children: [
                        Text(data[index].title,style: TextStyle(height: 3),),
                        Row(
                          children: [
                            Card(child: Image.network(data[index].thumbNail,height: 200, width: 200,)),
                            SizedBox(width: 10.0,),
                            Column(
                              children: [
                                Text('Price: ${data[index].price.toString()}',style: TextStyle(fontSize: 25,color: Colors.black),),
                                SizedBox(height: 10.0),
                                ElevatedButton(onPressed: (){
                                  widget.valueSetter(data[index]);
                                }, child: Text('Add to cart')),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ) ;
                  }),
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}






