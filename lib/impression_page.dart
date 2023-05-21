import 'package:flutter/material.dart';

class impressionPage extends StatelessWidget {
  const impressionPage({Key? key}) : super(key: key);

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
                  const SizedBox(height: 200),
                  const Text('Impression  : ', style: TextStyle(fontSize: 16)),
                  const Text('Sangat unik dalam memberikan tugas sehingga membuat mahasiswa mau mempelajari flutter lebih dalam', style: TextStyle(fontSize: 16), textAlign: TextAlign.center,),
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
