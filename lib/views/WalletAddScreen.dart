
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
import 'package:qr_code_scanner/qr_code_scanner.dart';

class WalletAddScreen extends StatefulWidget {
  WalletAddScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<WalletAddScreen> {
  final ControllerSession appController = Get.find();
  TextEditingController walletNameController = TextEditingController();
  TextEditingController walletAddressController = TextEditingController();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode result;
  QRViewController controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }
  
  @override
  void initState() {
    super.initState();

  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      walletAddressController.text = scanData.code.replaceAll('ethereum:', '');
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
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
                            onTap: () { Get.off(HomeScreen(currentIndex: 0,)); },
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
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.width * 0.85,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(31, 31, 32, 1),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(child: Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            height: MediaQuery.of(context).size.width * 0.75,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromRGBO(94, 94, 94, 1),
                                width: 2
                              ),
                              color: Color.fromRGBO(31, 31, 32, 1),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: QRView(
                              key: qrKey,
                              onQRViewCreated: _onQRViewCreated,
                            ),
                          ))
                        )
                      ],
                    ),
                    SizedBox(height: 40,),
                    Text('Simply scan your wallets QR code or enter the information manually below.', 
                    textAlign: TextAlign.center,
                    style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400
                                  )),
                    SizedBox(height: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Color.fromRGBO(60, 60, 60, 1)
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20
                      ),
                      child: Center(child: TextField(
                                          cursorColor: Colors.black,
                                          controller: walletNameController,
                                          autocorrect: false,
                                          onSubmitted: (str) {
                                           FocusScope.of(context).unfocus();
                                          },
                                          style: TextStyle(
                                              color: Colors.white,
                                          ),
                                          decoration: InputDecoration.collapsed(
                                              hintText: 'Enter Wallet Name',
                                              hintStyle: TextStyle(
                                                  color: Colors.white)),
                                        ),)
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Color.fromRGBO(60, 60, 60, 1)
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20
                      ),
                      child: Center(child: TextField(
                                          cursorColor: Colors.black,
                                          controller: walletAddressController,
                                          autocorrect: false,
                                          onSubmitted: (str) {
                                           FocusScope.of(context).unfocus();
                                          },
                                          style: TextStyle(
                                              color: Colors.white,
                                          ),
                                          decoration: InputDecoration.collapsed(
                                              hintText: 'Enter Your Wallet Address',
                                              hintStyle: TextStyle(
                                                  color: Colors.white)),
                                        ),)
                    ),
                    SizedBox(height: 40,),
                    Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.dialog(Center(child: Material(
                                    type: MaterialType.transparency
                                    ,child: Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                            color: CustomTheme.positiveColor,
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
                              Text('SUCCESS', style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500
                                  )),
                            ],
                          ),
                        ),)));
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
                                        'Add Wallet',
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
