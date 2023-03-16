import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:random_user_07/Screen/Home/Controller/home_controller.dart';
import 'package:get/get.dart';

class Logo_Page extends StatefulWidget {
  const Logo_Page({Key? key}) : super(key: key);

  @override
  State<Logo_Page> createState() => _Logo_PageState();
}

class _Logo_PageState extends State<Logo_Page> {

  Home_Controller l1 = Get.put(Home_Controller());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    l1.splashScreen();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.deepOrange,Colors.white,Colors.green,]
              )
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/animation/prof.json'),
                    SizedBox(height: 30,),
                    CircularProgressIndicator(
                      backgroundColor: Colors.orange,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
