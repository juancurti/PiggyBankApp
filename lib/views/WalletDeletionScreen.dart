
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:piggybank/components/GirdlineDashPattern.dart';
import 'package:piggybank/components/WalletWidget.dart';
import 'package:piggybank/data/controller.dart';
import 'package:piggybank/data/customtheme.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:piggybank/views/HomeScreen.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class WalletDeletionScreen extends StatefulWidget {
  WalletDeletionScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<WalletDeletionScreen> {
  final ControllerSession appController = Get.find();
  String _thisAddress = '0x7286b5d154662F2caB38d9068450671f4Ea652ee';
  
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
            .copyWith(statusBarIconBrightness: Brightness.light));
    return Scaffold(
        backgroundColor:
            Colors.black,
        body: Stack(
          children: [
            Positioned(
              bottom: Platform.isIOS ? 40 : 0,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - (Platform.isIOS ? 40 : 0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      CustomTheme.background,
                      CustomTheme.backgroundBis,
                    ],
                  )
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 20
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(height: 40,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () { Get.back(); },
                            child: Icon(
                              Icons.arrow_back_ios_outlined,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          Text('Wallet Details', style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600
                          ),),
                          SizedBox(width: 20,)
                        ],
                      )
                    ),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(173, 41, 138, 1),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.check_circle_outline, 
                                color: Colors.white,
                                size: 120,
                              ),
                              SizedBox(height: 10,),
                              Text('DELETED', style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 40,),
                    Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: CustomTheme.textHighlightColor,
                                    borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Center(
                                    child: Text(
                                        'Connect Another Wallet?',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700
                                        )
                                      ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20,),
                    Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.off(HomeScreen(currentIndex: 0,));
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    // color: CustomTheme.textHighlightColor,
                                    borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Center(
                                    child: Text(
                                        'Go to Dashboard',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700
                                        )
                                      ),
                                  ),
                                ),
                              )
                            ],
                          ),
                    SizedBox(height: 60,)
                  ],
                )
              ),
            ),
          ],
        ));
  }
}
