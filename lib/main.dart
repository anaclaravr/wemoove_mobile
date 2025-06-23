import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'screens/login_screen.dart';
import 'screens/cadastro_screen.dart';
import 'screens/main_screen.dart';
import 'screens/home_screen.dart';
import 'screens/buscar_screen.dart';
import 'screens/route_screen.dart';
import 'screens/play_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const WeMooveApp());
}

class WeMooveApp extends StatelessWidget {
  const WeMooveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WeMoove',
      theme: ThemeData(
        fontFamily: 'Inter',
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/cadastro': (context) => const CadastroScreen(),
        '/main': (context) => const MainScreen(),
        '/home': (context) => const HomeScreen(),
        '/buscar': (context) => const BuscarScreen(),
        '/route': (context) => const RouteScreen(), 
        '/play': (context) => const PlayScreen(),

      },
      onGenerateRoute: (settings) {
        if (settings.name == '/play') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
          builder: (context) => const PlayScreen(),
         );
        }
        return null;
      },
    );
  }
}
