import 'package:flutter/material.dart';
import '../core/theme/colors.dart';
import 'home_screen.dart';
import 'buscar_screen.dart';
import 'route_screen.dart';

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
    Placeholder(),
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
        selectedItemColor: AppColors.azulNavegacao,
        unselectedItemColor: Colors.grey,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          const BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(
            icon: RouteIcon(
              color: _selectedIndex == 2 ? AppColors.azulNavegacao : Colors.grey,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label: ''),
        ],
      ),
    );
  }
}

class RouteIcon extends StatelessWidget {
  final Color color;
  const RouteIcon({required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _circle(),
        _line(),
        _circle(),
        _line(),
        _circle(),
      ],
    );
  }

  Widget _circle() {
    return Container(
      width: 6,
      height: 6,
      margin: const EdgeInsets.symmetric(horizontal: 1.5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  Widget _line() {
    return Container(
      width: 10,
      height: 1.5,
      color: color,
    );
  }
}
