import 'package:flutter/material.dart';
import 'package:movies_app/data_layer/model/GenersModel.dart';
import 'package:movies_app/data_layer/model/MoviesList.dart';
import 'package:movies_app/data_layer/services/api_manager.dart';
import 'package:movies_app/presentation_layer/browse/category_model.dart';
import 'package:movies_app/presentation_layer/browse/widget_list.dart';

import '../../data_layer/model/Movies.dart';

class CategoryList extends StatelessWidget {
  Genres genres;

  //CategoryModel categoryModel ;
  CategoryList(this.genres);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(30))),
        toolbarHeight: 60,
        centerTitle: true,
        title: Text('${genres.name}', style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white
        ),),
      ),

      body: FutureBuilder<MoviesList>(
        future: ApiManager.getMoviesList(genres.name!),

        builder: (buildcontext, snapShot) {
          if (snapShot.hasError) {
            print('error = ${snapShot.error.toString()}');
            return Container(
                padding:
                const EdgeInsets.symmetric(vertical: 100),
                alignment: AlignmentDirectional.center,
                child: Text(
                  'error is ${snapShot.error.toString()}',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ));
          } else if (snapShot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: const CircularProgressIndicator(),
            );
          }
          var data = snapShot.data;
          List<Results> moviesList = data!.results!;

          return ListView.separated(
            itemBuilder: (_, index) {
              return WidgetList(moviesList.elementAt(index));
            },
            itemCount: moviesList.length,
            separatorBuilder: (_, index) =>
            const SizedBox(
              width: 5,
            ),
          );
        },
      ),
    );
  }
}
