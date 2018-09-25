import 'dart:html';
import 'package:google_maps/google_maps.dart';

void main() {
  final chicago = LatLng(31.2482,-92.2099);
  final mapOptions = MapOptions()
    ..zoom = 8
    ..center = chicago;
  final map = GMap(document.getElementById('map-canvas'), mapOptions);

  KmlLayer()
    ..url = 'http://wells.rocksolidimages.com/Data/KML/Louisiana_Counties.kml'
    ..map = map;
}