import 'package:flutter/material.dart';
import 'package:movies_app/data_layer/model/Movies.dart';
import 'package:movies_app/presentation_layer/main_screen/details/DetailsScreen.dart';

class CarouseWidget extends StatelessWidget {
  Results? results;

  CarouseWidget(this.results);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        height: size.height * 0.30,
        margin: const EdgeInsets.only(bottom: 5),
        child: Stack(
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w500' +
                  '${results!.backdropPath ?? ''}',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Positioned(
              left: size.width * 0.40,
              top: size.height * 0.09,
              child: const Icon(
                Icons.play_circle_filled,
                size: 70,
                color: Colors.white,
              ),
            ),
            Positioned(
              left: size.width * 0.05,
              top: size.height * 0.06,
              child: Container(
                width: 130,
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => DetailsScreen(),
                          ),
                        );
                      },
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500' +
                            '${results!.posterPath}',
                        fit: BoxFit.cover,
                        width: 130,
                        height: 200,
                      ),
                    ),
                    Text(
                      results!.title ?? '',
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      results!.releaseDate ?? '',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromRGBO(181, 180, 180, 1.0),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
