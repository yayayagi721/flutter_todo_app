import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class LocationSearchRepository {
  Future<List<Location>> getLocations(String address);
  Future<String?> getAddress(LatLng latLng);
}
