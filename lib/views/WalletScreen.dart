
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:piggybank/components/GirdlineDashPattern.dart';
import 'package:piggybank/components/WalletWidget.dart';
import 'package:piggybank/data/controller.dart';
import 'package:piggybank/data/customtheme.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:pretty_qr_code/pretty_qr_code.dart';

class WalletScreen extends StatefulWidget {
  WalletScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<WalletScreen> {
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
                          InkWell(
                            onTap: () { 
                              
                             },
                            child: Icon(
                              Icons.delete_outline,
                              color: CustomTheme.negativeColor,
                              size: 34,
                            ),
                          ),
                        ],
                      )
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 220,
                          height: 220,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Center(child: PrettyQr(
                          data: _thisAddress,
                          size: 200,
                          
                        ),)
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: CustomTheme.backgroundWidget,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20
                      ),
                      child: Text('My Wallet', style: TextStyle(
                                    color: Colors.white.withAlpha(180),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                  )),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: CustomTheme.backgroundWidget,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20
                      ),
                      child: Text(_thisAddress, style: TextStyle(
                                    color: Colors.white.withAlpha(180),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                  )),
                    ),
                    SizedBox(height: 20,),
                    Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Clipboard.setData(ClipboardData(text: _thisAddress));
                                  Get.snackbar('Address copied!', 'Address copied to clipboard', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white);
                                },
                                child: Container(
                                  width: 140,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: CustomTheme.textHighlightColor,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        SizedBox(width: 20,),
                                        Icon(Icons.copy, color: Colors.white, size: 32,),
                                        SizedBox(width: 10,),
                                        Text(
                                        'Copy',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700
                                        )
                                      ),
                                      SizedBox(width: 10,)
                                      ],
                                    )
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
