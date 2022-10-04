import 'package:dio/dio.dart';
import 'package:weather_app/constants/constants.dart';

class ApiServices {
  static Dio dio = Dio();
  static initDio() {
    dio = Dio(BaseOptions(baseUrl: baseUrl, receiveDataWhenStatusError: true));
  }

  static Future<Response> getData(
      {required String url}) {
    return dio.get(url);
  }
}
