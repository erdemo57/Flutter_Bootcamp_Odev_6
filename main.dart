import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_odev_6/sahibinden_app/ui/views/arabalar_sayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFF1B1B1B)),
      home: const ArabalarSayfa(),
    );
  }
}
