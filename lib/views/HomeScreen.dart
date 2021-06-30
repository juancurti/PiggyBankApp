
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:piggybank/components/GirdlineDashPattern.dart';
import 'package:piggybank/components/WalletWidget.dart';
import 'package:piggybank/data/controller.dart';
import 'package:piggybank/data/customtheme.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'WalletAddScreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.currentIndex}) : super(key: key);
  final int currentIndex;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ControllerSession appController = Get.find();
  PageController _tokenDataPageController = PageController(initialPage: 0);
  int _tokenDataPage = 0;

  int _tokenDataIndex = 0;

  final List<String> _tokenDataRanges = [
                                              '24h',
                                              '1D',
                                              '1W',
                                              '1M',
                                              'ALL'
                                            ];

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

  Widget getTokenGraphic() {
    return GridlineDashPattern.withSampleData();
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
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                              Text('Token Data', style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                  ),),
                              Container(
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        _tokenDataPageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.easeOut);
                                        this.setState(() {
                                          _tokenDataPage = 0;
                                        });
                                      },
                                      child:  _tokenDataPage == 0 ? Icon(
                                        Icons.info,
                                        color: Colors.white,
                                        size: 28,
                                      ) : Icon(
                                        Icons.info,
                                        color: Colors.white.withAlpha(100),
                                        size: 28,
                                      ),
                                    ),
                                    SizedBox(width: 8,),
                                    InkWell(
                                      onTap: (){
                                        _tokenDataPageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.easeOut);
                                        this.setState(() {
                                          _tokenDataPage = 1;
                                        });
                                      },
                                      child: _tokenDataPage == 1 ? Icon(
                                        Icons.insert_chart_rounded,
                                        color: Colors.white,
                                        size: 28,
                                      ) : Icon(
                                        Icons.insert_chart_rounded,
                                        color: Colors.white.withAlpha(100),
                                        size: 28,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 16,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 240,
                            child: PageView(
                            controller: _tokenDataPageController,
                            onPageChanged: (newPage) {
                              this.setState(() {
                                _tokenDataPage = newPage;
                              });
                            },
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20,),
                                    Text('Token/USD', style: TextStyle(
                                      color: Colors.white.withAlpha(100),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                    )),
                                    SizedBox(height: 6,),
                                    Text('\$0.00000000', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600
                                    )),
                                    SizedBox(height: 20,),
                                    Text('Market Cap', style: TextStyle(
                                      color: Colors.white.withAlpha(100),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                    )),
                                    SizedBox(height: 6,),
                                    Text('\$0.00000000', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600
                                    )),
                                    SizedBox(height: 20,),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20,),
                                    Text('24h Volume', style: TextStyle(
                                      color: Colors.white.withAlpha(100),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                    )),
                                    SizedBox(height: 6,),
                                    Text('\$0.00000000', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600
                                    )),
                                    SizedBox(height: 20,),
                                    Text('Current Price', style: TextStyle(
                                      color: Colors.white.withAlpha(100),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                    )),
                                    SizedBox(height: 6,),
                                    Text('\$0.00000000', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600
                                    )),
                                    SizedBox(height: 20,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16,),
                          Text('Liquidity', style: TextStyle(
                                    color: Colors.white.withAlpha(100),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400
                                  )),
                                  SizedBox(height: 6,),
                            RichText(text: TextSpan(
                            style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400
                                  ),
                                  children: [
                                    TextSpan(text: 'PIGGY\'s liquidity backs '),
                                    TextSpan(text: '16.67%', style: TextStyle(color: CustomTheme.textHighlightColor, fontSize: 16)),
                                    
                                    TextSpan(text: ' of the marketcap'),
                                  ]
                          )),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 200 * 0.8,
                                      child: Stack(
                                        children: [
                                          getTokenGraphic(),
                                          Positioned(
                                            top: 30,
                                            left: 10,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                 Text('0000.0000', style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600
                                                ),),
                                                Text('00:00', style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600
                                                ),),
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ),
                                    SizedBox(height: 200 * 0.1,),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 200 * 0.3,
                                      child: Center(
                                        child: Container(
                                          width: MediaQuery.of(context).size.width * 0.7,
                                          height: (200 * 0.3) * 0.7,
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(56, 56, 56, 1),
                                            borderRadius: BorderRadius.circular(((200 * 0.3) * 0.7) * 0.5)
                                          ),
                                          child: Stack(children: [
                                            AnimatedContainer(
                                              duration: Duration(milliseconds: 500),
                                              curve: Curves.easeOut,
                                              margin: EdgeInsets.only(
                                                left: ((MediaQuery.of(context).size.width * 0.7) / 5) * _tokenDataIndex
                                              ),
                                              width: (MediaQuery.of(context).size.width * 0.7) / 5,
                                                  height: (200 * 0.3) * 0.7,
                                                  decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(((200 * 0.3) * 0.7) * 0.5),
                                                  color: CustomTheme.textHighlightColor
                                                  ),
                                            ),
                                            Row(
                                              children: _tokenDataRanges.map((e) => InkWell(
                                                onTap: () {
                                                  this.setState(() {
                                                    _tokenDataIndex = _tokenDataRanges.indexOf(e);
                                                  });
                                                },
                                                child: Container(
                                                  width: (MediaQuery.of(context).size.width * 0.7) / 5,
                                                  height: (200 * 0.3) * 0.7,
                                                  child: Center(
                                                    child: Text(
                                                      e, 
                                                      style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w600
                                                    ),
                                                    ),
                                                  ),
                                                )
                                              )).toList(),
                                            ),
                                          ],)
                                        )
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          )
                        ],
                      )
                    ),
                    SizedBox(height: 60,)
                  ],
                )
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 70.0 + (Platform.isIOS ? 40 : 0),
                padding: EdgeInsets.only(
                  bottom: Platform.isIOS ? 40 : 0
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                  )
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){},
                        child: Container(
                          width: MediaQuery.of(context).size.width / 5,
                          height: 50,
                          child: Center(
                            child: Container(
                              height: 40,
                              width: (MediaQuery.of(context).size.width / 5) * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: CustomTheme.textHighlightColor
                              ),
                              child: Icon(
                                Icons.home_outlined,
                                color: Colors.white,
                                size: 36,
                              ),
                            )
                          ),
                        )
                      ),
                      InkWell(
                        onTap: (){
                          Get.to(WalletAddScreen(), curve: Curves.easeOut, duration: Duration(milliseconds: 500), transition: Transition.downToUp);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 5,
                          height: 50,
                          child: Center(
                            child: Container(
                              height: 40,
                              width: (MediaQuery.of(context).size.width / 5) * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                // color: CustomTheme.textHighlightColor
                              ),
                              child: Icon(
                                Icons.add_circle,
                                color: Colors.white,
                                size: 32,
                              ),
                            )
                          ),
                        )
                      ),
                      InkWell(
                        onTap: (){
                          showModalBottomSheet(context: context, 
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          builder: (context) {
                            return Container(
                              height: 700,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(34, 34, 34, 1),
                                
                              ),
                              child: Column(
                                
                              children: [
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                                      'Buy or Swap', 
                                                      style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w600
                                                    ),
                                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Icon(Icons.close, color: Colors.white, size: 32),
                                    )
                                  ],
                                ),
                                SizedBox(height: 20,),
                                InkWell(
                                  onTap: (){},
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(40)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(width: 20,),
                                            Container(
                                              width: 50,
                                              height: 50,
                                              child: Image.asset('assets/swap_vertical_circle.png')
                                            ),
                                            SizedBox(width: 10,),
                                            Text(
                                                      'Exchange', 
                                                      style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w600
                                                    ),
                                                    ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.arrow_forward_sharp, color: Colors.black87, size: 32),
                                            SizedBox(width: 20,)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                InkWell(
                                  onTap: (){},
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(40)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(width: 20,),
                                            Container(
                                              width: 40,
                                              height: 40,
                                              child: Image.asset('assets/1inch-1inch-logo.png')
                                            ),
                                            SizedBox(width: 20,),
                                            Text(
                                                      '1Inch', 
                                                      style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w600
                                                    ),
                                                    ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.arrow_forward_sharp, color: Colors.black87, size: 32),
                                            SizedBox(width: 20,)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                InkWell(
                                  onTap: (){},
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(40)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(width: 20,),
                                            Container(
                                              width: 40,
                                              height: 40,
                                              child: Image.asset('assets/pancakeswap-cake-logo.png')
                                            ),
                                            SizedBox(width: 20,),
                                            Text(
                                                      'Pancake', 
                                                      style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w600
                                                    ),
                                                    ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.arrow_forward_sharp, color: Colors.black87, size: 32),
                                            SizedBox(width: 20,)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                                      ],
                                                    )
                            );
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 5,
                          height: 50,
                          child: Center(
                            child: Container(
                              height: 40,
                              width: (MediaQuery.of(context).size.width / 5) * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                // color: CustomTheme.textHighlightColor
                              ),
                              child: Icon(
                                Icons.attach_money_outlined,
                                color: Colors.white,
                                size: 32,
                              ),
                            )
                          ),
                        )
                      ),
                      InkWell(
                        onTap: (){
                          showModalBottomSheet(context: context, 
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          builder: (context) {
                            return Container(
                              height: 700,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(34, 34, 34, 1),
                                
                              ),
                              child: Column(
                                
                              children: [
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                                      'Follow', 
                                                      style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w600
                                                    ),
                                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Icon(Icons.close, color: Colors.white, size: 32),
                                    )
                                  ],
                                ),
                                SizedBox(height: 20,),
                                InkWell(
                                  onTap: (){},
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: CustomTheme.textHighlightColor,
                                      borderRadius: BorderRadius.circular(40)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(width: 20,),
                                            Container(
                                              width: 30,
                                              height: 30,
                                              child: Image.asset('assets/iconmonstr-telegram-1.png')
                                            ),
                                            SizedBox(width: 20,),
                                            Text(
                                                      'Telegram', 
                                                      style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w600
                                                    ),
                                                    ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.arrow_forward_sharp, color: Colors.white, size: 32),
                                            SizedBox(width: 20,)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),


                                SizedBox(height: 20,),
                                InkWell(
                                  onTap: (){},
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: CustomTheme.textHighlightColor,
                                      borderRadius: BorderRadius.circular(40)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(width: 20,),
                                            Container(
                                              width: 30,
                                              height: 30,
                                              child: Image.asset('assets/Discord-Logo-White.png')
                                            ),
                                            SizedBox(width: 20,),
                                            Text(
                                                      'Discord', 
                                                      style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w600
                                                    ),
                                                    ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.arrow_forward_sharp, color: Colors.white, size: 32),
                                            SizedBox(width: 20,)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(height: 20,),
                                InkWell(
                                  onTap: (){},
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: CustomTheme.textHighlightColor,
                                      borderRadius: BorderRadius.circular(40)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(width: 20,),
                                            Container(
                                              width: 30,
                                              height: 30,
                                              child: Image.asset('assets/iconmonstr-twitter-1.png')
                                            ),
                                            SizedBox(width: 20,),
                                            Text(
                                                      'Twitter', 
                                                      style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w600
                                                    ),
                                                    ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.arrow_forward_sharp, color: Colors.white, size: 32),
                                            SizedBox(width: 20,)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(height: 20,),
                                InkWell(
                                  onTap: (){},
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: CustomTheme.textHighlightColor,
                                      borderRadius: BorderRadius.circular(40)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(width: 20,),
                                            Container(
                                              width: 30,
                                              height: 30,
                                              child: Image.asset('assets/iconmonstr-instagram-11.png')
                                            ),
                                            SizedBox(width: 20,),
                                            Text(
                                                      'Instagram', 
                                                      style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w600
                                                    ),
                                                    ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.arrow_forward_sharp, color: Colors.white, size: 32),
                                            SizedBox(width: 20,)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(height: 20,),
                                InkWell(
                                  onTap: (){},
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: CustomTheme.textHighlightColor,
                                      borderRadius: BorderRadius.circular(40)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(width: 20,),
                                            Container(
                                              width: 30,
                                              height: 30,
                                              child: Image.asset('assets/iconmonstr-globe-4.png')
                                            ),
                                            SizedBox(width: 20,),
                                            Text(
                                                      'Website', 
                                                      style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w600
                                                    ),
                                                    ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.arrow_forward_sharp, color: Colors.white, size: 32),
                                            SizedBox(width: 20,)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                                      ],
                                                    )
                            );
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 5,
                          height: 50,
                          child: Center(
                            child: Container(
                              height: 40,
                              width: (MediaQuery.of(context).size.width / 5) * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                // color: CustomTheme.textHighlightColor
                              ),
                              child: Icon(
                                Icons.verified_user,
                                color: Colors.white,
                                size: 30,
                              ),
                            )
                          ),
                        )
                      ),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          width: MediaQuery.of(context).size.width / 5,
                          height: 50,
                          child: Center(
                            child: Container(
                              height: 40,
                              width: (MediaQuery.of(context).size.width / 5) * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                // color: CustomTheme.textHighlightColor
                              ),
                              child: Icon(
                                Icons.more_vert,
                                color: Colors.white,
                                size: 32,
                              ),
                            )
                          ),
                        )
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
