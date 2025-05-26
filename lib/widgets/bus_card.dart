import 'package:flutter/material.dart';
import '../models/bus_route.dart';
import '../core/theme/colors.dart';
import '../core/theme/fonts.dart';

class BusCard extends StatelessWidget {
  final BusRoute route;

  const BusCard({Key? key, required this.route}) : super(key: key);

  Color getLineColor() {
    switch (route.cor) {
      case 'laranja':
        return AppColors.laranja;
      case 'amarelo':
        return AppColors.amarelo;
      case 'roxo':
        return AppColors.roxo;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Container(width: 4, height: 60, color: getLineColor()),
        title: Text(
          'Estação Barreiro / ${route.destino}',
          style: AppTextStyles.title,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),
            Text(
              'NESSE MOMENTO:',
              style: AppTextStyles.subtitle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(route.localizacao, style: AppTextStyles.subtitle),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.access_time, size: 16),
            const SizedBox(width: 4),
            Text(route.tempo),
          ],
        ),
      ),
    );
  }
}
