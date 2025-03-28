import 'package:flutter/material.dart';
import 'dart:math';

class BMIResult extends StatelessWidget {
  final int tinggi;
  final int berat;
  final String nama;
  final String jenisKelamin;
  final int umur;

  BMIResult({
    required this.tinggi,
    required this.berat,
    required this.nama,
    required this.jenisKelamin,
    required this.umur,
  });

  @override
  Widget build(BuildContext context) {
    double bmi = berat / pow(tinggi / 100, 2);
    String cBMI = bmi >= 28 ? 'Obese' : bmi >= 23 ? 'Overweight' : bmi >= 17.5 ? 'Normal' : 'Underweight';

    return Scaffold(
      appBar: AppBar(title: Text('RESULT')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$nama ($jenisKelamin, $umur tahun)', style: TextStyle(fontSize: 20, color: Colors.white)),
            Text(cBMI, style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500, color: Colors.green)),
            Text(bmi.toStringAsFixed(2), style: TextStyle(fontSize: 100, fontWeight: FontWeight.w800, color: Colors.white)),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('BACK'),
        ),
      ),
    );
  }
}
