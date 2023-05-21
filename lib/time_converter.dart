import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeConverter extends StatefulWidget {
  const TimeConverter({Key? key}) : super(key: key);

  @override
  _TimeConverterState createState() => _TimeConverterState();
}

class _TimeConverterState extends State<TimeConverter> {
  String _currentTime = '';
  String _zone = 'WIB';

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _updateTime();
    Future.delayed(const Duration(seconds: 1), _startTimer);
  }

  void _updateTime() {
    var now = DateTime.now().toUtc();
    switch (_zone) {
      case 'WIB':
        now = now.add(Duration(hours: 7));
        break;
      case 'WITA':
        now = now.add(Duration(hours: 8));
        break;
      case 'WIT':
        now = now.add(Duration(hours: 9));
        break;
      case 'London':
        now = now.add(Duration(hours: 1));
        break;
      default:
        break;
    }
    var formatter = DateFormat('HH:mm:ss');
    setState(() {
      _currentTime = formatter.format(now);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Converter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              '$_currentTime',
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _zone = 'WIB';
                    });
                  },
                  child: Text('WIB'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 60),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins-SemiBold',
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _zone = 'WIT';
                    });
                  },
                  child: Text('WIT'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 60),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins-SemiBold',
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _zone = 'WITA';
                    });
                  },
                  child: Text('WITA'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 60),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins-SemiBold',
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _zone = 'London';
                    });
                  },
                  child: Text('London'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 60),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins-SemiBold',
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
