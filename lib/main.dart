import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const YeJingApp());
}

class YeJingApp extends StatefulWidget {
  const YeJingApp({super.key});

  @override
  State<YeJingApp> createState() => _YeJingAppState();
}

class _YeJingAppState extends State<YeJingApp> {

  @override
  void initState() {
    super.initState();
    splashInitialization();
  }

  void splashInitialization() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YeJing',
      debugShowCheckedModeBanner: false,
      home: const Scaffold(),
    );
  }
}
