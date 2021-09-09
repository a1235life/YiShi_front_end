import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'Application.dart';
import 'DioLogIntercepor.dart';

class Http{
  static Http get instance => _getInstance();

  static Http _instance;

  Dio _dio;

  Http._internal() {
    if (_dio == null) {
      _dio = _initDio();
    }
  }

  // 静态、同步、私有访问点
  static Http _getInstance() {
    if (_instance == null) {
      _instance = new Http._internal();
    }
    return _instance;
  }

  int _timeout = 30000;

  Dio _initDio() {
    Dio dio = Dio(BaseOptions(
      // connectTimeout: _timeout,
      // receiveTimeout: _timeout,
      baseUrl: Application.debug_base_url,
      responseType: ResponseType.plain,
      // contentType: 'application/json; charset=utf-8'

    ));

    dio.interceptors
//      ..add(KLogInterceptor())
      ..add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
      ));
    return dio;
  }


  Future<void> getDate(Map<String,dynamic> queryParameters,{Function(dynamic) onSuccessful,Function() onError})async{
    Response response = await _dio.get("article/getArticle",queryParameters: queryParameters);
    if(response.statusCode ==200){
      Map<String,dynamic> data = jsonDecode(response.data);
      onSuccessful(data);
    }else{
      if(onError !=null){
        onError();
      }
    }

  }

  Future<void> collection(Map<String,dynamic> queryParameters,{Function(dynamic) onSuccessful,Function() onError})async{
    Response response = await _dio.put("user/add_one_favorite",data: queryParameters);
    if(response.statusCode ==200){
     // Map<String,dynamic> data = jsonDecode(response.data);
      onSuccessful(response.data);
    }else{
      if(onError !=null){
        onError();
      }
    }

  }
}