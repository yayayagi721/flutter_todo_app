import 'package:flutter/material.dart';
import 'package:flutter_todo_app/widget/location_inputer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CommonDialog {
  static Future<LatLng?> showMapDialog(BuildContext context,
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
