import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'buscar_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const BuscarScreen(),
    // Pode adicionar outras telas aqui futuramente
    Center(child: Text('Tela 3 (placeholder)')),
    Center(child: Text('Tela 4 (placeholder)')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF0C3EC2), // azul navegação
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.alt_route), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label: ''),
        ],
      ),
    );
  }
}
