import 'package:flutter/material.dart';
import 'package:calculadora_imc/pages/imc_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: ImcPage(),
    );
  }
}
