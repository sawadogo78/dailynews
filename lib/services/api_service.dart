// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dailynews/models/news_models.dart';
import 'package:dailynews/services/api.dart';
import 'package:dio/dio.dart';

class APIService {
  final API api = API();
  final Dio dio = Dio();

// 1 ere façon de faire
  // Future<List<ArticleModel>> fetchNews() async {
  //   final Response response = await dio.get(
  //       "https://newsapi.org/v2/top-headlines?country=us&apiKey=${api.apikey}");
  //   if (response.statusCode == 200) {
  //     final _data = response.data;
  //     List<ArticleModel> articles =
  //         _data['articles'].map<ArticleModel>((articleJson) {
  //       return ArticleModel.fromJson(articleJson);
  //     }).toList();
  //     return articles;
  //   } else {
  //     throw response;
  //   }
  // }
// Deuxième façon de faire
  Future<Response> getData(
      {required String path, Map<String, dynamic>? params}) async {
    Map<String, dynamic> queryParameters = {
      'apikey': api.apikey,
    };
    if (params != null) {
      queryParameters.addAll(params);
    }
    final String url = api.baseUrl + path;
    final Response response =
        await dio.get(url, queryParameters: queryParameters);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw response;
    }
  }

  Future<List<ArticleModel>> fetchNews() async {
    final Response response = await getData(
      path: '/v2/top-headlines',
      params: {
        'country': 'us',
      },
    );
    if (response.statusCode == 200) {
      final _data = response.data;
      List<ArticleModel> news =
          _data['articles'].map<ArticleModel>((articleJson) {
        return ArticleModel.fromJson(articleJson);
      }).toList();
      return news;
    } else {
      throw response;
    }
  }
}
