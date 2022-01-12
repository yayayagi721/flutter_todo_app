import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_app/view/setting_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PushSettingColumn extends HookWidget {
  Map<String, int> pickerMap = {
    '10分前': 10,
    '30分前': 30,
    '1時間前': 60,
    '3時間前': 180,
    '6時間前': 360
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_title("通知"), _defaultLocation("予定リマインド時刻")],
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
    final settingViewState = useProvider(settingViewModel);
    final settingViewNotifier = useProvider(settingViewModel.notifier);

    return InkWell(
        onTap: () async {
          FocusScope.of(context).requestFocus(new FocusNode());
          final selected = await _showPicker(context);
          if (selected == null) return;

          print(selected);

          final interval = pickerMap[selected];
          print(interval);
          settingViewNotifier.changeRemaindInterval(interval!);
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
                Container(
                  child: Text(_intervalStr(settingViewState.remaindInterval),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black)),
                ),
                SizedBox(
                  width: 5,
                )
              ],
            ),
          ),
        ));
  }

  Future<String?> _showPicker(context) async {
    final _keys = pickerMap.keys.toList();
    final _pickerItems = _keys.map((key) => Text(key)).toList();
    var selectedIndex = 0;

    final selected = await showCupertinoModalPopup<String>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 216,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context, _keys[selectedIndex]);
            },
            child: CupertinoPicker(
              itemExtent: 32,
              children: _pickerItems,
              onSelectedItemChanged: (int index) {
                selectedIndex = index;
              },
            ),
          ),
        );
      },
    );

    return selected;
  }

  String _intervalStr(int minute) {
    var str = "";
    if (minute <= 60) {
      str = "$minute分前";
    } else {
      final hour = minute / 60;
      str = "$hour時間前";
    }

    return str;
  }
}
