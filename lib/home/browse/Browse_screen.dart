import 'package:flutter/material.dart';

import 'grid_element.dart';

class BrowseScreen extends StatelessWidget {
  /*=================[Variables]==================*/
  List<GridElement> movieElements = [
    GridElement(movieCategory: 'action1', imgPath: 'assets/images/img_bg1.jpg'),
    GridElement(movieCategory: 'action2', imgPath: 'assets/images/img_bg1.jpg'),
    GridElement(movieCategory: 'action3', imgPath: 'assets/images/img_bg1.jpg'),
    GridElement(movieCategory: 'action4', imgPath: 'assets/images/img_bg1.jpg'),
    GridElement(movieCategory: 'action5', imgPath: 'assets/images/img_bg1.jpg'),
    GridElement(movieCategory: 'action6', imgPath: 'assets/images/img_bg1.jpg'),
    GridElement(movieCategory: 'action6', imgPath: 'assets/images/img_bg1.jpg'),
    GridElement(movieCategory: 'action6', imgPath: 'assets/images/img_bg1.jpg'),
    GridElement(movieCategory: 'action6', imgPath: 'assets/images/img_bg1.jpg'),
    GridElement(movieCategory: 'action6', imgPath: 'assets/images/img_bg1.jpg'),
  ];

  /*===============================================*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF121312),
      body: Container(
        padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Browse Category',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: .1,
                            crossAxisSpacing: 15,
                            childAspectRatio:1.4

                        ),
                    itemCount: movieElements.length,
                    itemBuilder: (context, index) {
                      return movieElements[index];
                    }))
          ],
        ),
      ),
    );
  }
}
