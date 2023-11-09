import 'package:flutter/material.dart';
import 'package:news/widgets/categorycard.dart';

class AxisScrollWidgets extends StatelessWidget {
  const AxisScrollWidgets({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * .12,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 4.0,
            ),
            child: CategoryCard(
              category: categories[index],
            ),
          );
        },
      ),
    );
  }
}
