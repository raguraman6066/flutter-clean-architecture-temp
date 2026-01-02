// data/models/news_model.dart
import '../../domain/entity/news_entity.dart';

class NewsModel extends NewsEntity {
  NewsModel({required super.title, required super.description});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
