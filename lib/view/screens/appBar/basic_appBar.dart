import 'package:flutter/material.dart';

class BasicAppBar {
  static late Widget _title;
  static AppBar getAppBar({String? title}) {
    if (title != null) {
      BasicAppBar._title = Text(
        title,
        style: TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal),
      );
    } else {
      BasicAppBar._title = SizedBox(
        child: Image.asset(
          'assets/images/logo.png',
          width: 150,
        ),
      );
    }

    return AppBar(
      iconTheme: IconThemeData(color: Colors.blue),
      title: SizedBox(child: BasicAppBar._title),
    );
  }
}
