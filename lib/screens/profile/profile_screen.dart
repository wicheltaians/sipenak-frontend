import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:sipenak_app/components/custom_bottom_nav_bar.dart';
import 'package:sipenak_app/enums.dart';

import 'components/body.dart';

DateTime currentBackPressTime;

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profil",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: WillPopScope(child: Body(), onWillPop: onWillPop),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      BotToast.showText(
        text: "Ketuk lagi untuk keluar",
        duration: Duration(seconds: 2),
        align: const Alignment(0, 0.0),
      );
      return Future.value(false);
    }
    return Future.value(true);
  }
}
