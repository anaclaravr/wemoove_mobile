import 'package:flutter/material.dart';
import '../core/theme/colors.dart';
import '../models/bus_route.dart';
import '../widgets/bus_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isNearby = true;

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
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Center(
              child: Image.asset(
                'assets/images/wemoove_logo.png',
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
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.verdeAgua,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(6),
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAF9F9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          _TabButton(
                            icon: Icons.directions_bus,
                            text: "Ao redor",
                            isSelected: isNearby,
                            onTap: () => setState(() => isNearby = true),
                          ),
                          _TabButton(
                            icon: Icons.schedule,
                            text: "Recente",
                            isSelected: !isNearby,
                            onTap: () => setState(() => isNearby = false),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: mockData.length,
                        itemBuilder: (context, index) =>
                            BusCard(route: mockData[index]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabButton({
    required this.icon,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 42,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.lilasClaro : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: AppColors.roxo, size: 18),
              const SizedBox(width: 6),
              Text(
                text,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  color: AppColors.roxo,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
