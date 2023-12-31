import 'package:flutter/material.dart';
import 'package:news/widgets/newslistviewbuilder.dart';

class CategoryView extends StatelessWidget {
   CategoryView({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          NewsListViewBuilder(height: height, width: width, category: category),

        ],
      ) ,
    );
  }
}