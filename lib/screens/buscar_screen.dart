import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    allBusRoutes = [
      BusRoute(
        numero: 3301,
        destino: 'Centro',
        via: 'Av. Principal',
        cor: 'amarelo',
        ocupacao: 10,
        localizacao: 'Rua A, nº 123',
        tempo: '5 min',
      ),
      BusRoute(
        numero: 4402,
        destino: 'Universidade',
        via: 'Av. das Flores',
        cor: 'laranja',
        ocupacao: 25,
        localizacao: 'Av. B, nº 200',
        tempo: '12 min',
      ),
      BusRoute(
        numero: 1103,
        destino: 'Estação Norte',
        via: 'Rua A',
        cor: 'roxo',
        ocupacao: 5,
        localizacao: 'Estação do Norte',
        tempo: '8 min',
      ),
      BusRoute(
        numero: 2210,
        destino: 'Shopping Sul',
        via: 'Av. Central',
        cor: 'verde',
        ocupacao: 15,
        localizacao: 'Av. Central, nº 500',
        tempo: '9 min',
      ),
      BusRoute(
        numero: 5507,
        destino: 'Bairro Novo',
        via: 'Rua das Laranjeiras',
        cor: 'azul',
        ocupacao: 30,
        localizacao: 'Rua Laranjeiras, nº 70',
        tempo: '14 min',
      ),
      BusRoute(
        numero: 6633,
        destino: 'Rodoviária',
        via: 'Av. Brasil',
        cor: 'vermelho',
        ocupacao: 8,
        localizacao: 'Av. Brasil, nº 901',
        tempo: '4 min',
      ),
      BusRoute(
        numero: 7788,
        destino: 'Hospital Central',
        via: 'Rua da Saúde',
        cor: 'rosa',
        ocupacao: 20,
        localizacao: 'Rua da Saúde, nº 330',
        tempo: '10 min',
      ),
      BusRoute(
        numero: 8811,
        destino: 'Praça da Liberdade',
        via: 'Av. das Palmeiras',
        cor: 'azul claro',
        ocupacao: 12,
        localizacao: 'Praça da Liberdade',
        tempo: '6 min',
      ),
      BusRoute(
        numero: 9902,
        destino: 'Parque Municipal',
        via: 'Rua Verde',
        cor: 'verde claro',
        ocupacao: 22,
        localizacao: 'Parque Municipal, portão 1',
        tempo: '11 min',
      ),
      BusRoute(
        numero: 1044,
        destino: 'Bairro Industrial',
        via: 'Av. Ferrovia',
        cor: 'cinza',
        ocupacao: 6,
        localizacao: 'Av. Ferrovia, nº 42',
        tempo: '7 min',
      ),
      BusRoute(
        numero: 1166,
        destino: 'Zona Oeste',
        via: 'Rua do Comércio',
        cor: 'preto',
        ocupacao: 18,
        localizacao: 'Rua do Comércio, nº 88',
        tempo: '13 min',
      ),
    ];

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
        child: Column(
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
                    return BusGridCard(route: route);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
