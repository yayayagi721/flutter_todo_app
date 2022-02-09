import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_app/view_model/location_search_form_view_model.dart';
import 'package:flutter_todo_app/view_model/map_view_model.dart';
import 'package:flutter_todo_app/view_model/state/map_state.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mapProvider = StateNotifierProvider.autoDispose<MapProvider, MapState>(
    (ref) => MapProvider(ref.read));

final locationSearchFormViewModel = StateNotifierProvider(
  (ref) => LocationSearchFormViewModel(ref.read),
);

final Completer<GoogleMapController> controller = Completer();

class LocationInputer extends HookConsumerWidget {
  //マーカおよび、カメラの初期位置
  final LatLng? initLatLng;
  LocationInputer([this.initLatLng]);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationSearchFormNotifier =
        ref.read(locationSearchFormViewModel.notifier);
    final mapState = ref.watch(mapProvider);
    final mapNotifier = ref.read(mapProvider.notifier);

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
              final latLng = await locationSearchFormNotifier.searchLocation();
              Widget toast = _resultToast(latLng);
              fToast.showToast(
                child: toast,
                gravity: ToastGravity.BOTTOM,
                toastDuration: Duration(seconds: 2),
              );

              if (latLng != null) {
                mapNotifier.createMarker(latLng);
                mapNotifier.changeCameraPosition(latLng);
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
                      Navigator.pop(context, mapNotifier.getMarkerLatLng());
                    },
              icon: Icon(Icons.done)),
        ]),
        Expanded(child: Map(initLatLng)),
      ],
    );
  }

  Widget _resultToast(LatLng? latLng) {
    var icon;
    var text;
    var color;

    if (latLng == null) {
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

class Map extends HookConsumerWidget {
  final LatLng? latLng;
  Map([this.latLng]);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapState = ref.watch(mapProvider);
    final mapNotifier = ref.read(mapProvider.notifier);

    useEffect(() {
      mapNotifier.init(latLng);
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
