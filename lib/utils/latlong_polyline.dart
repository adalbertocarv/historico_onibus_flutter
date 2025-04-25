import 'package:flutter/material.dart';

import '../data/linha.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LatlongPolyline {
  conversao() {
    final linhaParaLista = Linha.onibus['features'] as List;

    final linhas = <Polyline>[];
    for (var lista in linhaParaLista) {
      final geometry = lista['geometry'];
      final type = geometry['type'];
      final coordinates = geometry['coordinates'];

      if (type == 'LineString') {
        final points = coordinates
            .map<LatLng>((coord) => LatLng(coord[1], coord[0]))
            .toList();
        linhas.add(Polyline(
          points: points,
          strokeWidth: 4,
          color: Colors.blue,
        ));
      }
    }
    return linhas;
  }
}
