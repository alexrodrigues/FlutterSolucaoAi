import 'package:flutter/material.dart';
import 'screens/s_a_camera_screen.dart';
import 'package:color_to_material/color_to_material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solução AI',
      theme: ThemeData(
        primarySwatch: ColorToMaterial(Colors.green).getMaterialColor(),
        accentColor: ColorToMaterial(Colors.greenAccent).getMaterialColor(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      routes: {
        "/": (ctx) => SACameraScreen(),
      },
    );
  }
}
