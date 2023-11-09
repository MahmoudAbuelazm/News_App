import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/categorycardmodel.dart';
import 'package:news/screens/catview.dart';

// ignore: must_be_immutable
class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final CategoryCardModel category;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CategoryView(
                category: category.text,
              );
            },
          ),
        );
      },
      child: Container(
        width: width * 0.45,
        height: height * 0.12,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage(category.image), fit: BoxFit.cover)),
        child: Center(
          child: Text(
            category.text,
            style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

final List<CategoryCardModel> categories = [
  CategoryCardModel(text: "Sports", image: "images/sports.avif"),
  CategoryCardModel(text: "Business", image: "images/business.avif"),
  CategoryCardModel(text: "Entertainment", image: "images/Entertainment.avif"),
  CategoryCardModel(text: "Health", image: "images/healthh.avif"),
  CategoryCardModel(text: "Science", image: "images/science.avif"),
  CategoryCardModel(text: "Technology", image: "images/technology.jpeg"),
];
