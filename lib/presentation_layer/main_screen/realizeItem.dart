import 'package:flutter/material.dart';
import 'package:movies_app/data_layer/database/data_model.dart';
import 'package:movies_app/data_layer/database/myDatabase.dart';
import 'package:movies_app/data_layer/model/RecomendedMovies.dart';
import 'package:movies_app/presentation_layer/main_screen/details/DetailsMoreMovies.dart';
import 'package:movies_app/showLoadingUtils.dart';

class RealizeItem extends StatefulWidget {
  MoreMoviesResults? results;

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
              left: size.width * 0.01,
              child: InkWell(
                  onTap: () {
                    addMarked();
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
  void addMarked() {
    WatchAdd watch = WatchAdd(
      time: widget.results?.releaseDate,
      title: widget.results?.title,
      average: widget.results?.voteAverage.toString(),
      imageUel:
      'https://image.tmdb.org/t/p/w500' + '${widget.results?.posterPath??""}',
    );
    showLoading(context, 'Loading');
    MyDataBase.insertWatch(watch).then((value) {
      hideLoading(context);
      showMassege(
        context,
        'Added successfully',
        posActionName: 'Ok',
      );
    }).onError((error, stackTrace) {
      //called when future fail
      hideLoading(context);

      showMassege(
        context,
        'Something went wrong, try again later',
        posActionName: 'Ok',
      );
    }).timeout(Duration(seconds: 5), onTimeout: () {
      hideLoading(context);

      //save change in cache
      showMassege(
        context,
        'Film saved locally',
        posActionName: 'Ok',
      );
    });
  }
  void showLoading(BuildContext context, String loadingMassege,
      {bool isCancelable = true}) {
    showDialog(
        context: context,
        builder: (buildContext) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  width: 12,
                ),
                Text(loadingMassege),
              ],
            ),
          );
        },
        barrierDismissible: isCancelable);
  }
}
