import 'package:cleantemplate/di.dart';
import 'package:cleantemplate/features/news/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/news/data/datasource/news_remote_source.dart';
import 'features/news/data/repository/news_repo_imp.dart';
import 'features/news/domain/usecase/get_news_usecase.dart';
import 'features/news/presentation/bloc/news/news_bloc.dart';

void main() {
  // final dataSource = NewsRemoteDataSource();
  // final repository = NewsRepositoryImpl(dataSource);
  // final useCase = GetNewsUseCase(repository);

  initDi();
  runApp(BlocProvider(create: (_) => sl<NewsBloc>(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: NewsHomePage());
  }
}
