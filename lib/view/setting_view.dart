import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_app/notifier/setting_state_notifier.dart';
import 'package:flutter_todo_app/repository/setting_repository_impl.dart';
import 'package:flutter_todo_app/state/setting_state.dart';
import 'package:flutter_todo_app/widget/location_setting_row.dart';
import 'package:flutter_todo_app/widget/setting_row.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

final settingRepositoryProvider = Provider.autoDispose(
  (ref) => SettingRepositoryImpl(),
);

final settingStateProvider =
    StateNotifierProvider<SettingStateNotifier, SettingState>(
        (ref) => SettingStateNotifier(ref.read));

class SettingView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("設定"),
      ),
      body: _settingBody(),
    );
  }

  Widget _settingBody() {
    return ListView(
      children: [
        _title("位置情報"),
        LocationSettingRow("デフォルト位置情報"),
        _title("その他"),
        _licenseRow(),
        _inquiryRow()
      ],
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

  Widget _licenseRow() {
    final context = useContext();
    return InkWell(
      onTap: () async {
        showLicensePage(
          context: context,
          applicationName: 'Todo', // アプリの名前
          applicationVersion: '1.0.0', // バージョン
          applicationIcon: Icon(Icons.favorite), // アプリのアイコン Widget
          applicationLegalese: '2021 yayayagi', // 権利情報
        );
      },
      child: SettingRow("ライセンス", child: Icon(Icons.receipt)),
    );
  }

  Widget _inquiryRow() {
    return InkWell(
        onTap: () async {
          _openMailApp();
        },
        child: SettingRow(
          "問い合わせ",
          child: Icon(Icons.mail),
        ));
  }

  void _openMailApp() async {
    final title = Uri.encodeComponent('タイトル');
    final body = Uri.encodeComponent('本文');
    const mailAddress = 'snoopy1995.1.25@gmail.com';

    return _launchURL(
      'mailto:$mailAddress?subject=$title&body=$body',
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      final Error error = ArgumentError('Could not launch $url');
      throw error;
    }
  }
}
