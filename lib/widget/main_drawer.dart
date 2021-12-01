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
          _content("設定"),
          _content("INFO")
        ],
      ),
    );
  }

  Widget _content(String text, {IconData icon = Icons.arrow_forward}) {
    return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black38),
          ),
        ),
        child: ListTile(
          title: Text(text),
          trailing: Icon(icon),
        ));
  }
}
