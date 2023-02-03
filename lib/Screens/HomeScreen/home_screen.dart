import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shivshakti/Apis/getx_get_backup.dart';
import 'package:shivshakti/Apis/getx_seize_vehicle.dart';
import 'package:shivshakti/Apis/getx_sync_data.dart';
import 'package:shivshakti/Services/constans.dart';
import 'package:shivshakti/Widgets/confirmation_dialog.dart';
import 'package:shivshakti/Widgets/text_varients.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../NavigatorDrawer/navigation_drawer.dart';

class HomeScreen extends StatelessWidget {
  final syncDataInstance = Get.put(GetSyncData());
  final seizeVehicleInstance = Get.put(GetXSeizeVehicle());
  final backupInstance = Get.put(GetXBackup());
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showGeneralDialog(
          barrierColor: Colors.black.withOpacity(0.8),
          context: context,
          barrierDismissible: false,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (context, animation1, animation2) {
            return ConfirmationDialog(
              heading: 'Exit?',
              text: 'Do you want to exit?',
              dialogHeight: 20.h,
              button1Color: primaryColor,
            );
          },
        ).then((value) {
          if (value == 'yes') {
            SystemNavigator.pop();
          }
        });
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: const Drawer(
          child: NavigationDrawerScreen(),
        ),
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: primaryColor,
          title: CustomText(
            text: "Shiv Shakti",
            textSize: 16.0.sp,
            textColor: Colors.white,
            textWeight: FontWeight.w800,
          ),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(10.0.h), // here the desired height
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0.sp),
                  child: Container(
                    width: size!.width,
                    height: 6.5.h,
                    color: Colors.white,
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          Container(
                            color: Colors.white,
                            width: size!.width * 0.2,
                            child: Padding(
                              padding: EdgeInsets.all(6.0.sp),
                              child: CustomText(
                                text: 'MH',
                                textSize: 16.0.sp,
                                textColor: Colors.grey[400],
                              ),
                            ),
                          ),
                          const VerticalDivider(
                            color: Colors.black,
                          ),
                          Container(
                            color: Colors.white,
                            width: size!.width * 0.2,
                            child: Padding(
                              padding: EdgeInsets.all(6.0.sp),
                              child: CustomText(
                                text: '04',
                                textSize: 16.0.sp,
                                textColor: Colors.grey[400],
                              ),
                            ),
                          ),
                          const VerticalDivider(
                            color: Colors.black,
                          ),
                          Expanded(
                            child: GetX<GetSyncData>(builder: (_) {
                              return TextField(
                                textAlign: TextAlign.center,
                                inputFormatters: <TextInputFormatter>[
                                  LengthLimitingTextInputFormatter(4),
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                keyboardType: TextInputType.number,
                                style: GoogleFonts.quicksand(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0.sp,
                                  letterSpacing: 10,
                                ),
                                cursorColor: primaryColor,
                                controller: _.number.value,
                                onChanged: (value) {
                                  syncDataInstance.getSearchedVehicleData(
                                      _.vehicleData, value);
                                },
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(left: 3.0.sp),
                                    border: InputBorder.none,
                                    hintText: "0000",
                                    hintStyle: GoogleFonts.quicksand(
                                      color: Colors.grey[400],
                                      fontSize: 16.0.sp,
                                      letterSpacing: 10,
                                    )),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ),
        body: SizedBox(
          height: size!.height * 0.8,
          width: size!.width,
          child: Padding(
            padding: EdgeInsets.only(top: 10.0.sp),
            child: GetX<GetSyncData>(
                init: GetSyncData(),
                builder: (_) {
                  return Stack(
                    children: [
                      _.searchDataLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ))
                          : _.vehicleData.isEmpty
                              ? Center(
                                  child: CustomText(
                                  text: 'Search Vehicle',
                                  textSize: 16.0.sp,
                                  textColor: Colors.grey[300],
                                ))
                              : ListView.builder(
                                  itemCount: _.vehicleData.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        showGeneralDialog(
                                          barrierColor:
                                              Colors.black.withOpacity(0.8),
                                          context: context,
                                          transitionBuilder:
                                              (context, a1, a2, widget) {
                                            return Transform.scale(
                                              scale: a1.value,
                                              child: Opacity(
                                                opacity: a1.value,
                                                child: ConfirmationDialog(
                                                  button1Color: primaryColor,
                                                  headingHeight: 0,
                                                  headingTextSize: 12.0.sp,
                                                  heading:
                                                      'Customer Name : ${_.vehicleData[index].customername}?',
                                                  text:
                                                      'Do you want to send Request for vehicle number : ${_.vehicleData[index].vehiclenumber}',
                                                  bodyTextHeight: 14.0.sp,
                                                  dialogHeight: 25.0.h,
                                                ),
                                              ),
                                            );
                                          },
                                          barrierDismissible: false,
                                          barrierLabel:
                                              MaterialLocalizations.of(context)
                                                  .modalBarrierDismissLabel,
                                          transitionDuration:
                                              const Duration(milliseconds: 200),
                                          pageBuilder: (context, animation1,
                                              animation2) {
                                            return Container();
                                          },
                                        ).then((value) {
                                          if (value == 'no') {
                                            return false;
                                          } else {
                                            seizeVehicleInstance
                                                .seizeVehicleApiCall(
                                                    _.vehicleData[index].id);
                                            showGeneralDialog(
                                              barrierColor:
                                                  Colors.black.withOpacity(0.8),
                                              context: context,
                                              barrierDismissible: false,
                                              barrierLabel:
                                                  MaterialLocalizations.of(
                                                          context)
                                                      .modalBarrierDismissLabel,
                                              transitionDuration:
                                                  const Duration(
                                                      milliseconds: 200),
                                              pageBuilder: (context, animation1,
                                                  animation2) {
                                                return ConfirmationDialog(
                                                  heading: 'Call Backup',
                                                  text: 'Make a call',
                                                  w: const BackupList(),
                                                  dialogHeight: 55.0.h,
                                                  okButton: 0,
                                                );
                                              },
                                            );
                                          }
                                        });
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0.sp),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Row(
                                            //   children: [
                                            //     CustomText(text: 'ID  :  ', textSize: 10.0.sp, /*textColor: Colors.grey[400],*/),
                                            //     CustomText(text: _.vehicleData[index].id, textSize: 12.0.sp, textColor: Colors.grey[800],),
                                            //   ],
                                            // ),
                                            // Row(
                                            //   children: [
                                            //     CustomText(text: 'Customer Name  :  ', textSize: 10.0.sp, /*textColor: Colors.grey[400],*/),
                                            //     SizedBox(
                                            //       width: size!.width*0.6,
                                            //         child: CustomText(text: _.vehicleData[index].customername, textAlign: TextAlign.start, textSize: 11.0.sp, textColor: Colors.grey[800],),
                                            //     ),
                                            //   ],
                                            // ),
                                            Row(
                                              children: [
                                                CustomText(
                                                  text: 'Vehicle No.  :  ',
                                                  textSize: 10.0
                                                      .sp, /*textColor: Colors.grey[400],*/
                                                ),
                                                CustomText(
                                                  text: _.vehicleData[index]
                                                      .vehiclenumber,
                                                  textSize: 16.0.sp,
                                                  textColor: Colors.grey[800],
                                                ),
                                              ],
                                            ),
                                            // Row(
                                            //   children: [
                                            //     CustomText(text: 'Vehicle  :  ', textSize: 10.0.sp, /*textColor: Colors.grey[400],*/),
                                            //     CustomText(text: _.vehicleData[index].make, textSize: 11.0.sp, textColor: Colors.grey[800],),
                                            //   ],
                                            // ),
                                            const Divider(
                                              color: Colors.black45,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}

class BackupList extends StatelessWidget {
  const BackupList({Key? key}) : super(key: key);
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: GetX<GetXBackup>(builder: (_) {
        return CupertinoScrollbar(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _.backupData.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: size!.width * 0.8,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0.sp, right: 10.0.sp),
                  child: Row(
                    children: [
                      CustomText(
                        text: _.backupData[index].scName,
                        textSize: 12.0.sp, /*textColor: Colors.grey[400],*/
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      IconButton(
                        onPressed: () {
                          _makePhoneCall(
                              'tel: ${_.backupData[index].scMobile}');
                        },
                        icon: const Icon(
                          Icons.phone,
                          color: secondaryColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          launchWebsite(
                              "whatsapp://send?phone=${_.backupData[index].scMobile}&text=${Uri.encodeFull('Hii')}");
                        },
                        icon: const Icon(
                          FontAwesomeIcons.whatsapp,
                          color: secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
