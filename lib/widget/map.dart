import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_app/widget/location_inputer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MapWidget extends HookConsumerWidget {
  final LatLng? latLng;
  MapWidget([this.latLng]);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapState = ref.watch(mapProvider);
    final mapNotifier = ref.read(mapProvider.notifier);

    useEffect(() {
      WidgetsBinding.instance!
          .addPostFrameCallback((_) => mapNotifier.init(latLng));
      return () {};
    }, const []);

    return mapState.markers.isEmpty
        ? Center(
            child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.black38)),
          )
        : GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              if (!mapState.controller!.isCompleted)
                mapState.controller!.complete(controller);
            },
            mapType: MapType.normal,
            markers: mapState.markers,
            initialCameraPosition: CameraPosition(
                target: mapState.markers.elementAt(0).position, zoom: 15),
            onTap: (latLng) => mapNotifier.createMarker(latLng),
            myLocationEnabled: true,
            myLocationButtonEnabled: true);
  }
}
