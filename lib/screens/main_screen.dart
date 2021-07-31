import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kinishko/widgets/side_menu.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.black, // for Android
        statusBarBrightness: Brightness.light // for IOS.
    ));
    return Scaffold(
      backgroundColor: Color.fromRGBO(228, 232, 245, 1),
      body: Padding(
        padding: EdgeInsets.only(top: 35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SideMenu(),
          ],
        ),
      ),

    );
  }
}
