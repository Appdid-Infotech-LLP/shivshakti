import 'package:flutter/material.dart';
import 'package:shivshakti/Widgets/text_varients.dart';
import 'package:sizer/sizer.dart';

class ConfirmationDialog extends StatelessWidget {
  final String? heading, text;
  final double? headingTextSize, headingHeight, bodyTextHeight;
  final Widget? w;
  final double? dialogHeight, okButton;
  final Color? headingColor, headingTextColor, bodyColor, bodyTextColor, button1Color, button1TextColor, button2Color, button2TextColor;

   const ConfirmationDialog({
    Key? key,
    required this.heading,
    required this.text,
    this.headingColor,
    this.headingTextColor,
    this.headingTextSize,
    this.bodyColor,
    this.bodyTextColor,
    this.button1Color,
    this.button1TextColor,
    this.button2Color,
    this.button2TextColor,
     this.dialogHeight,
     this.okButton,
     this.w, this.headingHeight, this.bodyTextHeight
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async{
        return false;
      },
      child:
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          height: 100.h,
          width: 100.w,
          color: Colors.transparent,
          child: Center(
            child: SafeArea(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0.sp),
                child: Container(
                  height: dialogHeight??30.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    color: bodyTextColor??Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: headingHeight??7.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                        ),
                        child: Center(child: CustomText(text: heading!, textSize: headingTextSize??16.0.sp, textColor: headingTextColor??Colors.grey[800],)),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.all(8.0.sp),
                        child: CustomText(text: text!, textSize: bodyTextHeight??12.0.sp, textColor: bodyTextColor??Colors.grey[800]),
                      ),
                      if(w != null)
                        w!,
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if(okButton == null)
                          MaterialButton(
                            color: button1Color??Colors.lightBlueAccent,
                              onPressed: (){
                                Navigator.pop(context, 'yes');
                              },
                            child: CustomText(text: "Yes", textSize: 12.0.sp, textColor: button1TextColor??Colors.grey[100]),
                          ),
                          MaterialButton(
                            color: button2Color??Colors.grey[100],
                              onPressed: (){
                                Navigator.pop(context, 'no');
                              },
                            child: CustomText(text: okButton == null?"No":"Ok", textSize: 12.0.sp, textColor: button2TextColor??Colors.grey[800]),
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


