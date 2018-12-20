import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override Widget build(BuildContext context)
  {
    return MaterialApp(
        title: 'My First App',
        home: HomePage());
  }
}

