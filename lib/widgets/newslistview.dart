import 'package:flutter/material.dart';
import 'package:news/models/articlemodel.dart';
import 'package:news/widgets/newstile.dart';

// ignore: must_be_immutable
class NwesListView extends StatelessWidget {
  bool isLoading = true;
  final double height;
  final double width;
  final List<Articlemodel> articles;

  NwesListView({
    super.key,
    required this.height,
    required this.width,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    //List<articlemodel> articles=await NewsService(Dio()).getnews();
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: //,
            articles.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15, left: 15, top: 20.0),
            child: Newstile(
              height: height,
              width: width,
              articlemodell: articles[index],
            ),
          );
        },
      ),
    );
  }
}
