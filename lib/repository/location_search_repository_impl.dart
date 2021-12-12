import 'package:flutter_todo_app/location_search_repository.dart';
import 'package:geocoding/geocoding.dart';

class LocationSearchRepositoryImpl implements LocationSearchRepository {
  LocationSearchRepositoryImpl();

  @override
  Future<List<Location>> getLocations(String address) async {
    return await locationFromAddress(address);
  }
}
