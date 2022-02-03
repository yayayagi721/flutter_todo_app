import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/view/setting_view.dart';
import 'package:flutter_todo_app/widget/location_inputer.dart';
import 'package:flutter_todo_app/widget/setting_row.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocationSettingRow extends HookConsumerWidget {
  final String title;
  LocationSettingRow(this.title);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingNotifier = ref.read(settingStateProvider.notifier);
    final settingState = ref.read(settingStateProvider);

    return InkWell(
        onTap: () async {
          LatLng? latLng = await _showMapDialog(context);
          if (latLng != null) settingNotifier.changeDefaultLatLng(latLng);
        },
        child: SettingRow(
          "デフォルト位置情報",
          child: Container(
            child: settingState.defaultLocation.address == null
                ? Center(
                    child: CircularProgressIndicator(
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.white)),
                  )
                : Text(settingState.defaultLocation.address!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black)),
          ),
        ));
  }

  Future<LatLng?> _showMapDialog(BuildContext context) async {
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
                  child: LocationInputer()));
        });
    return latLng;
  }
}
