import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news/models/articlemodel.dart';
import 'package:news/services/news_service.dart';
import 'package:news/widgets/newslistview.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder(
      {super.key,
      required this.height,
      required this.width,
      required this.category});

  final double height;
  final double width;
  final String category;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getTopHeadLines(
      category: widget.category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Articlemodel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NwesListView(
            height: widget.height,
            width: widget.width,
            articles: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Text("oops no news found")),
              ],
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: CircularProgressIndicator()),
              ],
            ),
          );
        }
      },
    );
  }
}
