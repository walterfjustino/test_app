import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(Estoque());
}

class Estoque extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class User {
    int filial_Id;
    String produto_id;
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var resultDecoded;

  List<String> teste = new List<String>();
  // teste.add('fjjf');

  Future<dynamic> getApiData() {
    String url = 'http://localhost:8087/produtos';

    var result = http.get(Uri.encodeFull(Url);
    
    return result;
    }
    
  }

  void getJosonData() async {
    var response = await getProdutos();
    print(response.body);
    resultDecoded = json.decode(response.body);

    var produto_Id = resultDecoded['Produto_Id'];
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: ListView(
        children: [
          for (int i = 0; i < resultDecoded.length; i++)
            Container(
              color: Colors.red,
              child: Column(
                children: [
                  Text(
                    resultDecoded[i]['TB_Produto_Filial'],
                    style: TextStyle(fontSize: 12),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        resultDecoded['Produto_Id'],
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        resultDecoded['Fiiial_Id'],
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
        ],
      )),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

