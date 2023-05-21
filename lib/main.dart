import 'package:flutter/material.dart';
import 'package:finalproject_tpm/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Final Project TPM',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        fontFamily: 'Poppins-SemiBold',
      ),
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}
