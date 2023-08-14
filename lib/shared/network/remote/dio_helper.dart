import 'package:dio/dio.dart';

//url: https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=221241bdfaac4a7dbb28b3e0bfb04eae


class DioHelper {


  static Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://newsapi.org/",
      receiveDataWhenStatusError: true,
    ),
  );


  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
}) async
  {
    print("Did Enter getData from dio Helper%%%%%%%%%%%%%%%");
    return await dio.get(url, queryParameters: query,);
  }
}