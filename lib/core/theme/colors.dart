import 'package:flutter/material.dart';

class AppColors {
  static const azulNavegacao = Color(0xFF0C3EC2);
  static const verdeAgua = Color(0xFFB0D0D3);
  static const lilasClaro = Color(0xFFECE7F9);
  static const roxo = Color(0xFF7A64BE);
  static const laranja = Color(0xFFEB6E38);
  static const amarelo = Color(0xFFF7C64D);
  static const fundoApp = Color(0xFFEDEDED);

  // Extras usados no protótipo atualizado
  static const cinzaCaixaNumero = Color(0xFFE3E3E3);
  static const fundoTabs = Color(0xFFFAF9F9);
  static const textoEndereco = Color(0xFF616161);
  static const textoMomento = Color(0xFF9C9C9C);

  /// Retorna uma cor com base no nome da cor (em minúsculas)
  static Color getColorFromName(String cor) {
    switch (cor.toLowerCase()) {
      case 'amarelo':
        return amarelo;
      case 'azul':
        return azulNavegacao;
      case 'roxo':
        return roxo;
      case 'laranja':
        return laranja;
      case 'verde':
        return verdeAgua;
      case 'lilas':
        return lilasClaro;
      default:
        return cinzaCaixaNumero;
    }
  }
}
