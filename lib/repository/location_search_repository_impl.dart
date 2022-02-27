import 'package:flutter_todo_app/repository/location_search_repository.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';

class LocationSearchRepositoryImpl implements LocationSearchRepository {
  LocationSearchRepositoryImpl();

  @override
  Future<List<Location>> getLocations(String address) async {
    return await locationFromAddress(address);
  }

  @override
  Future<String?> getAddress(LatLng latLng) async {
    try {
      List<Placemark> placemark =
          await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
      return placemark[0].name;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
