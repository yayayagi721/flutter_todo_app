import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_app/widget/location_input.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocationSettingColumn extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_title("位置情報"), _defaultLocation("デフォルト位置情報")],
    );
  }

  Widget _title(String text) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.black12,
      ),
      child: Row(
        children: [
          Expanded(
              child: Container(
                  child: Container(
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(text,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black45)),
              ],
            ),
          )))
        ],
      ),
    );
  }

  Widget _defaultLocation(String text) {
    final context = useContext();
    return InkWell(
        onTap: () {
          _showMapDialog(context);
        },
        child: Container(
          decoration: BoxDecoration(
              border: const Border(
                  bottom: const BorderSide(
            color: Colors.black12,
            width: 1,
          ))),
          height: 70,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(text,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black)),
                    ],
                  ),
                )),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.black45,
                ),
                SizedBox(
                  width: 5,
                )
              ],
            ),
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
                  child: LocationInput()));
        });
    return latLng;
  }
}
