import 'package:dio/dio.dart';
import 'package:weather_app/shared/end_points.dart';
//weather now
//https://api.openweathermap.org/data/2.5/weather?q=cairo&appid=aa20c92653eb7ca34022a85e78dab92f
//weather last 5 days
//api.openweathermap.org/data/2.5/forecast?q=cairo&appid=aa20c92653eb7ca34022a85e78dab92f
class DioHelper{
 static late Dio  dio;
 static Init(){
   dio= Dio(BaseOptions(
       baseUrl: BASE_URL,
       receiveDataWhenStatusError: true,
   ));
 }
 static Future<Response> getData({
   required String url,
   dynamic query,
   String? token,
   String lang='en',
}){
   dio.options.headers={
     'lang':lang,
     'Content-Type':'application/json',
     'Authorization':token,
   };
    return dio.get(
        url,
        queryParameters: query,
    );
  }
 static Future<Response> putData({
   required String url,
   required dynamic data,
   dynamic query,
   String? token,
   String lang='en',
 }){
   dio.options.headers={
     'lang':lang,
     'Authorization':token,
     'Content-Type':'application/json',
   };
   return dio.post(
     url,
     queryParameters: query,
     data: data,
   );
 }
 static Future<Response> putUserUpdateData({
   required String url,
   required dynamic data,
   dynamic query,
   String? token,
   String lang='en',
 }){
   dio.options.headers={
     'lang':lang,
     'Authorization':token,
     'Content-Type':'application/json',
   };
   return dio.put(
     url,
     queryParameters: query,
     data: data,
   );
 }
 static Future<Response> deleteData({
   required String url,
   dynamic data,
   dynamic query,
   String? token,
   String lang='en',
 }){
   dio.options.headers={
     'lang':lang,
     'Authorization':token,
     'Content-Type':'application/json',
   };
   return dio.delete(
     url,
     data: data,
     queryParameters: query,
   );
 }

 static Future<Response> updateData({
   required String url,
   required dynamic data,
   dynamic query,
   String? token,
   String lang='en',
 }){
   dio.options.headers={
     'lang':lang,
     'Authorization':token,
     'Content-Type':'application/json',
   };
   return dio.put(
     url,
     queryParameters: query,
     data: data,
   );
 }
}