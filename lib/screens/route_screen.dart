import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/bus_route.dart';
import '../core/theme/colors.dart';

class RouteScreen extends StatefulWidget {
  const RouteScreen({super.key});

  @override
  State<RouteScreen> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  GoogleMapController? _mapController;

  final List<Map<String, String>> mockStops = [
    {'address': 'Rua Vicente de Azevedo, 1191', 'time': '12 min'},
    {'address': 'Av. Afonso Vaz de Melo, 1098', 'time': ''},
    {'address': 'Rua José Gonçalves, 587', 'time': ''},
  ];

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    late final BusRoute route;

    if (args is BusRoute) {
      route = args;
    } else if (args is Map<String, dynamic>) {
      route = BusRoute.fromJson(args);
    } else {
      throw Exception('Argumento inválido recebido na RouteScreen.');
    }

    final CameraPosition initialPosition = CameraPosition(
      target: LatLng(route.latitude, route.longitude),
      zoom: 15,
    );

    final Marker marker = Marker(
      markerId: MarkerId(route.numero.toString()),
      position: LatLng(route.latitude, route.longitude),
      infoWindow: InfoWindow(
        title: 'Ônibus ${route.numero}',
        snippet: route.localizacao,
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    );

    return Scaffold(
      body: Stack(
        children: [
          // Mapa
          GoogleMap(
            onMapCreated: (controller) => _mapController = controller,
            initialCameraPosition: initialPosition,
            markers: {marker},
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: false,
          ),

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
                    onPressed: () {},
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Iniciar viagem em 12 min'),
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
