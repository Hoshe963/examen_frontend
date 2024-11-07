import 'package:examen_frontend/src/domain/models/reserva_model.dart';

abstract class ReservasEvent {}

class CargarReservasEvent extends ReservasEvent {}
class CrearReservaEvent extends ReservasEvent {
  final Reserva reserva;
  CrearReservaEvent(this.reserva);
}
class ActualizarReservaEvent extends ReservasEvent {
  final Reserva reserva;
  ActualizarReservaEvent(this.reserva);
}
class EliminarReservaEvent extends ReservasEvent {
  final String id;
  EliminarReservaEvent(this.id);
}
