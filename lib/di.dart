import 'package:get_it/get_it.dart';
import 'features/news/data/datasource/news_remote_source.dart';
import 'features/news/data/repository/news_repo_imp.dart';
import 'features/news/domain/repository/news_repo.dart';
import 'features/news/domain/usecase/get_news_usecase.dart';
import 'features/news/presentation/bloc/news/news_bloc.dart';

final sl = GetIt.instance;

void initDi() {
  sl.registerLazySingleton<NewsRemoteDataSource>(() => NewsRemoteDataSource());
  sl.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(sl<NewsRemoteDataSource>()),
  );
  sl.registerLazySingleton<GetNewsUseCase>(
    () => GetNewsUseCase(sl<NewsRepository>()),
  );
  sl.registerFactory<NewsBloc>(() => NewsBloc(sl<GetNewsUseCase>()));
}
