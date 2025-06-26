import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  late Future<List<BusRoute>> futureBusRoutes;
  List<BusRoute> allBusRoutes = [];
  List<BusRoute> filteredBusRoutes = [];
  List<BusRoute> recentRoutes = []; // Lista para armazenar os ônibus recentes

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureBusRoutes = loadBusRoutes();
  }

  Future<List<BusRoute>> loadBusRoutes() async {
    final String response = await rootBundle.loadString('assets/data/bus_data.json');
    final List<dynamic> data = jsonDecode(response);
    allBusRoutes = data.map((e) => BusRoute.fromJson(e)).toList();
    filteredBusRoutes = List.from(allBusRoutes); // Inicializa a lista de resultados com todos os ônibus
    return filteredBusRoutes;
  }

  // Função para filtrar os ônibus com base na pesquisa
  void _filterRoutes(String query) {
    setState(() {
      filteredBusRoutes = allBusRoutes.where((route) {
        final numero = route.numero.toString().toLowerCase();
        final destino = route.destino.toLowerCase();
        final search = query.toLowerCase();
        return numero.contains(search) || destino.contains(search);
      }).toList();
    });
  }

  // Função que adiciona o ônibus à lista de recentes
  void _addToRecent(BusRoute route) {
    if (!recentRoutes.contains(route)) {
      if (recentRoutes.length >= 2) {
        recentRoutes.removeAt(0); // Remove o primeiro da lista (mais antigo)
      }
      recentRoutes.add(route); // Adiciona o ônibus mais recente
    }
  }

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
                controller: _searchController,
                onChanged: _filterRoutes, // Chama o filtro sempre que o texto mudar
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
                            onTap: () {
                              setState(() {
                                isNearby = true;
                                filteredBusRoutes = List.from(allBusRoutes); // Mostra todos os ônibus
                              });
                            },
                          ),
                          _TabButton(
                            icon: Icons.schedule,
                            text: "Recente",
                            isSelected: !isNearby,
                            onTap: () {
                              setState(() {
                                isNearby = false;
                                filteredBusRoutes = List.from(recentRoutes); // Mostra apenas os ônibus recentes
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: FutureBuilder<List<BusRoute>>(
                        future: futureBusRoutes,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return const Center(child: Text('Erro ao carregar os dados'));
                          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return const Center(child: Text('Nenhuma linha disponível'));
                          }

                          final routes = filteredBusRoutes; // Usar a lista filtrada
                          return ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            itemCount: routes.length,
                            itemBuilder: (context, index) {
                              final route = routes[index];
                              return GestureDetector(
                                onTap: () {
                                  _addToRecent(route); // Adiciona ao histórico de recentes
                                  Navigator.pushNamed(
                                    context,
                                    '/route',
                                    arguments: route.toJson(),
                                  );
                                },
                                child: BusCard(route: route),
                              );
                            },
                          );
                        },
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
