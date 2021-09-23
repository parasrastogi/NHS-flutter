import 'package:flutter/material.dart';

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() {
    return _MorePageState();
  }
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // hide back button
          centerTitle: true,
          title: SizedBox(
            child: Image.asset(
              'assets/images/logo.png',
              width: 150,
            ),
          ),
        ),
        body: Container(
          child: Center(
            child: Text('more Screen'),
          ),
        ),
      ),
    );
  }
}
