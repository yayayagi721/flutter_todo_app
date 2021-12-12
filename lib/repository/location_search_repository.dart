import 'package:geocoding/geocoding.dart';

abstract class LocationSearchRepository {
  Future<List<Location>> getLocations(String address);
}
