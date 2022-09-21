import 'package:flutter/material.dart';
import 'package:movies_app/data_layer/model/Movies.dart';
import 'package:movies_app/data_layer/model/RecomendedMovies.dart';
import 'package:movies_app/presentation_layer/main_screen/realize/realizeItem.dart';

import '../../../data_layer/services/api_manager.dart';

class NewRealizeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RecomendedMovies>(
        future: ApiManager.getMoreMovies(),
        builder: (buildContext, snapshot) {
          if (snapshot.hasError) {
            print('error = ${snapshot.error.toString()}');
            return Container(
                padding: const EdgeInsets.symmetric(vertical: 100),
                alignment: AlignmentDirectional.center,
                child: Text(
                  '${snapshot.error.toString()}',
                  style: const TextStyle(color: Colors.white),
                ));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: const CircularProgressIndicator(),
            );
          }
          var data = snapshot.data;

          List<Results>? movies = data!.results;
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return RealizeItem(movies![index]);
            },
            itemCount: movies!.length,
            separatorBuilder: (_, index) => const SizedBox(
              width: 5,
            ),
          );
        });
  }
}
