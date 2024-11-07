// test/widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:examen_frontend/main.dart';

void main() {
  testWidgets('Initial app test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verifica que existe el AppBar con el título "Reservas"
    expect(find.text('Reservas'), findsOneWidget);
    
    // Verifica que existe el botón de "Guardar Reserva"
    expect(find.text('Guardar Reserva'), findsOneWidget);
  });
}