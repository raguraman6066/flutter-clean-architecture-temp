import 'package:cleantemplate/features/news/domain/entity/news_entity.dart';
import 'package:cleantemplate/features/news/domain/repository/news_repo.dart';
import 'package:dartz/dartz.dart';

class GetNewsUseCase {
  final NewsRepository repository;

  GetNewsUseCase(this.repository);

  Future<Either<String, List<NewsEntity>>> call() {
    return repository.getNews();
  }
}
