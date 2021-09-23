import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newhomesource/utilities/colors.dart';
import 'package:newhomesource/view/widgets/dashboard_button.dart';

class UserDashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlueColor,
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          child: Image.asset(
            'assets/images/logo.png',
            width: 150,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Account Info',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  DashBoardButton(
                    title: "Edit Profile",
                    iconData: Icons.person,
                  ),
                  DashBoardButton(
                    title: "Setting & Privacy",
                    iconData: Icons.settings,
                  ),
                  DashBoardButton.usingImageIcon(
                    title: "Logout",
                    assetImage: AssetImage('assets/images/ic_logout.png'),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Tools',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  DashBoardButton.usingImageIcon(
                    title: "Get Pre-Approved",
                    assetImage: AssetImage('assets/images/ic_dollar.png'),
                  ),
                  DashBoardButton.usingImageIcon(
                    title: "Financial Calculator",
                    assetImage: AssetImage('assets/images/ic_calculator.png'),
                  ),
                  DashBoardButton.usingImageIcon(
                    title: "Resource Center",
                    assetImage:
                        AssetImage('assets/images/ic_resource_center.png'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
