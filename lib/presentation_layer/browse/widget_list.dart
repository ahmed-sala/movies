import 'package:flutter/material.dart';
import 'package:movies_app/data_layer/model/data_model.dart';
import 'package:movies_app/showLoadingUtils.dart';
import '../../data_layer/database/myDatabase.dart';
import '../../data_layer/model/Movies.dart';

class WidgetList extends StatefulWidget {
  Results moviesList;

  WidgetList(this.moviesList);

  @override
  State<WidgetList> createState() => _WidgetListState();
}

class _WidgetListState extends State<WidgetList> {
  @override
  bool isMarked = false;

  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Container(
      width: double.infinity,
      height: 120,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Stack(
            children: [
              Image.network(
                width: 197,
                height: double.infinity,
                'https://image.tmdb.org/t/p/w500' +
                    '${widget.moviesList.backdropPath}',
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
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.moviesList.title ?? '',
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 5,),
                Text(
                  widget.moviesList.releaseDate ?? '',
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,

                ),
                const SizedBox(height: 5,),
                Text(
                  widget.moviesList.overview ?? '',
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[400]
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,

                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void addMarked() {
    WatchAdd watch = WatchAdd(
      time: widget.moviesList.releaseDate,
      title: widget.moviesList.title,
      average: '${widget.moviesList.voteAverage}',
      imageUel:
      'https://image.tmdb.org/t/p/w500' + '${widget.moviesList.posterPath}',
    );
    showLoading(context, 'Loading');
    MyDataBase.insertWatch(watch).then((value) {
      hideLoading(context);
      showMessage(
        context,
        'Added successfully',
        posActionName: 'Ok',
      );
    }).onError((error, stackTrace) {
      //called when future fail
      hideLoading(context);

      showMessage(
        context,
        'Something went wrong, try again later',
        posActionName: 'Ok',
      );
    }).timeout(const Duration(seconds: 5), onTimeout: () {
      hideLoading(context);

      //save change in cache
      showMessage(
        context,
        'Film saved locally',
        posActionName: 'Ok',
      );
    });
  }
}
