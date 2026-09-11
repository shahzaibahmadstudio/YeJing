import 'package:flutter/material.dart';

void main() {
  runApp(const YeJingApp());
}

class YeJingApp extends StatelessWidget {
  const YeJingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YeJing',
      debugShowCheckedModeBanner: false,
      home: const Scaffold(),
    );
  }
}
