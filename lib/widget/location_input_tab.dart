import 'package:flutter/material.dart';
import 'package:flutter_todo_app/widget/common_dialog.dart';
import 'package:flutter_todo_app/widget/todo_form.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocationInputTab extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formNotifier = ref.read(todoFormStateProvider.notifier);
    final formState = ref.watch(todoFormStateProvider);

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
                    final locationInfo = formState.locationInfo;

                    if (locationInfo != null) {
                      latLng = await CommonDialog.showMapDialog(
                          context,
                          LatLng(
                              locationInfo.latitude, locationInfo.longitude));
                    } else {
                      latLng = await CommonDialog.showMapDialog(context);
                    }

                    if (latLng != null) {
                      formNotifier.inputLocation(latLng);
                    }
                  },
                  child: Text(
                    "位置情報を入力",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                Container(child: Text(formState.loededAddress()))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
