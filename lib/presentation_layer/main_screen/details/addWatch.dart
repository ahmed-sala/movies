import 'package:flutter/material.dart';
import 'package:movies_app/data_layer/database/data_model.dart';
import 'package:movies_app/data_layer/database/myDatabase.dart';
import 'package:movies_app/showLoadingUtils.dart';

import '../../../data_layer/model/Movies.dart';

class AddedDone{
  BuildContext context;
  Results? results;

  AddedDone(this.context,this.results);
  void addMarked() {
    WatchAdd watch = WatchAdd(
      time: results?.releaseDate,
      title: results?.title,
      average: results?.voteAverage,
      imageUel:
      'https://image.tmdb.org/t/p/w500' + '${results!.posterPath}',
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