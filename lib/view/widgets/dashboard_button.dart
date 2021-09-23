import 'package:flutter/material.dart';
import 'package:newhomesource/utilities/colors.dart';

class DashBoardButton extends StatelessWidget {
  final String title;
  IconData? iconData;
  AssetImage? assetImage;
  DashBoardButton({required this.title, required this.iconData});

  DashBoardButton.usingImageIcon(
      {required this.title, required this.assetImage});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: iconData != null
          ? Icon(
              iconData,
              color: kButtonBlueColor,
            )
          : ImageIcon(
              assetImage,
              size: 22,
              color: kButtonBlueColor,
            ),
      // icon: Icon(
      //   iconData,
      //   color: AppColors.blue,
      // ),
      label: Text(
        title,
        style: TextStyle(color: kButtonBlueColor),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
      ),
    );
  }
}
