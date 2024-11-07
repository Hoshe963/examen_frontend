import 'package:examen_frontend/src/domain/models/reserva_model.dart';

abstract class ReservasState {}

class ReservasInitial extends ReservasState {}

class ReservasLoading extends ReservasState {}

class ReservasLoaded extends ReservasState {
  final List<Reserva> reservas;
  ReservasLoaded(this.reservas);
}

class ReservasError extends ReservasState {
  final String message;
  ReservasError(this.message);
}
