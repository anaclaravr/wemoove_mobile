class BusRoute {
  final int numero;
  final String destino;
  final String localizacao;
  final String tempo;
  final String cor;
  final String via; // novo
  final int ocupacao; // novo
  final double latitude;
  final double longitude;


  BusRoute({
    required this.numero,
    required this.destino,
    required this.localizacao,
    required this.tempo,
    required this.cor,
    required this.via,
    required this.ocupacao,
    required this.latitude,
    required this.longitude,
  });

    factory BusRoute.fromJson(Map<String, dynamic> json) {
    return BusRoute(
      numero: int.parse(json['numero'].toString()),
      destino: json['destino'],
      localizacao: json['localizacao'],
      tempo: json['tempo'],
      cor: json['cor'],
      via: json['via'],
      ocupacao: json['ocupacao'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );
    
  }
   Map<String, dynamic> toJson() {
      return {
        'numero': numero,
        'destino': destino,
        'localizacao': localizacao,
        'tempo': tempo,
        'cor': cor,
        'via': via,
        'ocupacao': ocupacao,
        'latitude': latitude,
        'longitude': longitude,
      };
}

}
