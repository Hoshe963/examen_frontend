import 'package:examen_frontend/src/domain/models/reserva_model.dart';
import 'package:examen_frontend/src/domain/repository/reserva_repository.dart';

class ObtenerReservasUseCase {
  final ReservaRepository repository;

  ObtenerReservasUseCase(this.repository);

  Future<List<Reserva>> call() async {
    return await repository.obtenerReservas();
  }
}