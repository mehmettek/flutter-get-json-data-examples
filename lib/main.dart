import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(home: new MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

const url = "https://jsonplaceholder.typicode.com/posts/1";

class _MyHomePageState extends State<MyHomePage> {
  List liste = List();
  Future getPosts() async {
    var url1 = url;
    final response = await http.get(url1);
    if (response.statusCode == 200) {
      setState(() {
        liste.add(json.decode(response.body));
      });
    } else
      throw Exception("Error ${response.statusCode}");
  }

  @override
  void initState() {
    super.initState();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Json Data"),
      ),
      body: listviewolustur(liste),
    );
  }

  Widget listviewolustur(List data) {
    debugPrint(data.toString());
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, i) {
          return new Column(
             children: <Widget>[
               Card(
              child: new Text(data[i]["userId"].toString()),
               ),
               Card(
              child: new Text(data[i]["id"].toString()),
               ),
               Card(
              child: new Text(data[i]["title"].toString()),
               ),
               Card(
              child: new Text(data[i]["body"].toString()),
               ),
          Divider(
            color: Colors.red.shade900,
            height: 20.0,

          ),
             ],
             

           );
        });
  }
}

