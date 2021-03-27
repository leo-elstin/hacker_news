import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hacker_news/bloc/details/news_details_bloc.dart';
import 'package:hacker_news/model/data_model/news_details.dart';
import 'package:timeago/timeago.dart' as ago;

class NewsDetails extends StatefulWidget {
  static const route = '/news_details';

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: BlocBuilder<NewsDetailsBloc, NewsDetailsState>(
        builder: (context, state) {
          if (state is NewsDetailsFetched) {
            return SafeArea(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${state.detailsResponse.title}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Text('Author - ${state.detailsResponse.author}'),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 8),
                    //   child: Text(
                    //       '${ago.format(state.detailsResponse.createdAt)}'),
                    // ),
                    // Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Comments'),
                    ),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                          shrinkWrap: true,
                          itemCount: state.detailsResponse.children.length,
                          itemBuilder: (context, index) {
                            DetailsResponse resp =
                                state.detailsResponse.children[index];

                            if (resp.text == null) return Offstage();
                            return ListTile(
                              onTap: () {
                                // openDetails(resp.id.toString());
                              },
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('${resp.author ?? ''}'),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Html(
                                    data: '${resp.text ?? ''}',
                                  ),
                                ],
                              ),
                              subtitle: Text(
                                  '${ago.format(resp.createdAt)} | ${resp.children.length} Comments'),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state is FetchingDetails) {
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
      ),
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
