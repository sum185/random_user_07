import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_user_07/Screen/Home/Home_Page/home_page.dart';
import 'package:random_user_07/Screen/Logo_Page/logo_page.dart';
import 'package:sizer/sizer.dart';
void main()
{
  runApp(
    Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        initialRoute: '/',
        routes: {
          '/':(p0) => const Logo_Page(),
          'home':(p0) => const Home_Page(),
        },
      );
    },)
  );
}