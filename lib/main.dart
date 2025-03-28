// main.dart
import 'package:flutter/material.dart';
import 'bmi.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.purple,
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: AppBarTheme(color: Colors.purple),
        ),
        home: InputBMI(),
      ),
    );