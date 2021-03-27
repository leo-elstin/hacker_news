import 'package:flutter/material.dart';
import 'package:hacker_news/view/widgets/news_list.dart';
import 'package:hacker_news/view/widgets/search_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hacker News'),
        bottom: PreferredSize(
          child: SearchBar(),
          preferredSize: Size.fromHeight(40),
        ),
      ),
      body: NewsList(),
    );
  }
}
