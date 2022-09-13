import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/data_layer/database/data_model.dart';
import 'package:movies_app/data_layer/model/Movies.dart';

class MyDataBase {
  static CollectionReference<WatchAdd> getWatchCollection() {
    return FirebaseFirestore.instance
        .collection(WatchAdd.collecionName)
        .withConverter<WatchAdd>(fromFirestore: (snapshot, options) {
      return WatchAdd.fromFirestore(snapshot.data()!);
    }, toFirestore: (watch, options) {
      return watch.toFirestore();
    });
  }

  static Future<void> insertWatch(WatchAdd watch) {
    var wachCollection = getWatchCollection();
    var watchDoc = wachCollection.doc();
    watch.id = watchDoc.id;
    return watchDoc.set(watch);
  }

  static Future<QuerySnapshot<WatchAdd>> getAllWatch() async {
    return await getWatchCollection().get();
  }

  static Stream<QuerySnapshot<WatchAdd>> listenForTasksRealTimeUpdate() {
    // listen for real time update
    return getWatchCollection().snapshots();
  }
static Future<void>deleteWatch(WatchAdd watch){
  var doc = getWatchCollection().doc(watch.id);
  return doc.delete();
}

}
