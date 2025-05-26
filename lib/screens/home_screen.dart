import 'package:flutter/material.dart';
import '../core/theme/colors.dart';
import '../models/bus_route.dart';
import '../widgets/bus_card.dart';

class HomeScreen extends StatelessWidget {
  final List<BusRoute> mockData = [
    BusRoute(
      numero: 342,
      destino: 'Solar Via Estação Diamante',
      localizacao: 'Av. Afonso Vaz de Melo, 1191',
      tempo: '10 min',
      cor: 'laranja',
    ),
    BusRoute(
      numero: 340,
      destino: 'Via Mangueiras',
      localizacao: 'Rua Vicente de Azevedo, 1542',
      tempo: '13 min',
      cor: 'amarelo',
    ),
    BusRoute(
      numero: 342,
      destino: 'Solar Via Estação Diamante',
      localizacao: 'Av. Renato Azeredo, 254',
      tempo: '15 min',
      cor: 'laranja',
    ),
    BusRoute(
      numero: 347,
      destino: 'ViaShopping',
      localizacao: 'Rua Teste, 1234',
      tempo: '15 min',
      cor: 'roxo',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fundoApp,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.azulNavegacao,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.alt_route), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label: ''),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Center(
              child: Image.asset(
                'lib/assets/images/wemoove_logo.png',
                height: 40,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Sua localização atual',
                  prefixIcon: const Icon(Icons.location_on),
                  suffixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.lilasClaro,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Ao redor',
                    style: TextStyle(
                      color: AppColors.roxo,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Recente',
                    style: TextStyle(fontFamily: 'Inter'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: mockData.length,
                itemBuilder:
                    (context, index) => BusCard(route: mockData[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
