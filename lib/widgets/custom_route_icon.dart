import 'package:flutter/material.dart';
import '../core/theme/colors.dart';

class CustomRouteIcon extends StatelessWidget {
  final bool isSelected;

  const CustomRouteIcon({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppColors.azulNavegacao : Colors.grey;

    return SizedBox(
      width: 28,
      height: 18,
      child: CustomPaint(
        painter: _RouteIconPainter(color),
      ),
    );
  }
}

class _RouteIconPainter extends CustomPainter {
  final Color color;

  _RouteIconPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    const radius = 4.0;
    const spacing = 14.0;

    for (int i = 0; i < 3; i++) {
      final dx = i * spacing;
      canvas.drawCircle(Offset(dx + radius, size.height / 2), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
