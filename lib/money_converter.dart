import 'package:flutter/material.dart';

class MoneyConverter extends StatefulWidget {
  const MoneyConverter({Key? key}) : super(key: key);

  @override
  _MoneyConverterState createState() => _MoneyConverterState();
}

class _MoneyConverterState extends State<MoneyConverter> {
  double _amount = 0.0;
  String _selectedCurrency = 'Won';

  static const double _rupiahToWonRate = 0.089;
  static const double _rupiahToDollarRate = 0.000067;
  static const double _rupiahToRupeeRate = 0.0056;

  void _convertCurrency() {
    double convertedAmount = 0.0;

    if (_selectedCurrency == 'Won') {
      convertedAmount = _amount * _rupiahToWonRate;
    } else if (_selectedCurrency == 'Dollar') {
      convertedAmount = _amount * _rupiahToDollarRate;
    } else if (_selectedCurrency == 'Rupee') {
      convertedAmount = _amount * _rupiahToRupeeRate;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Converted Amount'),
          content: Text('$convertedAmount $_selectedCurrency'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Money Converter'),
      ),
      body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter Amount in Rupiah:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Container(
              width: 200,
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _amount = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Select Currency:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: _selectedCurrency,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCurrency = newValue!;
                });
              },
              items: <String>['Won', 'Dollar', 'Rupee']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertCurrency,
              child: Text('Convert'),
            ),
          ],
        ),
      ),
    );
  }
}
