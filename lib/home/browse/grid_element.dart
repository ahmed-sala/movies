import 'package:flutter/material.dart';

class GridElement extends StatelessWidget {
  String movieCategory;
  String imgPath;

  GridElement({required this.movieCategory, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
            borderRadius:BorderRadius.circular(6),
            child: Image.asset(
          'assets/images/img_bg1.jpg',
          fit: BoxFit.cover,
        )),
        const Center(
            child: Text(
          'Action',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ))
      ],
    );
  }
}
