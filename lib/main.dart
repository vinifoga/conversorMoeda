
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Uri request = Uri.parse("https://api.hgbrasil.com/finance?format=json-cors&key=07456b3b");

void main() async {

  http.Response response = await http.get(request);
  print(json.decode(response.body)["results"]["currencies"]["USD"]);

  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("\$ Conversor \$"),),
    );
  }
}
