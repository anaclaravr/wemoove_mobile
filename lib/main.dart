import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/buscar_screen.dart';
import 'screens/route_screen.dart';
import 'screens/main_screen.dart'; // a nova tela controlador

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
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/main': (context) => const MainScreen(), // navegação com BottomNav
        '/home': (context) => const HomeScreen(),
        '/buscar': (context) => const BuscarScreen(),
        '/route': (context) => const RouteScreen(),
      },
    );
  }
}
