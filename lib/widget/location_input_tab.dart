import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/widget/location_input.dart';
import 'package:flutter_todo_app/widget/todo_form.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocationInputTab extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formNotifier = ref.read(todoFormProvider.notifier);
    final formState = ref.read(todoFormProvider);

    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15, left: 10),
      child: Row(
        children: [
          Icon(
            Icons.add_location_sharp,
            size: 50,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () async {
                    var latLng;

                    if (formState.latitude != null &&
                        formState.longitude != null) {
                      latLng = await _showMapDialog(context,
                          LatLng(formState.latitude!, formState.longitude!));
                    } else {
                      latLng = await _showMapDialog(context);
                    }

                    if (latLng != null) {
                      formNotifier.inputLocation(
                          latLng.latitude, latLng.longitude);
                      print(formState.latitude);
                    }
                  },
                  child: Text(
                    "場所を入力",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                Container(
                  child: Text(formState.locationName ?? "位置情報未入力"),
                )

                //
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<LatLng?> _showMapDialog(BuildContext context,
      [LatLng? initLatLng]) async {
    final Size fullSize = MediaQuery.of(context).size;

    LatLng? latLng = await showDialog(
        context: context,
        builder: (childContext) {
          return Dialog(
              insetPadding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Container(
                  height: fullSize.height * (2 / 3),
                  width: double.infinity,
                  child: LocationInputer(initLatLng)));
        });
    return latLng;
  }
}
