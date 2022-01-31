import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_app/view_model/location_search_form_view_model.dart';
import 'package:flutter_todo_app/view_model/map_view_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mapProvider = StateNotifierProvider.autoDispose((ref) => MapProvider());

final locationSearchFormViewModel = StateNotifierProvider.autoDispose(
  (ref) => LocationSearchFormViewModel(ref.read),
);

final Completer<GoogleMapController> controller = Completer();

class LocationInput extends HookWidget {
  final LatLng? initLatLng;
  LocationInput([this.initLatLng]);

  @override
  Widget build(BuildContext context) {
    final mapState = useProvider(mapProvider);
    final locationSearchFormNotifier =
        useProvider(locationSearchFormViewModel.notifier);
    final mapNotifier = useProvider(mapProvider.notifier);
    final fToast = FToast();
    fToast.init(context);

    return Column(
      children: [
        Row(children: [
          SizedBox(
            width: 20,
          ),
          Expanded(
              child: TextField(
            decoration: const InputDecoration(
              labelText: '地名を入力',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
            onSubmitted: (_) async {
              final location =
                  await locationSearchFormNotifier.searchLocation();
              Widget toast = _resultToast(location);
              fToast.showToast(
                child: toast,
                gravity: ToastGravity.BOTTOM,
                toastDuration: Duration(seconds: 2),
              );

              if (location != null) {
                mapNotifier.createMarker(
                    LatLng(location.latitude, location.longitude));
                mapNotifier.changeCameraPosition(
                    LatLng(location.latitude, location.longitude));
              }
            },
            onChanged: (input) {
              locationSearchFormNotifier.update(input);
            },
          )),
          IconButton(
              iconSize: 40,
              onPressed: mapState.markers.isEmpty
                  ? null
                  : () {
                      Marker marker = mapState.markers.elementAt(0);
                      Navigator.pop(
                          context,
                          LatLng(marker.position.latitude,
                              marker.position.longitude));
                    },
              icon: Icon(Icons.done)),
        ]),
        Expanded(child: Map(initLatLng)),
      ],
    );
  }

  Widget _resultToast(Location? location) {
    var icon;
    var text;
    var color;

    if (location == null) {
      icon = Icons.close;
      text = "位置情報が見つかりませんでした。";
      color = Colors.redAccent;
    } else {
      icon = Icons.check;
      text = "位置情報が見つかりました。";
      color = Colors.greenAccent;
    }
    return _toast(color, icon, text);
  }
}

Widget _toast(Color color, IconData icon, String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: color,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        SizedBox(
          width: 12.0,
        ),
        Text(text),
      ],
    ),
  );
}

class Map extends HookWidget {
  final LatLng? latLng;
  Map([this.latLng]);

  @override
  Widget build(BuildContext context) {
    final state = useProvider(mapProvider);
    final mapNotifier = useProvider(mapProvider.notifier);

    useEffect(() {
      mapNotifier.init(latLng);
      return () {};
    }, const []);

    return state.markers.isEmpty
        ? Center(
            child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.black38)),
          )
        : GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              if (!state.controller.isCompleted)
                state.controller.complete(controller);
            },
            mapType: MapType.normal,
            markers: state.markers,
            initialCameraPosition: CameraPosition(
                target: state.markers.elementAt(0).position, zoom: 15),
            onTap: (latLng) => mapNotifier.createMarker(latLng),
            myLocationEnabled: true,
            myLocationButtonEnabled: true);
  }
}
