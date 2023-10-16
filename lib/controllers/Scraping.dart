import 'dart:convert';

import 'package:chaleno/chaleno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;



class Scraping extends GetxController{
  final url = Uri.parse('https://portal.kstu.edu.gh/students/login');
  Chaleno chaleno = Chaleno();
  String? token = '';
  final username = '052141590098';
  final password = 'Sammed0543220177';
 // var cookies = <String>[];
  var headers = <Map<String,String>>[].obs;


// @override
//   onInit(){
//     startUp();
// }
  Map<String, String> mapConverter(List<Map<String, String>> list) {
    return list.fold({}, (result, map) {
      result.addAll(map);
      return result;
    });
  }

  startUp() async {

    final loginResponse = await http.get(url);


    final loginDocument = parse(loginResponse.body);
    final tokenInput = loginDocument.querySelector('input[name=_token]');


    headers.clear();
    loginResponse.headers.forEach((name, values) {
      if(name.contains('set-cookie') == false ) return;
      headers.add({name : values});
    });
    print(headers);


    if(token == '') token = tokenInput!.attributes['value'];
    final loginFormData = {
      'username': username,
      'password': password,
      '_token': token,
    };
    var newHead= mapConverter(headers);
    final response = await http.post(url, body: json.encode(loginFormData),headers: newHead);
    if (response.statusCode == 302) {

      // convert list of map to map

      String? redirectUrl = response.headers['location'];
      print(newHead);
      //return response.headers.toString();
       if (redirectUrl != null) {
         var rdata = Uri.parse("${redirectUrl}");
         print(rdata);
         final response = await http.get(rdata,headers: newHead);
         print(response.statusCode);
         print(response.body);
         return response.body;
       }
    }
  }

}