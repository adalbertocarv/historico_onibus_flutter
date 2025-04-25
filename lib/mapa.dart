import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';

class Mapa extends StatelessWidget {
  const Mapa({super.key});
  final String osm = 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';

  final String darkCarto =
      'https://cartodb-basemaps-{s}.global.ssl.fastly.net/dark_all/{z}/{x}/{y}.png';

  final String lightCarto =
      "https://cartodb-basemaps-{s}.global.ssl.fastly.net/light_all/{z}/{x}/{y}.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(-15.7942, -47.8822),
              initialZoom: 12.0,
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
              ),
            ),
            children: [
              TileLayer(
                urlTemplate: osm,
                subdomains: ['a', 'b', 'c'],
                tileProvider: CancellableNetworkTileProvider(),
              )
            ],
          )
        ],
      ),
    );
  }
}
