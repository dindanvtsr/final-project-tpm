import 'package:flutter/material.dart';
import 'package:finalproject_tpm/list_news.dart';
import 'package:finalproject_tpm/time_converter.dart';
import 'package:finalproject_tpm/money_converter.dart';

class IsiLandingPage extends StatelessWidget {
  const IsiLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 5),
            SizedBox(
              width: 200,
              height: 100,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ListNews()),
                  );
                },
                icon: Tooltip(
                  message: 'Spaceflight News',
                  child: Icon(
                    Icons.flight_takeoff_rounded,
                    size: 35,
                  ),
                ),
                label: Text(''),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 200,
              height: 100,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MoneyConverter()),
                  );
                },
                icon: Tooltip(
                  message: 'Money Converter',
                  child: Icon(
                    Icons.monetization_on_rounded,
                    size: 35,
                  ),
                ),
                label: Text(''),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 200,
              height: 100,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TimeConverter()),
                  );
                },
                icon: Tooltip(
                  message: 'Time Converter',
                  child: Icon(
                    Icons.timelapse_rounded,
                    size: 35,
                  ),
                ),
                label: Text(''),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
