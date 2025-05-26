import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const WeMooveApp());
}

class WeMooveApp extends StatelessWidget {
  const WeMooveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WeMoove',
      theme: ThemeData(fontFamily: 'Inter', useMaterial3: true),
      home: HomeScreen(),
    );
  }
}
