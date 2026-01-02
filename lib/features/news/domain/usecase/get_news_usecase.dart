import 'package:cleantemplate/features/news/data/repository/news_repo_imp.dart';
import 'package:cleantemplate/features/news/domain/entity/news_entity.dart';
import 'package:dartz/dartz.dart';

class GetNewsUseCase {
  final NewsRepositoryImpl repository;

  GetNewsUseCase(this.repository);

  Future<Either<String, List<NewsEntity>>> call() {
    return repository.getNews();
  }
}
