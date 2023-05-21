import 'package:flutter/material.dart';
import 'package:finalproject_tpm/isi_landingpage.dart';
import 'package:finalproject_tpm/profile_page.dart';
import 'package:finalproject_tpm/impression_page.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pageslist[myIndex],
      ),
      appBar: AppBar(
        title: const Text('Final Project TPM')
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        onTap: (index){
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wysiwyg_rounded),
            label: 'Impression',
          ),
        ]
      ),
    );
  }
}
