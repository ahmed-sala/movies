import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/data_layer/model/Movies.dart';
import 'package:movies_app/data_layer/services/api_manager.dart';
import 'package:movies_app/presentation_layer/main_screen/carouselWidget.dart';
import 'package:movies_app/presentation_layer/main_screen/realize/new_realize_widget.dart';
import 'package:movies_app/presentation_layer/main_screen/realize/realizeItem.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 310,
                child: FutureBuilder<Movies>(
                    future: ApiManager.getMoviesDetails(),
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
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: const CircularProgressIndicator(),
                        );
                      }
                      var data = snapshot.data;
                      List<Results>? movies = data!.results;
                      return CarouselSlider(
                        items: movies!.map((element) {
                          return CarouseWidget(element);
                        }).toList(),
                        options: CarouselOptions(
                            height: 350,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            viewportFraction: 1),
                      );
                    })),
            const SizedBox(
              height: 24,
            ),
            Container(
              color: const Color(0xFF282A28),
              height: 187,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'New Releases',
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: FutureBuilder<Movies>(
                        future: ApiManager.getMoviesDetails(),
                        builder: (buildContext, snapshot) {
                          if (snapshot.hasError) {
                            print('error = ${snapshot.error.toString()}');
                            return Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 100),
                                alignment: AlignmentDirectional.center,
                                child: Text(
                                  '${snapshot.error.toString()}',
                                  style: const TextStyle(color: Colors.white),
                                ));
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
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
                        }),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              color: const Color(0xFF282A28),
              height: 187,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Recomended',
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Expanded(child: NewRealizeWidget())
                  // Expanded(
                  //   child: ListView.separated(
                  //     scrollDirection: Axis.horizontal,
                  //     itemBuilder: (_, index) {
                  //       return RecomendedWidget();
                  //     },
                  //     itemCount: 5,
                  //     separatorBuilder: (_, index) => const SizedBox(
                  //       width: 5,
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
