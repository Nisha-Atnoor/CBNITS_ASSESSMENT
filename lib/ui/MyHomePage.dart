
import 'package:flutter/material.dart';
import 'package:cbnits_assessment/services/network_call.dart';

import 'SecondScreen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Network network = new Network();
  Future<List<dynamic>> future;

  @override
  void initState() {
    super.initState();
    future = network.fetchCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('CBNITS Task'),

        ),
        body: listOfCategories(),
      ),
    );
  }

  Widget listOfCategories() {
    return Container(

      child: Column(
        children: [
          Container(
              child: Text(
                'List of categories',
                style: TextStyle(fontSize: 30.0),
              )),
          FutureBuilder(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                } else if (snapshot.hasData) {
                  var data = snapshot.data;
                  print(data.toString());
                  return Container(
                    color: Colors.blueGrey,
                    margin: EdgeInsets.all(10.0),
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                              padding: EdgeInsets.all(10.0),
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TabApp(product: data[index])));
                                  },
                                  child: Center(
                                    child: Text(
                                      data[index].toString(),
                                      style: TextStyle(fontSize: 20,color: Colors.white),
                                    ),
                                  )));
                        },
                        separatorBuilder: (_, __) => Divider(),
                        itemCount: data.length),
                  );
                }
                return Center(child: CircularProgressIndicator());
              }),
        ],
      ),
    );
  }
}
