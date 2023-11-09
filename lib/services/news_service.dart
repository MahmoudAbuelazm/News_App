import 'package:dio/dio.dart';
import 'package:news/models/articlemodel.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);
  Future<List<Articlemodel>> getTopHeadLines({required String category}) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=d3d38aba134f4aa98fece923deb17f7e&category=$category');

      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<Articlemodel> articleslist = [];

      for (var article in articles) {
        Articlemodel articlemodel = Articlemodel.fromJson(
          article,
        );
        articleslist.add(articlemodel);
      }

      return articleslist;
    } catch (e) {
      return [];
    }
  }
}
