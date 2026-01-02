// data/datasource/news_remote_datasource.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_model.dart';

class NewsRemoteDataSource {
  Future<List<NewsModel>> fetchNews() async {
    final response = await http.get(
      Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=6a3bb6db4ad94444b91c8ba494f15f1c',
      ),
    );

    final data = json.decode(response.body);
    final List articles = data['articles'];

    return articles.map((e) => NewsModel.fromJson(e)).toList();
  }
}
