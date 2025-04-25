import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Formulario extends StatelessWidget {
  const Formulario({super.key});

  @override
  Widget build(BuildContext context) {
    final format = DateFormat("dd-MM-yyy HH:mm");

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12),
          DefaultTextStyle(
              style: TextStyle(fontSize: 18),
              child: Text(
                "Histórico de posição do veículo:",
              )),
          Material(
            child: TextFormField(
              keyboardType: TextInputType.number,
              style: GoogleFonts.poppins(fontSize: 16),
              decoration: InputDecoration(
                hintText: 'linha/Prefixo/Placa do veículo',
                hintStyle: GoogleFonts.poppins(
                  color: Colors.grey[500],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: Icon(
                  Icons.directions_bus_filled,
                  color: const Color(0xFF448AFF),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          DefaultTextStyle(
              style: TextStyle(fontSize: 18),
              child: Text(
                "Data/Hora Inicio:",
              )),
          Material(
            child: DateTimeField(
              decoration: InputDecoration(
                hintText: 'dd/mm/aaaa --:--',
                hintStyle: GoogleFonts.poppins(
                  color: Colors.grey[500],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: Icon(
                  Icons.date_range,
                  color: const Color(0xFF448AFF),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
              ),
              format: format,
              onShowPicker: (context, currentValue) async {
                final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
                if (date != null) {
                  final time = await showTimePicker(
                    context: context,
                    initialTime:
                        TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                  );
                  return DateTimeField.combine(date, time);
                } else {
                  return currentValue;
                }
              },
            ),
          ),
          SizedBox(
            height: 16,
          ),
          DefaultTextStyle(
              style: TextStyle(fontSize: 18),
              child: Text(
                "Data/Hora Fim:",
              )),
          Material(
            child: DateTimeField(
              decoration: InputDecoration(
                hintText: 'dd/mm/aaaa --:--',
                hintStyle: GoogleFonts.poppins(
                  color: Colors.grey[500],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: Icon(
                  Icons.date_range,
                  color: const Color(0xFF448AFF),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
              ),
              format: format,
              onShowPicker: (context, currentValue) async {
                final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
                if (date != null) {
                  final time = await showTimePicker(
                    context: context,
                    initialTime:
                        TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                  );
                  return DateTimeField.combine(date, time);
                } else {
                  return currentValue;
                }
              },
            ),
          ),
          SizedBox(height: 20),
          TextButton.icon(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.blueAccent[200],
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            icon: Icon(
              Icons.loupe_rounded,
              color: Colors.white,
            ),
            label: Text(
              'Buscar Dados',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 20),
          TextButton.icon(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.blueAccent[200],
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            icon: Icon(
              Icons.map_outlined,
              color: Colors.white,
            ),
            label: Text(
              'Limpar Mapa',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 20),
          TextButton.icon(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.blueAccent[200],
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            icon: Icon(
              Icons.adf_scanner_outlined,
              color: Colors.white,
            ),
            label: Text(
              'Gerar Relatório',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
