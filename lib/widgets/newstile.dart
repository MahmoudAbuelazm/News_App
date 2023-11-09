import 'package:flutter/material.dart';
import 'package:news/models/articlemodel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Newstile extends StatefulWidget {
  const Newstile(
      {super.key,
      required this.height,
      required this.width,
      required this.articlemodell});
  final double height;
  final double width;
  final Articlemodel articlemodell;

  @override
  State<Newstile> createState() => _NewstileState();
}

class _NewstileState extends State<Newstile> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(widget.articlemodell.url),
      );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WebViewWidget(
            controller: controller,
          );
        }));
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              widget.articlemodell.image ??
                  "https://thumbs.dreamstime.com/z/news-woodn-dice-depicting-letters-bundle-small-newspapers-leaning-left-dice-34802664.jpg?w=1400",
              fit: BoxFit.cover,
              height: widget.height * 0.25,
              width: widget.width,
            ),
          ),
          SizedBox(
            height: widget.height * 0.01,
          ),
          Text(
            widget.articlemodell.title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: widget.height * 0.008,
          ),
          Text(
            widget.articlemodell.subtitle ?? "",
            maxLines: 2,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
