import 'package:finalproject_tpm/login_register.dart';
import 'package:flutter/material.dart';
import 'package:finalproject_tpm/isi_landingpage.dart';
import 'package:finalproject_tpm/profile_page.dart';
import 'package:finalproject_tpm/impression_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int myIndex = 0;
  List<Widget> pageslist = [
    IsiLandingPage(),
    profilePage(),
    impressionPage(),
  ];

  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => LoginRegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pageslist[myIndex],
      ),
      appBar: AppBar(
        title: const Text('Final Project TPM'),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        selectedItemColor: Colors.brown,
          onTap: (index) {
            if (index == 3) {
              _logout();
            } else {
              setState(() {
                myIndex = index;
              });
            }
          },
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded, color: Colors.brown,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded, color: Colors.brown,),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wysiwyg_rounded, color: Colors.brown,),
            label: 'Impression',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout_rounded, color: Colors.brown,),
            label: 'Logout',
          ),
        ]
      ),
    );
  }
}
