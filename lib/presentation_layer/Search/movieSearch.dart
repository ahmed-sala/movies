import 'package:flutter/material.dart';

import '../../data_layer/database/myDatabase.dart';
import '../../data_layer/model/Movies.dart';
import '../../data_layer/model/data_model.dart';
import '../../showLoadingUtils.dart';
import '../main_screen/details/DetailsScreen.dart';

class SearchItem extends StatefulWidget {
  Results? movieResponse;
  int index;

  SearchItem(this.movieResponse, this.index);

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  @override
  Widget build(BuildContext context) {
    bool isMarked = false;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          Flexible(
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            DetailsScreen(widget.movieResponse),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500' +
                          '${widget.movieResponse!.posterPath}',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 100,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    addMarked();
                    setState(() {
                      isMarked = !isMarked;
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: isMarked
                        ? Image.asset('assets/images/bookmark_marked.png')
                        : Image.asset('assets/images/bookmark.png'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.movieResponse!.title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(
                  widget.movieResponse!.releaseDate ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    color: Color.fromRGBO(181, 180, 180, 1.0),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  widget.movieResponse!.overview ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    color: Color.fromRGBO(181, 180, 180, 1.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void addMarked() {
    WatchAdd watch = WatchAdd(
      time: widget.movieResponse?.releaseDate,
      title: widget.movieResponse?.title,
      average: widget.movieResponse?.voteAverage,
      imageUel: 'https://image.tmdb.org/t/p/w500' +
          '${widget.movieResponse!.posterPath}',
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
    }).timeout(Duration(seconds: 5), onTimeout: () {
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
