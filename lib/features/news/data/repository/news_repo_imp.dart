// data/repository/news_repository_impl.dart
import 'package:cleantemplate/features/news/data/datasource/news_remote_source.dart';
import 'package:cleantemplate/features/news/domain/repository/news_repo.dart';
import 'package:dartz/dartz.dart';
import '../../domain/entity/news_entity.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource dataSource;

  NewsRepositoryImpl(this.dataSource);

  @override
  Future<Either<String, List<NewsEntity>>> getNews() async {
    try {
      final result = await dataSource.fetchNews();
      return Right(result);
    } catch (e) {
      return Left("Failed to fetch news");
    }
  }
}
