import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:namefeature/UI/home_page.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  startTime() async {
    var duration = const Duration(seconds: 7);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushAndRemoveUntil<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const Homepage(),
      ),
      (Route<dynamic> route) => false,
    );
  }

  @override
  void initState() {
     startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        decoration:   BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient:const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.1,
                0.4,
                0.6,
                0.9,
              ],
              colors: [
                Color(0xff7df8fa),
                Color(0xffb9cafa),
                Color(0xffe6b6fb),
                Color(0xfff2b0fb),
              ],
            )
        ),
        child: Stack(
          children: [

            Center(child: Image.asset('assets/images/image 1.png',
            height: 300,
              width: 300,

            )),

            Positioned(
                left: 20.0,
                right: 20.0,
                bottom: 40.0,
                child:
                LoadingAnimationWidget.inkDrop(size: 40, color: Colors.white))
          ],
        ),
      ),


    );
  }
}
