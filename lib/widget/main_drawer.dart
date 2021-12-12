import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // DrawerHeader(
          //   child: Container(),
          //   decoration: BoxDecoration(
          //     color: Colors.blue,
          //   ),
          // ),

          Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
              )),
          _content("設定", () {
            Navigator.pushNamed(context, "/settingView");
          }),
          _content("ライセンス", () {
            showLicensePage(
              context: context,
              applicationName: 'Todo', // アプリの名前
              applicationVersion: '1.0.0', // バージョン
              applicationIcon: Icon(Icons.favorite), // アプリのアイコン Widget
              applicationLegalese: '2021 yayayagi', // 権利情報
            );
          })
        ],
      ),
    );
  }

  Widget _content(String text, void Function() onTap,
      {IconData icon = Icons.arrow_forward}) {
    return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black38),
          ),
        ),
        child: ListTile(
          onTap: onTap,
          title: Text(text),
          trailing: Icon(icon),
        ));
  }
}
