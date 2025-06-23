import 'package:flutter/material.dart';
import '../core/theme/colors.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({super.key});

  Color _getCorLinha(String corNome) {
    switch (corNome) {
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

  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context);
    final args = route != null && route.settings.arguments != null
    ? route.settings.arguments as Map<String, dynamic>
    : {
        'numero': 999,
        'destino': 'Indefinido',
        'via': '---',
        'cor': 'cinza',
        'ocupacao': 0,
      };

      final String numero = args['numero'].toString();
      final String destino = args['destino']?.toString() ?? '';
      final String via = args['via']?.toString() ?? '';
      final String cor = args['cor']?.toString() ?? 'cinza';
      final int ocupacao = int.tryParse(args['ocupacao'].toString()) ?? 0;


    return Scaffold(
      backgroundColor: AppColors.verdeAgua,
      body: SafeArea(
        child: Column(
          children: [
            // Card da linha de ônibus
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                                color: _getCorLinha(cor),
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
                    const Icon(Icons.group_outlined, color: Colors.orange),
                    const SizedBox(width: 4),
                    Text('$ocupacao'),
                  ],
                ),
              ),
            ),

            // Mapa simulado
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'assets/images/mapa_estatico.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Botão de encerrar viagem
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/main');
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                width: double.infinity,
                color: AppColors.azulNavegacao,
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.pause, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'Encerrar viagem',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
