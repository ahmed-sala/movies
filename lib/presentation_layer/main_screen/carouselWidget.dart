import 'package:flutter/material.dart';
import 'package:movies_app/data_layer/database/data_model.dart';
import 'package:movies_app/data_layer/database/myDatabase.dart';
import 'package:movies_app/data_layer/model/Movies.dart';
import 'package:movies_app/presentation_layer/main_screen/details/DetailsScreen.dart';
import 'package:movies_app/showLoadingUtils.dart';

class CarouseWidget extends StatefulWidget {
  Results? results;

  CarouseWidget(this.results);

  @override
  State<CarouseWidget> createState() => _CarouseWidgetState();
}

class _CarouseWidgetState extends State<CarouseWidget> {
  bool isMarked = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        height: size.height * 0.30,
        margin: const EdgeInsets.only(bottom: 5),
        child: Stack(
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w500' +
                  '${widget.results!.backdropPath ?? ''}',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Positioned(
              left: size.width * 0.40,
              top: size.height * 0.09,
              child: const Icon(
                Icons.play_circle_filled,
                size: 70,
                color: Colors.white,
              ),
            ),
            Positioned(
              left: size.width * 0.05,
              top: size.height * 0.06,
              child: Container(
                width: 130,
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigator.pushNamed(context, DetailsScreen.routeName,
                        //     arguments: results);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) {
                            return DetailsScreen(widget.results!);
                          }),
                        );
                      },
                      child: Stack(
                        children: [
                          Image.network(
                            'https://image.tmdb.org/t/p/w500' +
                                '${widget.results!.posterPath}',
                            fit: BoxFit.cover,
                            width: 130,
                            height: 200,
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
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        widget.results!.title ?? '',
                        overflow: TextOverflow.visible,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.results!.releaseDate ?? '',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromRGBO(181, 180, 180, 1.0),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  void addMarked() {
    WatchAdd watch = WatchAdd(
      time: widget.results?.releaseDate,
      title: widget.results?.title,
      average: widget.results?.voteAverage,
      imageUel:
          'https://image.tmdb.org/t/p/w500' + '${widget.results!.posterPath}',
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
