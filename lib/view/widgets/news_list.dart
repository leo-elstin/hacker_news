import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_news/bloc/details/news_details_bloc.dart';
import 'package:hacker_news/bloc/search/search_bloc.dart';
import 'package:hacker_news/model/data_model/news.dart';
import 'package:hacker_news/view/widgets/details_page.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (prv, crr) {
        return crr is Searching || crr is Searched;
      },
      builder: (context, state) {
        if (state is Searched) {
          return Container(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: state.news.length,
              itemBuilder: (context, index) {
                News news = state.news[index];
                return ListTile(
                  onTap: () {
                    openDetails(news.id);
                  },
                  title: Text('${news.title}'),
                  subtitle: Text(
                    '${news.author} | ${news.commentsCount} Comments',
                  ),
                );
              },
            ),
          );
        }

        if (state is Searching) {
          return Center(
            child: SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(),
            ),
          );
        }

        return Offstage();
      },
    );
  }


  /// method to invoke the GetDetails bloc and create navigation
  /// based on [id] of the news object
  void openDetails(String id) {
    BlocProvider.of<NewsDetailsBloc>(context).add(GetDetails(id));
    // open the NewsDetails page
    Navigator.pushNamed(context, NewsDetails.route);
  }
}
