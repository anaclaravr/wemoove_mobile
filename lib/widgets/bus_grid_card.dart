import 'package:flutter/material.dart';
import '../models/bus_route.dart';
import '../core/theme/colors.dart';

class BusGridCard extends StatelessWidget {
  final BusRoute route;

  const BusGridCard({super.key, required this.route});

  Color getLineColor() {
    switch (route.cor) {
      case 'laranja':
        return AppColors.laranja;
      case 'amarelo':
        return AppColors.amarelo;
      case 'roxo':
        return AppColors.roxo;
      case 'azul':
        return AppColors.azulNavegacao;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/route',
          arguments: route.toJson(),

        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Número do ônibus com linha lateral
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3E3E3),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 4,
                        height: 32,
                        decoration: BoxDecoration(
                          color: getLineColor(),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6),
                            bottomLeft: Radius.circular(6),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          route.numero.toString(),
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const Icon(Icons.star, color: AppColors.amarelo, size: 20),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              '${route.via} / ${route.destino}',
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
