import 'dart:convert';
import 'dart:math';

import 'package:exam/models/character.dart';
import 'package:exam/models/power.dart';
import 'package:exam/models/response.dart';
import 'package:http/http.dart'as http;

class ApiHelper{
  
  static Future<Response> getChataracter()async{
    var url = Uri.parse('https://psychonauts-api.herokuapp.com/api/characters');
    var response = await http.get(url);
    var body = response.body;

    if(response.statusCode >=400){
      return Response(isSuccess: false, message: body);
    }
    List<characters> list =[];
    var decodedJson = jsonDecode(body);
    if(decodedJson != null){
      for (var item in decodedJson) {
        list.add(characters.fromJson(item));
      }
    }
    return Response(isSuccess: true , result: list);
  }

  
}