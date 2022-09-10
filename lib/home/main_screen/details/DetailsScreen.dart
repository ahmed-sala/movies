import 'package:flutter/material.dart';
import 'package:movies_app/home/main_screen/details/MoreDetailsMovies.dart';
import 'package:movies_app/home/main_screen/details/moreMovies.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = 'DetailsScreen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Drop and the lost city of gold',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Color(0xFFFFFFFF)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/Main_Film.png',
                    height: 217,
                    width: double.infinity,
                  ),
                  Positioned(
                    left: size.width * 0.41,
                    top: 79,
                    child: Icon(
                      Icons.play_circle,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Text(
                      'Drop and the lost city of gold',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: MoreDetailsMovies()),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(15),
              color: Color(0xFF282A28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'More Like This',
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return MoreMovies();
                      },
                      itemCount: 5,
                      separatorBuilder: (_, index) => SizedBox(
                        width: 5,
                      ),
                    ),
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
