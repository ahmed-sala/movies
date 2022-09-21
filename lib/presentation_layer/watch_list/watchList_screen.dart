import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/base/base.dart';
import 'package:movies_app/data_layer/database/data_model.dart';
import 'package:movies_app/data_layer/database/myDatabase.dart';
import 'package:movies_app/presentation_layer/watch_list/watch_list_viewModel.dart';
import 'package:movies_app/presentation_layer/watch_list/watch_list_widget.dart';
import 'package:provider/provider.dart';

class WatchListScreen extends StatefulWidget {
  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends BaseState<WatchListScreen,WatchListViewModel>
implements WatchListNavigator
{
  @override
  WatchListViewModel initViewModel() {
    return WatchListViewModel();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>viewModel,
      child: Container(
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
      ),
    );
  }
}
