import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:historico_onibus/data/linha.dart';
import 'package:historico_onibus/utils/latlong_polyline.dart';
import 'package:latlong2/latlong.dart';

class Mapa extends StatefulWidget {
  const Mapa({super.key});

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  var linhaDoOnibus = LatlongPolyline().conversao();

  bool mostrarSatelite = false;
  final String osm = 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';

  final String dark =
      'https://tiles.stadiamaps.com/tiles/alidade_smooth_dark/{z}/{x}/{y}{r}.png';

  final String lightCarto =
      "https://cartodb-basemaps-{s}.global.ssl.fastly.net/light_all/{z}/{x}/{y}.png";

  final String cat = 'https://tile.openstreetmap.bzh/ca/{z}/{x}/{y}.png';

  final String satelite = 'https://mt1.google.com/vt/lyrs=s&x={x}&y={y}&z={z}';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(-15.7942, -47.8822),
              initialZoom: 16.0,
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
              ),
            ),
            children: [
              // Camada de Satélite: GoogleMaps (Visibilidade controlada)
              TileLayer(
                urlTemplate: satelite,
                userAgentPackageName: 'com.example.historico_onibus',
              ),
              if (mostrarSatelite)
                TileLayer(
                  urlTemplate: osm,
                  userAgentPackageName: 'com.example.historico_onibus',
                  tileProvider: CancellableNetworkTileProvider(),
                ),
              PolylineLayer(polylines: linhaDoOnibus),
            ],
          ),
          Positioned(
            bottom: 60,
            right: 16,
            child: FloatingActionButton(
              backgroundColor: const Color(0xFF448AFF),
              tooltip: 'Trocar camada do mapa',
              onPressed: () {
                setState(() {
                  mostrarSatelite = !mostrarSatelite;
                });
              },
              child: Icon(mostrarSatelite ? Icons.map : Icons.satellite),
            ),
          ),
        ],
      ),
    );
  }
}
