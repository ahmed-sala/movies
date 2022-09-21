import 'package:movies_app/base/base.dart';
import 'package:movies_app/data_layer/database/data_model.dart';
import 'package:movies_app/data_layer/database/myDatabase.dart';
import 'package:movies_app/data_layer/model/Movies.dart';

abstract class NewRealizeNavigator extends BaseNavigator {}

class NewRealizeViewModel extends BaseViewModel<NewRealizeNavigator> {
  void addMarked(Results? results) {
    WatchAdd watch = WatchAdd(
      time: results?.releaseDate,
      title: results?.title,
      average: results?.voteAverage.toString(),
      imageUel: 'https://image.tmdb.org/t/p/w500' +
          '${results?.posterPath ?? ""}',
    );
    navigator?.showLoadingDialog();
    MyDataBase.insertWatch(watch).then((value) {
      navigator?.hideLoadingDialoge();
      navigator?.showMessageDialog('Added successfully', posActionName: 'ok');
    }).onError((error, stackTrace) {
      //called when future fail
      navigator?.hideLoadingDialoge();
      navigator?.showMessageDialog('Something went wrong, try again later',
          posActionName: 'Ok');
    }).timeout(Duration(seconds: 5), onTimeout: () {
      navigator?.hideLoadingDialoge();
      //save change in cache
      navigator?.showMessageDialog(
        'Film saved locally',
        posActionName: 'Ok',
      );
    });
  }
}
