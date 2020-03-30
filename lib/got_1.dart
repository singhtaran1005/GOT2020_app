import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Color mainColor = Colors.amber;
Color secColor = Colors.black;

class Got1 extends StatefulWidget {
  @override
  _Got1State createState() => _Got1State();
}

class _Got1State extends State<Got1> {
  var data;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(
        "http://api.tvmaze.com/singlesearch/shows?q=game-of-thrones&embed=episodes");
    print(res.body);
    data = jsonDecode(res.body);
    setState(() { 
    });
  }

  dataBody(BuildContext context){
    var imgUrl = data["image"]["original"];
    var body = Column(
      children: <Widget>[
      Center(
        child: CircleAvatar(
          backgroundImage: NetworkImage("imgUrl"),
          radius: 70,
        ),
      ),
    ],
    );
    return body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        elevation: 0.0,
        title : Center(child: Text("GOT 2020")),
      ),
      body: data != null
      ? dataBody(context)
      :Center(
        child: CircularProgressIndicator(),
        ),
      );
  }
}
