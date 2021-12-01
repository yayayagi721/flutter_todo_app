import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_app/view_model/map_provider.dart';
import 'package:flutter_todo_app/widget/location_input.dart';
import 'package:flutter_todo_app/widget/todo_form.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mapProvider = StateNotifierProvider((ref) => MapProvider());

class LocationInputTab extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(mapProvider);
    final mapNotifier = useProvider(mapProvider.notifier);
    final formNotifier = useProvider(todoFormProvider.notifier);
    final formState = useProvider(todoFormProvider);

    return Container(
      height: 200,
      child: Column(
        children: [
          Text(formState.latitude.toString()),
          Center(
              child: TextButton(
                  onPressed: () async {
                    LatLng? latLng =
                        await _showMapDialog(context, state, mapNotifier);
                    if (latLng != null) {
                      formNotifier.inputLocation(
                          latLng.latitude, latLng.longitude);
                      print(formState.latitude);
                    }
                  },
                  child: Text("hoge")))
        ],
      ),
    );
  }

  Future<LatLng?> _showMapDialog(
      BuildContext context, state, mapNotifier) async {
    final Completer<GoogleMapController> _controller = Completer();

    final Size fullSize = MediaQuery.of(context).size;

    LatLng? latLng = await showDialog(
        context: context,
        builder: (childContext) {
          return Dialog(
              insetPadding: EdgeInsets.all(20),
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Container(
                  height: fullSize.height * (2 / 3),
                  width: double.infinity,
                  child: LocationInput()));
        });
    return latLng;
  }
}
