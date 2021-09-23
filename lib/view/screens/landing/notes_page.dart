import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() {
    return _NotesPageState();
  }
}

class _NotesPageState extends State<NotesPage> {
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
            child: Text('Notes Screen'),
          ),
        ),
      ),
    );
  }
}
