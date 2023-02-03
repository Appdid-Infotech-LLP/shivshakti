import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shivshakti/Screens/Extras/about_us.dart';
import 'package:shivshakti/Screens/Extras/contact_us.dart';
import 'package:shivshakti/Screens/InitialsScreens/login_screen.dart';
import 'package:shivshakti/Screens/ProfileScreen/profile_screen.dart';
import 'package:shivshakti/Services/constans.dart';
import 'package:shivshakti/Widgets/confirmation_dialog.dart';
import 'package:shivshakti/Widgets/navigation_drawer_tile.dart';
import 'package:sizer/sizer.dart';

class NavigationDrawerScreen extends StatefulWidget {
  const NavigationDrawerScreen({Key? key}) : super(key: key);

  @override
  _NavigationDrawerScreenState createState() => _NavigationDrawerScreenState();
}

class _NavigationDrawerScreenState extends State<NavigationDrawerScreen> {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset(
              "assets/images/logo.png",
              height: size!.height * 0.1,
              width: 60.w,
            ),
          ),
          NavDrawerHomeTile(
            leadIcon: Icons.home,
            title: 'Home',
            trailIcon: Icons.chevron_right,
            press: () {
              Navigator.pop(context);
            },
          ),
          NavDrawerHomeTile(
            leadIcon: Icons.person,
            title: 'Profile',
            trailIcon: Icons.chevron_right,
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const ProfileScreen();
              }));
            },
          ),
          NavDrawerHomeTile(
            leadIcon: Icons.account_balance,
            title: 'About Us',
            trailIcon: Icons.chevron_right,
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const AboutUsScreen();
              }));
            },
          ),
          NavDrawerHomeTile(
            leadIcon: Icons.phone,
            title: 'Contact Us',
            trailIcon: Icons.chevron_right,
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const ContactUsScreen();
              }));
            },
          ),
          NavDrawerHomeTile(
            leadIcon: Icons.book,
            title: 'Privacy Policy',
            trailIcon: Icons.chevron_right,
            press: () {},
          ),
          NavDrawerHomeTile(
            leadIcon: Icons.logout,
            title: 'Logout',
            trailIcon: Icons.chevron_right,
            press: () {
              showGeneralDialog(
                barrierColor: Colors.black.withOpacity(0.8),
                context: context,
                transitionBuilder: (context, a1, a2, widget) {
                  return Transform.scale(
                    scale: a1.value,
                    child: Opacity(
                      opacity: a1.value,
                      child: ConfirmationDialog(
                        heading: 'LogOut',
                        text: 'Do you want to log out?',
                        dialogHeight: 25.h,
                        button1Color: primaryColor,
                      ),
                    ),
                  );
                },
                barrierDismissible: false,
                barrierLabel:
                    MaterialLocalizations.of(context).modalBarrierDismissLabel,
                transitionDuration: const Duration(milliseconds: 200),
                pageBuilder: (context, animation1, animation2) {
                  return Container();
                },
              ).then((value) async {
                final prefs = await SharedPreferences.getInstance();
                if (value != 'no') {
                  prefs.clear();
                  Get.reset();
                  // print(prefs.getKeys());
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return LoginScreen();
                  }));
                } else {
                  Get.back();
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
