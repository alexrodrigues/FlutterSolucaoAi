import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:solucao_ai/widget/s_a_camera_widget.dart';
import 'dart:io';

class SACameraScreen extends StatefulWidget {
  SACameraScreen({Key key}) : super(key: key);

  @override
  _SACameraScreenState createState() => _SACameraScreenState();
}

class _SACameraScreenState extends State<SACameraScreen> {
  bool _isLoading = false;
  final screenShotController = ScreenshotController();

  void _takePicture() {
    // setState(() {
    //   _isLoading = true;
    // });
    screenShotController.capture().then((file) {
      return _convertToBase64(file);
    }).then((value) {
      print(value);
    });
  }

  Future<String> _convertToBase64(File file) async {
    return base64Encode(file.readAsBytesSync());
  }

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
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Text(
                    "Vamos detectar se você está com mascara",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Theme.of(context).accentColor),
                  ),
                  SizedBox(height: 16.0),
                  Screenshot(
                    controller: screenShotController,
                    child: SACameraWidget(),
                  ),
                  SizedBox(height: 16.0),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).accentColor,
                    child: SizedBox(
                      height: 64.0,
                      width: 64.0,
                      child: IconButton(
                        iconSize: 32.0,
                        padding: EdgeInsets.all(0.0),
                        icon: Icon(
                          Icons.photo_camera,
                          color: Colors.white,
                          size: 32.0,
                        ),
                        onPressed: () {
                          _takePicture();
                        },
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
