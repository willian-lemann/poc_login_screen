import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var products = [];

  @override
  void initState() {
    void getProducts() async {
      var response = await Dio()
          .get('https://600e2b9f3bb1d100179de755.mockapi.io/api/Products');

      setState(() {
        products = response.data;
      });
    }

    getProducts();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          var title = products[index]['name'];

          var description = products[index]['description'];

          return Container(
            alignment: Alignment.center,
            height: 100,
            color: Theme.of(context).primaryColor,
            margin: index == products.length - 1
                ? EdgeInsets.only(top: 10, bottom: 10)
                : EdgeInsets.only(top: 10, bottom: 20),
            child: ListTile(
              title: Text(title),
              subtitle: Text(description),
              trailing: Icon(Icons.favorite),
            ),
          );
        },
      ),
    );
  }
}
