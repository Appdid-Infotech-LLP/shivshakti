import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  int? styleType = 0;
  double? scaleFactor = 1.0;
  bool? softWrap;
  final String text;
  final TextDecoration? textDecoration;
  final TextDirection? textDirection;
  final Color? textColor;
  final double? textSize;
  final FontWeight? textWeight;
  final int? textLines;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
   TextStyle? style = GoogleFonts.quicksand(
    color: Colors.grey[800],
    fontSize: 12.0.sp,
    fontWeight: FontWeight.w500,
  );
   CustomText({
     Key? key,
     required this.text,
     this.styleType,
     this.textColor,
     this.textSize,
     this.textWeight,
     this.textLines,
     this.style,
     this.textAlign,
     this.textOverflow,
     this.softWrap,
     this.textDirection, this.textDecoration,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
      maxLines: textLines,
      softWrap: softWrap??true,
      // semanticsLabel: "hii",
      textScaleFactor: scaleFactor,
      textDirection: textDirection??TextDirection.ltr,
      overflow: textOverflow??TextOverflow.clip,
      textAlign: textAlign??TextAlign.center,
      style: /*style,*/
      styleType != 1?
      GoogleFonts.quicksand(
        color: textColor??Colors.grey[800],
        decoration: textDecoration??TextDecoration.none,
        fontSize: textSize??10.0.sp,
        fontWeight: textWeight??FontWeight.w600
      ):
      GoogleFonts.merriweather(
          color: textColor??Colors.grey[800],
          decoration: textDecoration??TextDecoration.none,
          fontSize: textSize??10.0.sp,
          fontWeight: textWeight??FontWeight.w500
      ),
    );
  }
}
