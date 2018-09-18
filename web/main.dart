import 'dart:html';
import 'package:google_maps/google_maps.dart';

final mapOptions = new MapOptions()
    ..zoom = 8
    ..center = new LatLng(31.2482, -92.2099);
final map = new GMap(document.getElementById("map-canvas"), mapOptions);
final markers = <Marker>[];

void main() {
  querySelector('#button').onClick.listen(showNewMap);

  KmlLayer()
  	..url = 'https://raw.githubusercontent.com/PaccoTan/kmlFiles/master/test.kml'
    ..map = map;
}

void showNewMap(event) {
  double lat  = double.parse(queryInput('#lat_input')),
         long = double.parse(queryInput('#long_input'));

  String words = queryInput('#title_input'),
  		 description = queryInput('#descriptionInput');

  final marker = Marker(MarkerOptions()
    ..position = new LatLng(lat,long)
    ..map = map
    ..title = words);
  markers.add(marker);
  final infowindow = InfoWindow(InfoWindowOptions()..content = description);

  marker.onClick.listen((e) {
    infowindow.open(map, marker);
  });

  print(markers);
}

String queryInput(String str) {
  Element element = querySelector(str);

  if (element != null && element is InputElement)
    return element.value;

  throw AssertionError('Queried element ${element} must be non-null InputElement');
}