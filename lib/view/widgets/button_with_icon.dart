import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  final String imagePath;
  final String title;
  final Color titleColor;
  final Color backgroundColor;

  ButtonWithIcon(
      {required this.imagePath,
      required this.title,
      required this.titleColor,
      required this.backgroundColor});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Row(
        children: [
          Image(
            image: AssetImage(imagePath),
            width: 30,
            height: 30,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(color: titleColor),
              ),
            ),
          )
        ],
      ),
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(Size.fromHeight(40)),
          backgroundColor: MaterialStateProperty.all(backgroundColor)),
    );
  }
}
