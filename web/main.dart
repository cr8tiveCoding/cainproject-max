import 'dart:html';
import 'package:google_maps/google_maps.dart';

void main() {
  querySelector('#output').text = 'Map above lol';

  final mapOptions = new MapOptions()
    ..zoom = 8
    ..center = new LatLng(-34.397, 150.644);
  new GMap(document.getElementById("map-canvas"), mapOptions);

  querySelector('#button').onClick.listen(showNewMap);
}

void showNewMap(event) {
  double lat  = double.parse(queryInput('#lat_input')),
         long = double.parse(queryInput('#long_input')),
         zoom = double.parse(queryInput('#zoom_input'));

  final mapOptions = new MapOptions()
    ..zoom = zoom
    ..center = new LatLng(lat, long);

  new GMap(document.getElementById("map-canvas"), mapOptions);
}

String queryInput(String str) {
  Element element = querySelector(str);

  if (element != null && element is InputElement)
    return element.value;

  throw AssertionError('Queried element ${element} must be non-null InputElement');
}