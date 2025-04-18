

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/screen/api_call_list/post_model.dart';
import 'package:http/http.dart' as http;

final postProvider = FutureProvider<List<PostModel>>((ref) async{

  try{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if(response.statusCode == 200){
      final List<dynamic> data = jsonDecode(response.body);
      List<PostModel> postList = data.map((item) => PostModel.fromJson(item)).toList();
      return postList;
    }else{
      throw "Something went wrong";
    }
  }catch(e){
    rethrow;
  }
});
