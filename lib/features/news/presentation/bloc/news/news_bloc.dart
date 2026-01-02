// presentation/bloc/news_bloc.dart

import 'package:cleantemplate/features/news/domain/usecase/get_news_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNewsUseCase getNewsUseCase;

  NewsBloc(this.getNewsUseCase) : super(NewsInitial()) {
    on<FetchNewsEvent>((event, emit) async {
      emit(NewsLoading());

      final result = await getNewsUseCase.call();

      result.fold(
        (error) => emit(NewsError(error)),
        (news) => emit(NewsLoaded(news)),
      );
    });
  }
}
