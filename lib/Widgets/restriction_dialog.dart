import 'package:flutter/material.dart';
import 'package:shivshakti/Widgets/text_varients.dart';
import 'package:sizer/sizer.dart';

class RestrictionDialog extends StatelessWidget {
  final String heading;

  const RestrictionDialog({Key? key, required this.heading}) : super(key: key);

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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0.sp),
                child: FittedBox(
                  child: Container(
                    // height: 30.h,
                    width: 80.w,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 7.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                          ),
                          child: Center(child: CustomText(text: "User Restricted", textSize: 16.0.sp, textColor:Colors.grey[800],)),
                        ),
                        // Spacer(),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0.sp, right: 10.0.sp, top: 20.0.sp, bottom: 20.0.sp),
                          child: CustomText(text: heading, textSize: 12.0.sp, textColor: Colors.grey[800],),
                        ),
                        // Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )


      // AlertDialog(
      //   title: Text(widget.heading!),
      //   actions: [
      //     MaterialButton(
      //       onPressed: () {
      //         Navigator.pop(context, 'no');
      //       },
      //       child: const Text(
      //         'NO',
      //         style: TextStyle(color: Colors.pink),
      //       ),
      //     ),
      //     MaterialButton(
      //       onPressed: () async {
      //         Navigator.pop(context, 'yes');
      //         // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>GenerateOtpScreen()), (route) => false);
      //       },
      //       child:const Text(
      //         'YES',
      //         style: TextStyle(color: Colors.pink),
      //       ),
      //     )
      //   ],
      //   content: Text(widget.text!),
      // ),
    );
  }
}


