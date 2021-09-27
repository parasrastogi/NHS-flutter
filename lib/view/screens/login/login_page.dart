import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/button_with_icon.dart';
import '../landing/landing_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/LaunchImage.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.only(
          bottom: 10,
          left: 40,
          right: 40,
          top: MediaQuery.of(context).size.height / 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(
              height: 30,
              image: AssetImage('assets/images/logo.png'),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Welcome to NewHomeSource',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff093265),
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.center),
            Text(
              'The Smallest Way to Buy a New Home',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff093265),
                  decoration: TextDecoration.none),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .06,
              child: TextField(
                maxLines: 1,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Your Email',
                    prefixIcon: Icon(Icons.email, size: 20)),
                style: TextStyle(fontSize: 14),
                textInputAction: TextInputAction.next,
                autofocus: false,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .06,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide.none),
                  hintText: 'Your Password',
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.lock, size: 20),
                ),
                style: TextStyle(fontSize: 14),
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LandingPage()),
                // );
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LandingPage()));
              },
              child: Text(
                'Sign in',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.normal),
              ),
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size.fromHeight(40)),
                  backgroundColor:
                      MaterialStateProperty.all(Color(0xff004982))),
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                padding: EdgeInsets.all(8),
                decoration:
                    BoxDecoration(color: Color(0xff999FA7).withOpacity(0.6)),
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.yellow),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    'OR',
                    style: TextStyle(),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ButtonWithIcon(
              imagePath: 'assets/images/fb_login.png',
              title: 'Sign in with facebook',
              backgroundColor: Color(0xff415A95),
              titleColor: Colors.white,
            ),
            SizedBox(height: 10),
            ButtonWithIcon(
                imagePath: 'assets/images/google_login.png',
                title: 'Sign in with Google',
                backgroundColor: Color(0xff5086ED),
                titleColor: Colors.white),
            SizedBox(height: 10),
            ButtonWithIcon(
                imagePath: 'assets/images/apple.png',
                title: 'Sign in with Apple',
                backgroundColor: Colors.white,
                titleColor: Colors.black),
            Expanded(
              child: Container(),
              flex: 1,
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(Size.fromHeight(40)),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xffFFCD00))),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Skip for now',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(Size.fromHeight(40)),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff007AFF))),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
