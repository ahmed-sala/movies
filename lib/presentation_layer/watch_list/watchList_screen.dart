import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/data_layer/database/data_model.dart';
import 'package:movies_app/data_layer/database/myDatabase.dart';
import 'package:movies_app/presentation_layer/watch_list/watch_list_widget.dart';

class WatchListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:StreamBuilder<QuerySnapshot<WatchAdd>>(
        stream: MyDataBase.listenForTasksRealTimeUpdate(),
        builder:(buldContext, snapshot) {
          if (snapshot.hasError) {
            return Text('Error loading dada,'
                'please try again later');
          } else if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          var data = snapshot.data?.docs.map((e) => e.data()).toList();
          return ListView.builder(
            itemBuilder: (buldContext, index) {
              return
                WatchlistWidget(data![index]);
            },
            itemCount: data!.length,
          );
        } ,
      ) ,
    );
  }
}
