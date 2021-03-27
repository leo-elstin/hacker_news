import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_news/bloc/details/news_details_bloc.dart';
import 'package:hacker_news/bloc/search/search_bloc.dart';
import 'package:hacker_news/model/service/news_service.dart';
import 'package:hacker_news/view/home.dart';
import 'package:hacker_news/view/widgets/details_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchBloc>(
          lazy: true,
          create: (context) => SearchBloc(
            service: NewsService(),
          ),
        ),
        BlocProvider<NewsDetailsBloc>(
          create: (context) => NewsDetailsBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Hacker News',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
        routes: {
          NewsDetails.route: (_) => NewsDetails(),
        },
      ),
    );
  }
}
