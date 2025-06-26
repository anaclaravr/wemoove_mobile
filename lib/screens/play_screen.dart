import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/bus_route.dart';
import '../core/theme/colors.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  GoogleMapController? _mapController;

  late BusRoute route;

  final CameraPosition initialPosition = CameraPosition(
    target: LatLng(-19.9191, -43.9386), // Adapte com dados reais
    zoom: 15,
  );

  final Marker marker = Marker(
    markerId: MarkerId('bus'),
    position: LatLng(-19.9191, -43.9386), // Adapte com dados reais
    infoWindow: InfoWindow(
      title: 'Ônibus',
      snippet: 'Localização atual do ônibus',
    ),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    route = ModalRoute.of(context)!.settings.arguments as BusRoute;
  }

  // Dados mockados de paradas do ônibus
  final List<Map<String, String>> mockStops = [
    {'address': 'Rua Vicente de Azevedo, 1191', 'time': '12 min'},
    {'address': 'Av. Afonso Vaz de Melo, 1098', 'time': ''},
    {'address': 'Rua José Gonçalves, 587', 'time': ''},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) => _mapController = controller,
            initialCameraPosition: initialPosition,
            markers: {marker},
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: false,
          ),
          // Barra Superior
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.verdeAgua,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE3E3E3),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      route.numero.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(route.destino,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            )),
                        Text('Via ${route.via}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.people, size: 14, color: Colors.deepOrange),
                        const SizedBox(width: 4),
                        Text(route.ocupacao.toString()),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(blurRadius: 12, color: Colors.black12),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Paradas mockadas
                  ...mockStops.map((stop) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          children: [
                            const Icon(Icons.circle, size: 10, color: AppColors.roxo),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                stop['address']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            if (stop['time']!.isNotEmpty)
                              Row(
                                children: [
                                  const Icon(Icons.schedule, size: 14, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Text(stop['time']!, style: const TextStyle(fontSize: 12)),
                                ],
                              ),
                          ],
                        ),
                      )),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: const Size.fromHeight(48),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/home', // Retorno para a tela Home após o término da viagem
                      );
                    },
                    icon: const Icon(Icons.stop),
                    label: const Text('Encerrar viagem'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, 
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/buscar');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.route),
            label: 'Rota',
          ),
        ],
      ),
    );
  }
}
