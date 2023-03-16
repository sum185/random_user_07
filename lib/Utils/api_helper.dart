import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:random_user_07/Screen/Home/Home_Model/HomeModel.dart';
// import 'package:random_user_07/Screen/Home/Home_Model/Home_Model.dart';

class Api_Helper
{
  Api_Helper._();

  static Api_Helper api_helper = Api_Helper._();

  // Get Random User Api.....

Future<HomeModel?> userData()
async{

  //print("========guwgfegfe");
  String apiLink = "https://randomuser.me/api/";
  var response = await http.get(Uri.parse(apiLink));
  //print("============ ${response.statusCode}");
  if(response.statusCode==200){
    dynamic json = jsonDecode(response.body);
    return HomeModel.fromJson(json);
  }
  else {
    return null;
  }
}
}