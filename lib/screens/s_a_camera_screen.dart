import 'package:flutter/material.dart';

class SACameraScreen extends StatefulWidget {
  final ROUTE_NAME = "ROUTE_NAME";
  SACameraScreen({Key key}) : super(key: key);

  @override
  _SACameraScreenState createState() => _SACameraScreenState();
}

class _SACameraScreenState extends State<SACameraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Solução AI"),
      ),
      body: Container(
        color: Colors.white,
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Column(
          children: [
            Text(
              "Vamos detectar se você está com mascara",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Theme.of(context).accentColor),
            ),
          ],
        ),
      ),
    );
  }
}
