import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shivshakti/Services/constans.dart';
import 'package:sizer/sizer.dart';

class NavDrawerHomeTile extends StatelessWidget {
  const NavDrawerHomeTile({
    Key? key,
    @required this.title,
    @required this.leadIcon,
    @required this.trailIcon,
    @required this.press,
  }) : super(key: key);

  final String? title;
  final IconData? leadIcon, trailIcon;
  final GestureTapCallback? press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: Icon(leadIcon, color: primaryColor),
      title: Text(
        title??'',
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.quicksand(
            fontSize: 10.0.sp,
            fontWeight: FontWeight.w600
        ),
      ),
      trailing: Icon(
        trailIcon,
        color: primaryColor,
        size: 15.0.sp,
      ),
    );
  }
}
