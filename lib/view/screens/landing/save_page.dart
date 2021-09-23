import 'package:flutter/material.dart';

class SavePage extends StatefulWidget {
  @override
  _SavePageState createState() {
    return _SavePageState();
  }
}

class _SavePageState extends State<SavePage> {
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
            child: Text('Saved Screen'),
          ),
        ),
      ),
    );
  }
}
