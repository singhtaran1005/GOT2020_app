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

  showGridWidget(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        itemCount: data["_embedded"]["episodes"].length,
        gridDelegate: 
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 16.0,mainAxisSpacing: 16.0
                      ),   
        itemBuilder: (context,index) {
          var episode = data["_embedded"]["episodes"][index];
          return Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.network(
                    episode["image"]["original"],
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment : Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(episode["name"],
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text("S${episode["season"]}E${episode["number"]}"),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.only(bottomLeft: Radius.circular(16)),
                        ),   
                      ),
                    ),
                  )
                ],
              ),
              );
        },
      ),
    );
  }

  dataBody(BuildContext context){
    var imgUrl = data["image"]["original"];
    var body = Column(
      children: <Widget>[
      Center(
        child: CircleAvatar(
          backgroundImage: NetworkImage(imgUrl),
          radius: 70,
        ),
      ),
      SizedBox(height: 20,
      ),
      Text(data["name"]),
      SizedBox(height: 20,
      ),
      Expanded(
        child: showGridWidget(),
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
