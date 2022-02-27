import 'package:flutter/material.dart';

class SettingRow extends StatelessWidget {
  final String title;
  final Widget? child;
  SettingRow(this.title, {this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Text(title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black)),
                ],
              ),
            )),
            child ?? Container(),
            SizedBox(
              width: 30,
            )
          ],
        ),
      ),
    );
  }
}
