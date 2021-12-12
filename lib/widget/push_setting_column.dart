import 'package:flutter/material.dart';

class PushSettingColumn extends StatelessWidget {
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
            ))),
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
    );
  }
}
