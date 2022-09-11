import 'package:flutter/material.dart';
import 'details.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = 'search';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121312),
      body: Container(
        width:double.infinity,
        margin: const EdgeInsets.only(top: 43, right: 35, left: 35),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: const Color(0x99514F4F),
                border: Border.all(
                  color: const Color(0xFFB5B4B4),
                ),
                borderRadius: BorderRadius.circular(35),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const ImageIcon(
                      AssetImage('assets/images/search@2x.png'),
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Details(
              'assets/images/img_1.png',
              'assets/images/img_2.png',
              'Alita Battel Angel',
              '2019',
              'Rosa Salazar,Christoph Waltz',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.18,
            ),
            Image.asset('assets/images/no_movie_found.png',width: 78,height: 87,),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'No movies found',
              style: TextStyle(color: Color(0xFF707070), fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}