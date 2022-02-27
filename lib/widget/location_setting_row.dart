import 'package:flutter/material.dart';
import 'package:flutter_todo_app/view/setting_view.dart';
import 'package:flutter_todo_app/widget/common_dialog.dart';
import 'package:flutter_todo_app/widget/setting_row.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocationSettingRow extends HookConsumerWidget {
  final String title;
  LocationSettingRow(this.title);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingNotifier = ref.read(settingStateProvider.notifier);
    final settingState = ref.watch(settingStateProvider);

    return InkWell(
        onTap: () async {
          LatLng? latLng = await CommonDialog.showMapDialog(context);
          if (latLng != null) settingNotifier.changeDefaultLatLng(latLng);
        },
        child: SettingRow(
          "デフォルト位置情報",
          child: Container(
            child: (() {
              if (settingState.defaultLocation == null) {
                //デフォルト位置情報が選択されていない
                return Text("未選択",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black));
              } else {
                //デフォルト位置情報が選択されている
                if (settingState.defaultLocation!.address == null) {
                  //住所が未取得
                  return Center(
                    child: CircularProgressIndicator(
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(Colors.white)),
                  );
                } else {
                  //住所が取得済み
                  return Text(settingState.defaultLocation!.address!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black));
                }
              }
            })(),
          ),
        ));
  }
}
