import 'package:flutter/material.dart';
import '../core/theme/colors.dart';

class RouteScreen extends StatelessWidget {
  const RouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String numero = args['numero'] ?? '';
    final String destino = args['destino'] ?? '';
    final String via = args['via'] ?? '';
    final String cor = args['cor'] ?? 'cinza';
    final int ocupacao = args['ocupacao'] ?? 0;

    Color getLineColor(String cor) {
      switch (cor) {
        case 'amarelo':
          return AppColors.amarelo;
        case 'laranja':
          return AppColors.laranja;
        case 'roxo':
          return AppColors.roxo;
        default:
          return Colors.grey;
      }
    }

    return Scaffold(
      backgroundColor: AppColors.fundoApp,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppColors.verdeAgua,
              padding: const EdgeInsets.only(top: 12, bottom: 16),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFAF9F9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 52,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE3E3E3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              bottom: 0,
                              child: Container(
                                width: 6,
                                decoration: BoxDecoration(
                                  color: getLineColor(cor),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                numero,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              destino,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              via,
                              style: const TextStyle(fontSize: 12, color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      const Icon(Icons.people_outline, color: Colors.orange),
                      const SizedBox(width: 4),
                      Text(ocupacao.toString())
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/mapa_estatico.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/play',
                                arguments: {
                                  'numero': numero,
                                  'destino': destino,
                                  'via': via,
                                  'cor': cor,
                                  'ocupacao': ocupacao,
                                },
                              );
                            },
                            child: Container(
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
                                    Text('12 min', style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                            ),
                          ),
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
