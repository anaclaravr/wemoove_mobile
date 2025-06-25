import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/colors.dart';
import '../../models/bus_route.dart';
import '../widgets/bus_grid_card.dart';

class BuscarScreen extends StatefulWidget {
  const BuscarScreen({super.key});

  @override
  State<BuscarScreen> createState() => _BuscarScreenState();
}

class _BuscarScreenState extends State<BuscarScreen> {
  List<BusRoute> allBusRoutes = [];
  List<BusRoute> filteredBusRoutes = [];

  final TextEditingController _searchController = TextEditingController();
  late Future<void> loadFuture;

  @override
  void initState() {
    super.initState();
    loadFuture = loadRoutesFromJson();
  }

  Future<void> loadRoutesFromJson() async {
    final String response = await rootBundle.loadString('assets/data/bus_data.json');
    final List<dynamic> data = jsonDecode(response);
    allBusRoutes = data.map((e) => BusRoute.fromJson(e)).toList();
    filteredBusRoutes = List.from(allBusRoutes);
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.verdeAgua,
      body: SafeArea(
        child: FutureBuilder(
          future: loadFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: _searchController,
                    onChanged: _filterRoutes,
                    decoration: InputDecoration(
                      hintText: 'Buscar linha ou destino',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: AppColors.fundoApp,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: GridView.builder(
                      itemCount: filteredBusRoutes.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 2.0,
                      ),
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final route = filteredBusRoutes[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/route',
                              arguments: route,
                            );
                          },
                          child: BusGridCard(route: route),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
