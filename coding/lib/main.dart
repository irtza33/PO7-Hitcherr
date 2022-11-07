import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:coding/Views/View.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drivers Application',
      theme: FlexThemeData.light(scheme: FlexScheme.green),
      // darkTheme: FlexThemeData.dark(
      //     scheme: FlexScheme.mallardGreen, darkIsTrueBlack: true),
      //themeMode: ThemeMode.dark,
      home: View(),
    );
  }
}
