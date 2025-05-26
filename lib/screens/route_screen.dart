import 'package:flutter/material.dart';
import '../core/theme/colors.dart';

class RouteScreen extends StatelessWidget {
  const RouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fundoApp,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // índice da aba rota
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          }
          // Aqui pode implementar os outros índices se quiser
        },
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
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.laranja.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: AppColors.laranja,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        '342',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Estação Barreiro / Solar',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Via Estação Diamante',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    const Icon(Icons.people_outline, color: Colors.orange),
                    const SizedBox(width: 4),
                    const Text('26')
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    color: Colors.grey[300],
                    width: double.infinity,
                    child: const Center(child: Text('Mapa simulado')),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Rua Vicente de Azevedo, 1191',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.access_time, size: 16),
                                  SizedBox(width: 4),
                                  Text('12 min'),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Text('Av. Afonso Vaz de Melo, 1098'),
                          const Text('Rua José Gonçalves, 587'),
                          const SizedBox(height: 24),
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.play_arrow, color: Colors.white),
                                  SizedBox(width: 8),
                                  Text(
                                    'Iniciar viagem em',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(Icons.access_time, size: 16, color: Colors.white),
                                  SizedBox(width: 4),
                                  Text(
                                    '12 min',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
