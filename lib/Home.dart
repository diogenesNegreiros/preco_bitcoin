import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {



  String _compra = "0000,00";
  String _venda = "0000,00";

   _getBitCoin()async{

     print("iniciou!!!");
     String url = "https://blockchain.info/ticker";
     http.Response response = await http.get(url);
     Map<String ,dynamic> _retorno = jsonDecode(response.body);

     setState(() {
       _compra =  "R\$"+ _retorno["BRL"] ["buy"].toString();
       _venda = "R\$"+_retorno["BRL"] ["sell"].toString();
     });
     print(_compra);
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(40),
            child: Image.asset("imagens/bitcoin.png"),
            ),
            Padding(padding: EdgeInsets.only(top: 20),
              child: Text("compra"),
            ),
            Text(
              _compra,
              style: TextStyle(
                fontSize: 40,
                color: Colors.blueGrey

            )
            ),
            Padding(padding: EdgeInsets.only(top: 20),
              child: Text("venda"),
            ),
            Text(
                _venda,
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.blueGrey

              )
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: RaisedButton(
                padding: EdgeInsets.all(15),

                child: Text(
                    "calcular BitCoin",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                  )
                ),
                onPressed: _getBitCoin,
                color: Colors.amber[700]
              ),
            )
          ],
        ),
      )
    );
  }
}
