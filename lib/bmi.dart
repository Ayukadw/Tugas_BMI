import 'package:flutter/material.dart';
// import 'dart:math';
import 'package:intl/intl.dart';
import 'bmi_result.dart';

class InputBMI extends StatefulWidget {
  @override
  _InputBMIState createState() => _InputBMIState();
}

class _InputBMIState extends State<InputBMI> {
  int tinggi = 0;
  int berat = 0;
  String nama = '';
  String jenisKelamin = 'Laki-laki';
  DateTime? tanggalLahir;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MENGHITUNG BMI'),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              onChanged: (txt) => setState(() => nama = txt),
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            DropdownButtonFormField<String>(
              value: jenisKelamin,
              items: ['Laki-laki', 'Perempuan']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => jenisKelamin = val!),
              decoration: InputDecoration(labelText: 'Jenis Kelamin'),
            ),
            TextField(
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (picked != null) {
                  setState(() => tanggalLahir = picked);
                }
              },
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Tanggal Lahir',
                hintText: tanggalLahir != null
                    ? DateFormat('dd/MM/yyyy').format(tanggalLahir!)
                    : 'Pilih Tanggal',
              ),
            ),
            TextField(
              onChanged: (txt) => setState(() => tinggi = int.parse(txt)),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Tinggi (cm)')
            ),
            TextField(
              onChanged: (txt) => setState(() => berat = int.parse(txt)),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Berat (kg)')
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (nama.isNotEmpty && tanggalLahir != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BMIResult(
                        tinggi: tinggi,
                        berat: berat,
                        nama: nama,
                        jenisKelamin: jenisKelamin,
                        umur: DateTime.now().year - tanggalLahir!.year,
                      ),
                    ),
                  );
                }
              },
              child: Text('HITUNG BMI'),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/profile.jpg'), // Ganti dengan foto Anda
            ),
            SizedBox(height: 10),
            Text('Ni Putu Ayu Kusuma Dewi', style: TextStyle(fontSize: 20, color: Colors.white)),
            Text('S1 Sistem Informasi - Undiksha', style: TextStyle(fontSize: 16, color: Colors.white60)),
          ],
        ),
      ),
    );
  }
}
