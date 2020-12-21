import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:camerakit/CameraKitController.dart';
import 'package:camerakit/CameraKitView.dart';

class SACameraWidget extends StatelessWidget {
  CameraKitView cameraKitView;
  CameraKitController cameraKitController;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height - 250.0;

    cameraKitController = CameraKitController();
    cameraKitView = CameraKitView(
      hasBarcodeReader: true,
      onBarcodeRead: (barcode) {},
      previewFlashMode: CameraFlashMode.auto,
      cameraKitController: cameraKitController,
    );

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
