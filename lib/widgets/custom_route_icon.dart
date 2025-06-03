import 'package:flutter/material.dart';
import '../core/theme/colors.dart';

class CustomRouteIcon extends StatelessWidget {
  final bool isSelected;

  const CustomRouteIcon({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppColors.azulNavegacao : Colors.grey;

    return SizedBox(
      width: 36,
      height: 20,
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
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    const radius = 4.0;
    final spacing = (size.width - (3 * radius * 2)) / 2;

    final circle1 = Offset(radius, size.height / 2);
    final circle2 = Offset(radius * 3 + spacing, size.height / 2);
    final circle3 = Offset(radius * 5 + spacing * 2, size.height / 2);

    // Desenha a linha entre os círculos
    canvas.drawLine(circle1, circle2, paint);
    canvas.drawLine(circle2, circle3, paint);

    // Desenha os círculos
    canvas.drawCircle(circle1, radius, fillPaint);
    canvas.drawCircle(circle2, radius, fillPaint);
    canvas.drawCircle(circle3, radius, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
