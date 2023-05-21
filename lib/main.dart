import 'package:flutter/material.dart';
import 'package:finalproject_tpm/login_register.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('loginregisterBox');
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
      home: LoginRegisterPage(),
    );
  }
}
