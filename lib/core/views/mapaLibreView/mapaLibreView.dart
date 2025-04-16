// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:ionicons/ionicons.dart';
import 'package:latlong2/latlong.dart';
import 'package:nautik_app/core/global/global.dart';

class MapaLibreView extends StatefulWidget {
  const MapaLibreView({super.key});

  @override
  _MapaLibreViewState createState() => _MapaLibreViewState();
}

class _MapaLibreViewState extends State<MapaLibreView> {
  final MapController _mapController = MapController();

  final MAP_BOX_TOKEN =
      'pk.eyJ1IjoiZG9ibGV1MzAzIiwiYSI6ImNtOWp5ZXk5NzBnc2syam9kbHZidW5zZGEifQ.dfZUFvtmsNr3_wfK9KKmRg';
  final LatLng _selectedLocation = LatLng(6.2442, -75.5812);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seleccionar Ubicación"),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: _selectedLocation,
          maxZoom: 25,
          minZoom: 5,

          initialZoom: 18,
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=$MAP_BOX_TOKEN',
            additionalOptions: {
              'access_token': MAP_BOX_TOKEN,
              'id': 'mapbox/streets-v12',
            },
          ),

          MarkerLayer(
            markers: [
              Marker(
                child: Container(
                  child: Icon(Ionicons.pin, color: Colors.red, size: 40),
                ),
                point: _selectedLocation,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
