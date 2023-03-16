import 'package:flutter/material.dart';
import 'package:random_user_07/Screen/Home/Controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:random_user_07/Screen/Home/Home_Model/HomeModel.dart';
// import 'package:random_user_07/Screen/Home/Home_Model/Home_Model.dart';
import 'package:random_user_07/Utils/api_helper.dart';
import 'package:sizer/sizer.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  Home_Controller h1 = Get.put(Home_Controller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
         appBar: AppBar(
           backgroundColor: Colors.blue,
           title: Text("Random User",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
           centerTitle: true,
           actions: [
             IconButton(onPressed: ()async{
               h1.user.value = (await Api_Helper.api_helper.userData())!;
             }, icon: Icon(Icons.refresh,color: Colors.white,))
           ],
         ),
          body: FutureBuilder<HomeModel?>(
            future: Api_Helper.api_helper.userData(),
            builder: (context, snapshot) {
              if(snapshot.hasError){
                return Center(child: Text("${snapshot.error}"));
              }
              else if(snapshot.hasData){
                HomeModel? homeModel = snapshot.data;
                h1.user.value = homeModel!;
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Obx(
                            () => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 1.h,),
                              CircleAvatar(
                                maxRadius: 60,
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage("${h1.user.value.results![0].picture!.large}"),
                              ),
                              SizedBox(height: 3.h,),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Text("Name :",style: TextStyle(color: Colors.black,fontSize: 18.sp),),
                                    SizedBox(width: 4.w,),
                                    Text("${h1.user.value.results![0].name!.title}.",style: TextStyle(color: Colors.black,fontSize: 15.sp),),
                                    SizedBox(width: 2.w,),
                                    Text("${h1.user.value.results![0].name!.first}",style: TextStyle(color: Colors.black,fontSize: 15.sp),),
                                    SizedBox(width: 2.w,),
                                    Text("${h1.user.value.results![0].name!.last}",style: TextStyle(color: Colors.black,fontSize: 15.sp),),
                                    SizedBox(width: 100.w,),
                                  ],
                                ),
                              ),
                              SizedBox(height: 2.h,),
                              Row(
                                children: [
                                  Text("Age    :",style: TextStyle(color: Colors.black,fontSize: 18.sp)),
                                  SizedBox(width: 4.w,),
                                  Text("${h1.user.value.results![0].dob!.age}",style: TextStyle(color: Colors.black,fontSize: 15.sp),),
                                ],
                              ),
                              SizedBox(height: 2.h,),
                              Row(
                                children: [
                                  Text("DOB   :",style: TextStyle(color: Colors.black,fontSize: 18.sp)),
                                  SizedBox(width: 4.w,),
                                  Text("${h1.user.value.results![0].dob!.date}",style: TextStyle(color: Colors.black,fontSize: 15.sp),),
                                ],
                              ),
                              SizedBox(height: 2.h,),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Text("Email :",style: TextStyle(color: Colors.black,fontSize: 18.sp)),
                                    SizedBox(width: 4.w,),
                                    Text("${h1.user.value.results![0].email}",style: TextStyle(color: Colors.black,fontSize: 15.sp),),
                                    SizedBox(width: 50.w,)
                                  ],
                                ),
                              ),
                              SizedBox(height: 2.h,),
                              Row(
                                children: [
                                  Text("Phone:",style: TextStyle(color: Colors.black,fontSize: 18.sp)),
                                  SizedBox(width: 4.w,),
                                  Text("${h1.user.value.results![0].phone}",style: TextStyle(color: Colors.black,fontSize: 15.sp),),
                                ],
                              ),
                              SizedBox(height: 2.h,),
                              Row(
                                children: [
                                  Text("Cell    :",style: TextStyle(color: Colors.black,fontSize: 18.sp)),
                                  SizedBox(width: 4.w,),
                                  Text("${h1.user.value.results![0].cell}",style: TextStyle(color: Colors.black,fontSize: 15.sp),),
                                ],
                              ),
                              SizedBox(height: 2.h,),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Text("Add   :",style: TextStyle(color: Colors.black,fontSize: 18.sp)),
                                    SizedBox(width: 4.w,),
                                    Text(
                                      "${h1.user.value.results![0].location!.timezone!.description}",style: TextStyle(color: Colors.black,fontSize: 15.sp),),
                                    SizedBox(width: 60.w,)
                                  ],
                                ),
                              ),
                              SizedBox(height: 2.h,),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Text("Pin :",style: TextStyle(color: Colors.black,fontSize: 18.sp)),
                                    SizedBox(width: 4.w,),
                                    SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text("${h1.user.value.results![0].location!.postcode}",style: TextStyle(color: Colors.black,fontSize: 15.sp),)),
                                    SizedBox(width: 100.w,)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
              return Center(child: CircularProgressIndicator(),);
            },
          ),
        )
    );
  }
}
