// presentation/pages/news_home_page.dart
import 'package:cleantemplate/features/news/presentation/bloc/news/news_bloc.dart';
import 'package:cleantemplate/features/news/presentation/bloc/news/news_event.dart';
import 'package:cleantemplate/features/news/presentation/bloc/news/news_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsHomePage extends StatelessWidget {
  const NewsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Top News")),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NewsLoaded) {
            return ListView.builder(
              itemCount: state.news.length,
              itemBuilder: (context, index) {
                final item = state.news[index];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.description),
                );
              },
            );
          } else if (state is NewsError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Trigger news fetch event
          context.read<NewsBloc>().add(FetchNewsEvent());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
