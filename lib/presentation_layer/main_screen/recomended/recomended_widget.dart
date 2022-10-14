import 'package:flutter/material.dart';

class RecomendedWidget extends StatefulWidget {
  @override
  State<RecomendedWidget> createState() => _RecomendedWidgetState();
}

class _RecomendedWidgetState extends State<RecomendedWidget> {
  bool isMarked=false;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          'assets/images/doraFilm.png',
          width: 97,
          height: 128,
        ),
        Positioned(
            left: size.width * 0.02,
            child: InkWell(
                onTap: () {
                  setState(() {
                    isMarked = !isMarked;
                  });
                },
                child: Image.asset(
                  isMarked
                      ? 'assets/images/bookmark_marked.png'
                      : 'assets/images/bookmark.png',
                  width: 20,
                ))),
      ],
    );
  }

}
