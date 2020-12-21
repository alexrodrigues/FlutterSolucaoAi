import 'package:flutter/material.dart';
import 'dart:async';
import 'package:camerakit/CameraKitController.dart';
import 'package:camerakit/CameraKitView.dart';
import 'package:alert/alert.dart';

class SACameraWidget extends StatefulWidget {
  SACameraWidget({Key key}) : super(key: key);

  final _widgetState = _SACameraWidgetState();

  @override
  _SACameraWidgetState createState() => _widgetState;

  void takePicture() {
    _widgetState.takePicture();
  }
}

class _SACameraWidgetState extends State<SACameraWidget> {
  String _platformVersion = 'Unknown';
  CameraKitView cameraKitView;
  CameraFlashMode _flashMode = CameraFlashMode.on;
  CameraKitController cameraKitController;

  @override
  void initState() {
    super.initState();
    cameraKitController = CameraKitController();
    cameraKitView = CameraKitView(
      hasBarcodeReader: true,
      onBarcodeRead: (barcode) {},
      previewFlashMode: CameraFlashMode.auto,
      cameraKitController: cameraKitController,
    );
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    if (!mounted) return;
    setState(() {
      _platformVersion = platformVersion;
    });
  }

  void takePicture() {
    if (cameraKitController != null) {
      cameraKitController.takePicture().then((value) {
        Alert(message: "caminho: $value").show();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height - 250.0;

    return Container(
      width: double.maxFinite,
      height: height,
      child: CameraKitView(
        hasBarcodeReader: false,
        barcodeFormat: BarcodeFormats.FORMAT_ALL_FORMATS,
        scaleType: ScaleTypeMode.fit,
        onBarcodeRead: (barcode) {
          print("Flutter read barcode: " + barcode);
        },
        previewFlashMode: CameraFlashMode.on,
        cameraKitController: cameraKitController,
        androidCameraMode: AndroidCameraMode.API_X,
        cameraSelector: CameraSelector.front,
      ),
    );
  }
}
