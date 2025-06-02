import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/buscar_screen.dart';
import 'screens/route_screen.dart';
import 'screens/main_screen.dart'; // a nova tela controlador
import 'screens/cadastro_screen.dart'; // a nova tela de cadastro

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
    theme: ThemeData(fontFamily: 'Inter', useMaterial3: true),
    initialRoute: '/', // Começa pela tela de login
    routes: {
      '/': (context) => const LoginScreen(),
      '/cadastro': (context) => const CadastroScreen(),
      '/main': (context) => const MainScreen(), // com BottomNavigationBar
      '/home': (context) => const HomeScreen(),
      '/buscar': (context) => const BuscarScreen(),
      '/route': (context) => const RouteScreen(),
    },
  );
}
}
