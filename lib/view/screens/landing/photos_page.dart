import 'package:flutter/material.dart';

class PhotosPage extends StatefulWidget {
  @override
  _PhotoPageState createState() {
    return _PhotoPageState();
  }
}

class _PhotoPageState extends State<PhotosPage> {
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
            child: Text('Photo Screen'),
          ),
        ),
      ),
    );
  }
}
