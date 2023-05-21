import 'package:flutter/material.dart';

class profilePage extends StatelessWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height / 1.5,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image(image: AssetImage('img/dinda.jpg'), width: 200,),
                  ),
                  const SizedBox(height: 20),
                  const Text('Nama  : Dinda Aisyah Novitasari', style: TextStyle(fontSize: 16, color: Colors.brown)),
                  const Text('NIM : 123200006', style: TextStyle(fontSize: 16, color: Colors.brown)),
                  const Text('Kelas : IF-D', style: TextStyle(fontSize: 16, color: Colors.brown)),
                  const SizedBox(height: 10),
                ]
              ),
            )
          ],
        )
      ),
    );
  }
}
