import 'package:flutter/material.dart';
import '../core/theme/colors.dart';
import '../models/bus_route.dart';
import '../widgets/bus_grid_card.dart';

class BuscarScreen extends StatefulWidget {
  const BuscarScreen({super.key});

  @override
  State<BuscarScreen> createState() => _BuscarScreenState();
}

class _BuscarScreenState extends State<BuscarScreen> {
  bool mostrarFavoritos = false;

  final List<BusRoute> mockData = [
    BusRoute(
      numero: 342,
      destino: 'Solar Via Estação Diamante',
      localizacao: '',
      tempo: '',
      cor: 'laranja',
    ),
    BusRoute(
      numero: 340,
      destino: 'Via Mangabeiras',
      localizacao: '',
      tempo: '',
      cor: 'amarelo',
    ),
    BusRoute(
      numero: 342,
      destino: 'Solar Via Estação Diamante',
      localizacao: '',
      tempo: '',
      cor: 'roxo',
    ),
    BusRoute(
      numero: 340,
      destino: 'Via Mangabeiras',
      localizacao: '',
      tempo: '',
      cor: 'amarelo',
    ),
    BusRoute(
      numero: 342,
      destino: 'Solar Via Estação Diamante',
      localizacao: '',
      tempo: '',
      cor: 'azul',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.verdeAgua,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Pesquise uma linha',
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.tune, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.fundoApp,
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
                            text: "Todos",
                            isSelected: !mostrarFavoritos,
                            onTap:
                                () => setState(() => mostrarFavoritos = false),
                          ),
                          _TabButton(
                            icon: Icons.star,
                            text: "Favoritos",
                            isSelected: mostrarFavoritos,
                            onTap:
                                () => setState(() => mostrarFavoritos = true),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                                childAspectRatio: 1.4,
                              ),
                          itemCount: mockData.length,
                          itemBuilder:
                              (context, index) =>
                                  BusGridCard(route: mockData[index]),
                        ),
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
