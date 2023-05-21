import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:crypto/crypto.dart';
import 'package:finalproject_tpm/landing_page.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({Key? key}) : super(key: key);

  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    final loginregisterBox = Hive.box('loginregisterBox');
    final hashedPassword = sha256.convert(utf8.encode(password)).toString();

    if (loginregisterBox.containsKey(username)) {
      final storedPassword = loginregisterBox.get(username);
      if (hashedPassword == storedPassword) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LandingPage()),
        );
      } else {
        _showSnackbar('Enter Password Correctly');
      }
    } else {
      _showSnackbar('Username Not Found');
    }
  }

  Future<void> _register() async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    final loginregisterBox = Hive.box('loginregisterBox');
    final hashedPassword = sha256.convert(utf8.encode(password)).toString();

    if (loginregisterBox.containsKey(username)) {
      _showSnackbar('Username Has Been Used');
    } else {
      loginregisterBox.put(username, hashedPassword);
      _showSnackbar('You Have Successfully Registered');
    }
  }

  void _showSnackbar(String message) {
    _scaffoldKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFFEFEBE9),
              const Color(0xFFD7CCC8),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "Hello!",
                    style: TextStyle(fontSize: 60, color: Colors.brown),
                  ),
                  Text(
                    "Are you ready to explore the app?",
                    style: TextStyle(fontSize: 18, color: Colors.brown),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20), // Tambahkan jarak kiri dan kanan
                    child: TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20), // Tambahkan jarak kiri dan kanan
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 160,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: _login,
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.brown,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 160,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: _register,
                          child: const Text(
                            'Register',
                            style: TextStyle(fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.brown,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
