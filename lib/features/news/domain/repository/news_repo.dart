// domain/repository/news_repository.dart
import 'package:dartz/dartz.dart';

import '../entity/news_entity.dart';

abstract class NewsRepository {
  Future<Either<String, List<NewsEntity>>> getNews();
}
