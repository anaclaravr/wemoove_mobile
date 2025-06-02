import 'package:flutter/material.dart';
import '../core/theme/colors.dart';
import '../screens/home_screen.dart';
import '../screens/buscar_screen.dart';
import '../screens/route_screen.dart';
import '../screens/play_screen.dart';
import '../widgets/custom_route_icon.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    BuscarScreen(),
    RouteScreen(),
    PlayScreen(
    numero: '342',
    destino: 'Estação Barreiro / Solar',
    via: 'Via Estação Diamante',
    cor: 'laranja',
    ocupacao: 26,
  ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.azulNavegacao,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CustomRouteIcon(isSelected: _selectedIndex == 2),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: '',
          ),
        ],
      ),
    );
  }
}
