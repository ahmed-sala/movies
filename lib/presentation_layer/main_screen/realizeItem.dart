import 'package:flutter/material.dart';
import 'package:movies_app/data_layer/model/Movies.dart';
import 'package:movies_app/presentation_layer/main_screen/details/DetailsMoreMovies.dart';

class RealizeItem extends StatefulWidget {
  Results? results;

  RealizeItem(this.results);

  @override
  State<RealizeItem> createState() => _RealizeItemState();
}

class _RealizeItemState extends State<RealizeItem> {
  bool isMarked = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) {
            return DetailsMoreMovies(widget.results);
          }),
        );
      },
      child: Stack(
        children: [
          Image.network(
            width: 97,
            height: double.infinity,
            'https://image.tmdb.org/t/p/w500' +
                '${widget.results!.backdropPath}',
            fit: BoxFit.fitHeight,
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
      ),
    );
  }
}
