
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:piggybank/components/WalletWidget.dart';
import 'package:piggybank/data/controller.dart';
import 'package:piggybank/data/customtheme.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.currentIndex}) : super(key: key);
  final int currentIndex;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ControllerSession appController = Get.find();
  int currentIndex = 0;
  
  @override
  void initState() {
    super.initState();

    if (widget.currentIndex > 0) {
      this.setState(() {
        currentIndex = widget.currentIndex;
      });
    }
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
                  vertical: 30,
                  horizontal: 20
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20
                      ),
                      child: Text('PIGGYBank', style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600
                        ),)
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 20
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 280,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          InkWell(
                            onTap: (){},
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 10
                              ),
                              height: MediaQuery.of(context).size.height,
                              width: 60,
                              decoration: BoxDecoration(
                                color: CustomTheme.backgroundWidget,
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              ),
                            )
                          ),
                          WalletWidget(),
                          WalletWidget(),
                          WalletWidget(),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: CustomTheme.backgroundWidget,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 20
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage('assets/fire_copy.png'), fit: BoxFit.fitHeight)
                            ),
                          ),
                          Text('00,000,000,000,000,000', style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700
                                  )),
                                  SizedBox(width: 10,),
                          Text('Burned', style: TextStyle(
                                    color: Colors.white.withAlpha(100),
                                    fontSize: 14,
                                    height: 1,
                                    fontWeight: FontWeight.w400
                                  )),
                        ],
                      )
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
                        horizontal: 30
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Rewards', style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                  )),
                                  SizedBox(height: 6,),
                          RichText(text: TextSpan(
                            style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400
                                  ),
                                  children: [
                                    TextSpan(text: 'In '),
                                    TextSpan(text: '00 DAYS', style: TextStyle(color: CustomTheme.textHighlightColor, fontWeight: FontWeight.w600)),
                                    TextSpan(text: ', you will gain '),
                                    TextSpan(text: '00 Tokens', style: TextStyle(color: CustomTheme.textHighlightColor, fontWeight: FontWeight.w600)),
                                    
                                  ]
                          ))
                        ],
                      )
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
                        horizontal: 30
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(text: TextSpan(
                            style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                  ),
                                  children: [
                                    TextSpan(text: 'Token Rating '),
                                    TextSpan(text: '(via Coingecko)', style: TextStyle(color: Colors.white.withAlpha(100), fontSize: 16, fontWeight: FontWeight.w300)),
                                    
                                  ]
                          )),
                          Text('92.88%', style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                  ),)
                            ],
                          ),
                                  SizedBox(height: 16,),
                          Container(
                            height: 16,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color.fromRGBO(67, 67, 67, 1)
                            ),
                            child: Container(
                                  height: 16,
                                  margin: EdgeInsets.only(
                                    right: MediaQuery.of(context).size.width * (1 - 0.9288)
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          CustomTheme.backgroundWidget2,
                                          CustomTheme.backgroundWidget2Bis,
                                        ],
                                      ),
                                  ),
                                )
                          ),
                          SizedBox(height: 16,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 120,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: CustomTheme.buttonColor,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Center(
                                    child: Text(
                                      'VOTE',
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
                          )
                        ],
                      )
                    )
                  ],
                )
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(
                  color: CustomTheme.backgroundBis
                ),
              ),
            )
          ],
        ));
  }
}
