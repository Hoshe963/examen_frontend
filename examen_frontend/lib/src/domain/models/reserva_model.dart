class Reserva {
  final String id;
  final String nombreCliente;
  final String habitacion;
  final DateTime fechaEntrada;
  final DateTime fechaSalida;
  final double costo;
  final String estado;

  Reserva({
    required this.id,
    required this.nombreCliente,
    required this.habitacion,
    required this.fechaEntrada,
    required this.fechaSalida,
    required this.costo,
    required this.estado,
  });

  // Métodos de serialización para convertir JSON a objeto y viceversa
  factory Reserva.fromJson(Map<String, dynamic> json) {
    return Reserva(
      id: json['id'],
      nombreCliente: json['nombreCliente'],
      habitacion: json['habitacion'],
      fechaEntrada: DateTime.parse(json['fechaEntrada']),
      fechaSalida: DateTime.parse(json['fechaSalida']),
      costo: json['costo'].toDouble(),
      estado: json['estado'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombreCliente': nombreCliente,
      'habitacion': habitacion,
      'fechaEntrada': fechaEntrada.toIso8601String(),
      'fechaSalida': fechaSalida.toIso8601String(),
      'costo': costo,
      'estado': estado,
    };
  }
}
