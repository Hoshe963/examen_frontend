import 'package:examen_frontend/src/domain/models/reserva_model.dart';

abstract class ReservaRepository {
  Future<List<Reserva>> obtenerReservas();
  Future<void> crearReserva(Reserva reserva);
  Future<void> actualizarReserva(Reserva reserva);
  Future<void> eliminarReserva(String id);
}
