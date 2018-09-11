import 'dart:html';
import 'package:google_maps/google_maps.dart';

void main() {
  querySelector('#output').text = 'Map above lol';
  final mapOptions = new MapOptions()
    ..zoom = 8
    ..center = new LatLng(-34.397, 150.644);
  new GMap(document.getElementById("map-canvas"), mapOptions);

  querySelector('#button').onClick.listen((event) {
    double lat = double.parse((querySelector('#lat_input') as InputElement).value);
    double long = double.parse((querySelector('#long_input') as InputElement).value);
    double zoom = double.parse((querySelector('#zoom_input') as InputElement).value);

    final mapOptions = new MapOptions()
      ..zoom = zoom
      ..center = new LatLng(lat, long);
    new GMap(document.getElementById("map-canvas"), mapOptions);
  });
}