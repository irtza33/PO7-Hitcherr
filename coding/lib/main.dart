import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:coding/Views/View.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
