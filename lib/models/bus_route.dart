class BusRoute {
  final int numero;
  final String destino;
  final String localizacao;
  final String tempo;
  final String cor;
  final String via; // novo
  final int ocupacao; // novo

  BusRoute({
    required this.numero,
    required this.destino,
    required this.localizacao,
    required this.tempo,
    required this.cor,
    required this.via,
    required this.ocupacao,
  });
}
