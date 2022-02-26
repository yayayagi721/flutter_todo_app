import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonToast {
  static void showErorrToast(BuildContext context, String massege) {
    final fToast = FToast();
    fToast.init(context);

    fToast.showToast(
      child: _toast(massege, Colors.redAccent),
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }

  static Widget _toast(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: color,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.close),
          SizedBox(
            width: 12.0,
          ),
          Text(text),
        ],
      ),
    );
  }
}
