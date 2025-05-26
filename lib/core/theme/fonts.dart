import 'package:flutter/material.dart';

class AppTextStyles {
  static const defaultFont = 'Inter';

  static const title = TextStyle(
    fontFamily: defaultFont,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const subtitle = TextStyle(
    fontFamily: defaultFont,
    fontSize: 12,
    color: Colors.grey,
  );
}
