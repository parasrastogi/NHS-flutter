import 'package:flutter/material.dart';

class SearchResultItem extends StatelessWidget {
  final suggestion;
  final Function() onCancelItem;
  const SearchResultItem(
      {required this.suggestion, required this.onCancelItem});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Icon(Icons.access_time),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Text(
                suggestion.toString(),
                style: TextStyle(),
              ),
            ),
          ),
          // IconButton(
          //   alignment: Alignment.centerRight,
          //   padding: EdgeInsets.only(right: 0),
          //   onPressed: onCancelItem,
          //   icon: Icon(Icons.cancel_outlined),
          // )
        ],
      ),
    );
  }
}
