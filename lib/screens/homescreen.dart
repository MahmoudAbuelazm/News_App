import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/widgets/axisscrollwidgets.dart';
import 'package:news/widgets/newslistviewbuilder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('News ',
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.black)),
              Text('Cloud',
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: const Color.fromARGB(255, 255, 203, 59))),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: AxisScrollWidgets(height: height),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: height * 0.03,
                ),
              ),
              NewsListViewBuilder(height: height, width: width, category: 'general'),
            ],
          ),
          // child: Column(
          //   children: [
          //     axisscrollwidgets(height: height),
          //     SizedBox(
          //       height: height * 0.03,
          //     ),
          //     newslistview(height: height, width: width),
          //   ],
          // ),
        ));
  }
}
