import 'dart:async';



import 'package:flutter/material.dart';



import '../sign_in/sign_in.dart';



class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: AssetImage('assets/wall.jpg'))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: initScreen(context),
      ),
    );
  }

  startTime() async {
    var duration = const Duration(seconds: 6);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) =>  SignInPage()));
  }

  initScreen(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return SafeArea(
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 10,end: 1),
                duration: Duration(seconds:3),
            builder: (BuildContext context, double height, _) {
              return Stack(
        children: [
      //         Container(
      //           width: double.infinity,
      //           height:height* MediaQuery.of(context).size.height*0.9,
      //           decoration: BoxDecoration(borderRadius: BorderRadius.only(
      //  bottomRight: Radius.circular(40)),color: Color.fromARGB(31, 53, 53, 53) ,
      //                   ),
      //         ),
      //         Container(
      //           width:  MediaQuery.of(context).size.width*0.98,
      //           height:height* MediaQuery.of(context).size.height*0.8,
      //           decoration: BoxDecoration(borderRadius: BorderRadius.only(
      //  bottomRight: Radius.circular(40)),color: Color.fromARGB(255, 73, 52, 45), boxShadow: [
      //                     BoxShadow(
      //                         color: Color.fromARGB(255, 73, 52, 45),
      //                         blurRadius: 10,
      //                         spreadRadius: 2,
      //                         offset: const Offset(0, 0))
      //                   ],
      //                   ),
      //         ),
      //         Container(
      //           width:  MediaQuery.of(context).size.width*0.96,
      //           height:height* MediaQuery.of(context).size.height*0.7,
      //           decoration: BoxDecoration(borderRadius: BorderRadius.only(
      //  bottomRight: Radius.circular(40)),color: Color.fromARGB(255, 251, 207, 191), boxShadow: [
      //                     BoxShadow(
      //                         color: Color.fromARGB(255, 251, 207, 191),
      //                         blurRadius: 10,
      //                         spreadRadius: 2,
      //                         offset: const Offset(0, 0))
      //                   ],
      //                   ),
      //         ),
      //         Container(
      //           width:  MediaQuery.of(context).size.width*0.94,
      //           height:height* MediaQuery.of(context).size.height*0.6,
      //           decoration: BoxDecoration(borderRadius: BorderRadius.only(
      //  bottomRight: Radius.circular(40)),color: kBoxBordercolor,boxShadow: [
      //                     BoxShadow(
      //                         color: kBoxBordercolor,
      //                         blurRadius: 10,
      //                         spreadRadius: 2,
      //                         offset: const Offset(0, 0))
      //                   ],
      //  ),
      //         ),
      //         Container(
      //           width:  MediaQuery.of(context).size.width*0.92,
      //           height:height* MediaQuery.of(context).size.height*0.5,
      //           decoration: BoxDecoration(borderRadius: BorderRadius.only(
      //  bottomRight: Radius.circular(40)),color: Color.fromARGB(255, 156, 237, 159), boxShadow: [
      //                     BoxShadow(
      //                         color: Color.fromARGB(255, 156, 237, 159),
      //                         blurRadius: 10,
      //                         spreadRadius: 2,
      //                         offset: const Offset(0, 0))
      //                   ],
      //                   ),
      //         ),
              Positioned(top: 300,left: -10,child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 10,end: 100),
                duration: Duration(seconds:3),
                builder: (BuildContext context, double height, _) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: height,
                    child: Image.asset('assets/studit.png'
),
                  );
                }
              ))
        
        ],
      );
            }
          ));
    });
  }
}
