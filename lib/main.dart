import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Uri request =
    Uri.parse("https://api.hgbrasil.com/finance?format=json-cors&key=07456b3b");

void main() async {
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("\$ Conversor \$"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Column(
                  children: const [
                    Text(
                      "Carregando",
                      style: TextStyle(color: Colors.amber, fontSize: 25.0),
                      textAlign: TextAlign.center,
                    ),
                    CircularProgressIndicator(),
                  ],
                ),
              );
            case ConnectionState.waiting:
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              break;
            default:
              if(snapshot.hasError){
                return const Center(
                  child: Text("Erro ao carregar Dados :(",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 25.0),
                  textAlign: TextAlign.center,)
                  );
              } else {
                return Container(color : Colors.green);
              }
          }
          return Container(color : Colors.green);
        },
      ),
    );
  }
}

Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}
