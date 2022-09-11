import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = 'test';

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
                          Image.asset(
                            'assets/images/Main_Film.png',
                            height: size.height * 0.29,
                            width: double.infinity,
                            fit: BoxFit.fitWidth,
                          ),
                          Positioned(
                            left: size.width * 0.40,
                            top: size.height * 0.08,
                            child: Icon(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Drop and the lost city of gold',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Color(0xFFFFFFFF)),
                      ),
                      SizedBox(height: 8),
                      Text(
                        textAlign: TextAlign.start,
                        '2019  PG-13 2h 7m',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      // PopularItem(movies),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 190,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: 130,
                      height: 300,
                      child: Stack(
                        children: [
                          InkWell(
                              onTap: () {},
                              child: Image.asset(
                                'assets/images/doraFilm.png',
                                width: 130,
                                height: 200,
                              )),
                        ],
                      ),
                    ),
                    // PopularItem(movies),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
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
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Having spent most of her life exploring the jungle'
                            ', nothing could prepare Dora for her most '
                            'dangerous adventure yet high school.',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontSize: 14),
                            textDirection: TextDirection.ltr,
                            overflow: TextOverflow.visible,
                            maxLines: 2,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '7.7',
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'More Like This',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
