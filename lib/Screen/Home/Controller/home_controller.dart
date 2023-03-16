import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:random_user_07/Screen/Home/Home_Model/HomeModel.dart';
// import 'package:random_user_07/Screen/Home/Home_Model/Home_Model.dart';

class Home_Controller extends GetxController
{
  Rx<HomeModel> user = HomeModel().obs;

  void splashScreen()
  {
    Timer(Duration(seconds: 3),(){
      Get.offNamed('home');
    });
  }

}