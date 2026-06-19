import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkClient{
  Future<dynamic>get(String url)async{
    try{
      final response=await http.get(Uri.parse(url));
      if(response.statusCode==200){
        return json.decode(response.body);
      }else{
        throw Exception("Failed to load data : ${response.statusCode}");
      }

    }catch (e){
      throw Exception("Error $e");
    }

  }
}