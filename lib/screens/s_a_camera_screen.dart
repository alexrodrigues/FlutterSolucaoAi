import 'package:flutter/material.dart';
import 'package:solucao_ai/widget/s_a_camera_widget.dart';

class SACameraScreen extends StatefulWidget {
  SACameraScreen({Key key}) : super(key: key);

  @override
  _SACameraScreenState createState() => _SACameraScreenState();
}

class _SACameraScreenState extends State<SACameraScreen> {
  @override
  Widget build(BuildContext context) {
    final cameraView = SACameraWidget();

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
            SizedBox(height: 16.0),
            cameraView,
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
                    cameraView.takePicture();
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
