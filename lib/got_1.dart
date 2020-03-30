import 'package:flutter/material.dart';

Color mainColor = Colors.amber;
Color secColor = Colors.black;

class Got1 extends StatefulWidget {
  @override
  _Got1State createState() => _Got1State();
}

class _Got1State extends State<Got1> {

@override
  void initState() {
    super.initState();
    fetchData();
  }
  fetchData()async{
    var res = await 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        elevation: 0.0,
        title : Center(child: Text("GOT 2020")),
      ),
    );
  }
}
