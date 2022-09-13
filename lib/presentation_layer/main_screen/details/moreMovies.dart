import 'package:flutter/material.dart';
import 'package:movies_app/data_layer/model/Movies.dart';
import 'package:movies_app/presentation_layer/main_screen/details/DetailsMoreMovies.dart';

class MoreMovies extends StatefulWidget {
  Results? results;

  MoreMovies(this.results);

  @override
  State<MoreMovies> createState() => _MoreMoviesState();
}

class _MoreMoviesState extends State<MoreMovies> {
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
