

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:page_of_page/Services/post_services/post_model.dart';

class PostServices {


  final Dio _dio = Dio(BaseOptions(baseUrl:"https://jsonplaceholder.typicode.com/"));

  Future<List<PostModel>> getPosts() async {

    final response = await _dio.get("posts");

    if(response.statusCode == HttpStatus.ok){
      final postDatas = await response.data;

      if(postDatas is List){
        return  postDatas.map((e) => PostModel.fromJson(e)).toList();
      }
    }
    return [];
  }
}