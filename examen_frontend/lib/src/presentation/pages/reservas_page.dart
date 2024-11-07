import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReservasPage extends StatefulWidget {
  @override
  _ReservasPageState createState() => _ReservasPageState();
}

class _ReservasPageState extends State<ReservasPage> {
  final _formKey = GlobalKey<FormState>();

  String? _nombreCliente;
  String? _habitacion;
  DateTime? _fechaEntrada;
  DateTime? _fechaSalida;
  double? _costo;
  String? _estado;

  final List<String> habitaciones = ['101', '102', '103', '104'];
  final List<String> estados = ['Reservado', 'Cancelado', 'Completado'];

  Future<void> _selectDate(BuildContext context, bool isEntrada) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != (isEntrada ? _fechaEntrada : _fechaSalida))
      setState(() {
        if (isEntrada) {
          _fechaEntrada = picked;
        } else {
          _fechaSalida = picked;
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservas'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre del Cliente'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre del cliente';
                  }
                  return null;
                },
                onSaved: (value) {
                  _nombreCliente = value;
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Habitación'),
                value: _habitacion,
                items: habitaciones.map((String habitacion) {
                  return DropdownMenuItem<String>(
                    value: habitacion,
                    child: Text(habitacion),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _habitacion = value;
                  });
                },
              ),
              SizedBox(height: 16),
              ListTile(
                title: Text('Fecha de Entrada'),
                subtitle: Text(_fechaEntrada == null
                    ? 'Seleccionar fecha'
                    : DateFormat.yMd().format(_fechaEntrada!)),
                trailing: Icon(Icons.calendar_today),
                onTap: () => _selectDate(context, true),
              ),
              ListTile(
                title: Text('Fecha de Salida'),
                subtitle: Text(_fechaSalida == null
                    ? 'Seleccionar fecha'
                    : DateFormat.yMd().format(_fechaSalida!)),
                trailing: Icon(Icons.calendar_today),
                onTap: () => _selectDate(context, false),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Costo'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el costo';
                  }
                  return null;
                },
                onSaved: (value) {
                  _costo = double.tryParse(value!);
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Estado'),
                value: _estado,
                items: estados.map((String estado) {
                  return DropdownMenuItem<String>(
                    value: estado,
                    child: Text(estado),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _estado = value;
                  });
                },
              ),
              SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.purple, // Cambié 'primary' a 'backgroundColor'
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Aquí puedes manejar la lógica de guardado o enviar los datos al backend
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Reserva guardada exitosamente'),
                    ));
                  }
                },
                child: Text('Guardar Reserva'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
