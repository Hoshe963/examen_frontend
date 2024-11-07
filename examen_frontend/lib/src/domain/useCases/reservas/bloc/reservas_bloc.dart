import 'package:examen_frontend/src/domain/useCases/reservas/bloc/reservas_event.dart';
import 'package:examen_frontend/src/domain/useCases/reservas/bloc/reservas_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:examen_frontend/src/domain/models/reserva_model.dart';
import 'package:examen_frontend/src/domain/useCases/reservas/obtener_reservas_use_case.dart';

class ReservasBloc extends Bloc<ReservasEvent, ReservasState> {
  final ObtenerReservasUseCase obtenerReservas;

  ReservasBloc({required this.obtenerReservas}) : super(ReservasInitial()) {
    on<CargarReservasEvent>((event, emit) async {
      emit(ReservasLoading());
      try {
        final reservas = await obtenerReservas.call();
        emit(ReservasLoaded(reservas));
      } catch (error) {
        emit(ReservasError("Error al cargar reservas"));
      }
    });
    // Otros eventos como CrearReservaEvent, ActualizarReservaEvent y EliminarReservaEvent
  }
}
