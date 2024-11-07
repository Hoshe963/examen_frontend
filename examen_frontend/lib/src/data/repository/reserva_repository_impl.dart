import 'package:examen_frontend/src/domain/models/reserva_model.dart';
import 'package:examen_frontend/src/domain/repository/reserva_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReservaRepositoryImpl implements ReservaRepository {
  final String baseUrl;

  ReservaRepositoryImpl(this.baseUrl);

  @override
  Future<List<Reserva>> obtenerReservas() async {
    final response = await http.get(Uri.parse('$baseUrl/reservas'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((reserva) => Reserva.fromJson(reserva)).toList();
    } else {
      throw Exception("Error al obtener reservas");
    }
  }

  @override
  Future<void> crearReserva(Reserva reserva) async {
    final response = await http.post(
      Uri.parse('$baseUrl/reservas'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(reserva.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception("Error al crear la reserva");
    }
  }

  @override
  Future<void> actualizarReserva(Reserva reserva) async {
    final response = await http.put(
      Uri.parse('$baseUrl/reservas/${reserva.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(reserva.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception("Error al actualizar la reserva");
    }
  }

  @override
  Future<void> eliminarReserva(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/reservas/$id'));
    if (response.statusCode != 200) {
      throw Exception("Error al eliminar la reserva");
    }
  }
}
