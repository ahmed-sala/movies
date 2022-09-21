import 'package:flutter/material.dart';
import 'package:movies_app/data_layer/model/Movies.dart';
import 'package:movies_app/data_layer/model/RecomendedMovies.dart';
import 'package:movies_app/data_layer/services/api_manager.dart';
import 'package:movies_app/presentation_layer/main_screen/details/more_movies/moreMovies.dart';

class DetailsMoreMovies extends StatelessWidget {
  Results? results;

  DetailsMoreMovies(this.results);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          results!.title ?? '',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: const Color(0xFFFFFFFF)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: size.height * 0.22,
                      child: Stack(
                        children: [
                          Image.network(
                            'https://image.tmdb.org/t/p/w500' +
                                '${results!.backdropPath}',
                            height: size.height * 0.29,
                            width: double.infinity,
                            fit: BoxFit.fitWidth,
                          ),
                          Positioned(
                            left: size.width * 0.40,
                            top: size.height * 0.08,
                            child: const Icon(
                              Icons.play_circle_filled,
                              size: 70,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          results!.title ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: const Color(0xFFFFFFFF)),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          textAlign: TextAlign.start,
                          results!.releaseDate ?? '',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        // PopularItem(movies),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 190,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: 130,
                      height: 300,
                      child: Stack(
                        children: [
                          InkWell(
                              onTap: () {},
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w500' +
                                    '${results!.posterPath}',
                                width: 130,
                                height: 200,
                              )),
                        ],
                      ),
                    ),
                    // PopularItem(movies),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              'Action',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            results!.overview ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontSize: 14),
                            textDirection: TextDirection.ltr,
                            overflow: TextOverflow.visible,
                            maxLines: 6,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'More Like This',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder<RecomendedMovies>(
                  future: ApiManager.getMoreMovies(),
                  builder: (buildContext, snapshot) {
                    if (snapshot.hasError) {
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
                    return Container(
                      width: double.infinity,
                      height: 200,
                      child: Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return MoreMovies(movies![index]);
                          },
                          itemCount: movies!.length,
                          separatorBuilder: (_, index) => const SizedBox(
                            width: 7,
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
