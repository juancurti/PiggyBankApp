
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:piggybank/data/controller.dart';
import 'package:piggybank/data/customtheme.dart';
import 'package:piggybank/views/WalletScreen.dart';

class WalletWidget extends StatefulWidget {
  WalletWidget({Key key}) : super(key: key);

  @override
  _WidgetState createState() => _WidgetState();
}

class _WidgetState extends State<WalletWidget> {
  final ControllerSession appController = Get.find();
  int currentIndex = 0;
  
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
                            onTap: (){
                              Get.to(WalletScreen(), curve: Curves.easeOut, duration: Duration(milliseconds: 500), transition: Transition.downToUp);
                            },
                            child: Container(
                              width: (MediaQuery.of(context).size.width - 60) - 20,
                              height: 220,
                              margin: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 20
                              ),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withAlpha(100),
                                    blurRadius: 12.0,
                                    offset: new Offset(0.0, 0.0),
                                  ),
                                ],
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    CustomTheme.backgroundWidget2,
                                    CustomTheme.backgroundWidget2Bis,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Wallet Name', style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                  )),
                                  SizedBox(height: 10,),
                                  Text('Total Balance', style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400
                                  )),
                                  SizedBox(height: 5,),
                                  Text('0000.00000000', style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400
                                  )),
                                  Text('\$00,000 USD', style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400
                                  )),
                                  SizedBox(height: 15,),
                                  Text('Total Profit', style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400
                                  )),
                                  SizedBox(height: 5,),
                                  Text('\$000,000.000', style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400
                                  )),
                                  Text('Amount since last buy / sell', style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400
                                  )),
                                ],
                              ),
                            ),
                          );
  }
}
