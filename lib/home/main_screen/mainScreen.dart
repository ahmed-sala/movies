import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/home/main_screen/new_realize_widget.dart';
import 'package:movies_app/home/main_screen/recomended_widget.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 310,
            child: ListView(
              children: [
                CarouselSlider(items: [
                  Stack(
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
                        left: 10,
                        top: 90,
                        child: Container(
                            child: Image.asset(
                              'assets/images/doraFilm.png',
                              width: 130,
                              height: 200,
                            )),
                      ),
                      Positioned(
                        top: 90,
                        left: 10,
                        child:
                        Image.asset('assets/images/bookmark.png'),
                      ),
                      Positioned(
                        top: 228,
                        left: size.width*0.45,
                        child: Text('Dora and the lost city of gold',style: TextStyle(
                            fontSize: 14,
                            color: Colors.white
                        ),),
                      ),

                      Positioned(
                        top: 250,
                        left: size.width*0.43,
                        child: Text('2019  PG-13  2h 7m',style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFFB5B4B4)
                        ),),
                      ),
                    ],
                  ),
                  Stack(
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
                        left: 10,
                        top: 90,
                        child: Container(
                            child: Image.asset(
                              'assets/images/doraFilm.png',
                              width: 130,
                              height: 200,
                            )),
                      ),
                      Positioned(
                        top: 90,
                        left: 10,
                        child:
                        Image.asset('assets/images/bookmark.png'),
                      ),
                      Positioned(
                        top: 228,
                        left: size.width*0.45,
                        child: Text('Dora and the lost city of gold',style: TextStyle(
                            fontSize: 14,
                            color: Colors.white
                        ),),
                      ),

                      Positioned(
                        top: 250,
                        left: size.width*0.43,
                        child: Text('2019  PG-13  2h 7m',style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFFB5B4B4)
                        ),),
                      ),
                    ],
                  ),
                  Stack(
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
                        left: 10,
                        top: 90,
                        child: Container(
                            child: Image.asset(
                              'assets/images/doraFilm.png',
                              width: 130,
                              height: 200,
                            )),
                      ),
                      Positioned(
                        top: 90,
                        left: 10,
                        child:
                        Image.asset('assets/images/bookmark.png'),
                      ),
                      Positioned(
                        top: 228,
                        left: size.width*0.45,
                        child: Text('Dora and the lost city of gold',style: TextStyle(
                            fontSize: 14,
                            color: Colors.white
                        ),),
                      ),

                      Positioned(
                        top: 250,
                        left: size.width*0.43,
                        child: Text('2019  PG-13  2h 7m',style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFFB5B4B4)
                        ),),
                      ),
                    ],
                  ),
                ],
                    options: CarouselOptions(
                      height: 350,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction:1
                    ))
              ],
            )
          ),
          SizedBox(height: 24,),
          Container(
            color: Color(0xFF282A28),
            height: 187,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('New Releases',style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),),
                SizedBox(height: 12,),
                Expanded(
                  child: ListView.separated(
                    scrollDirection:Axis.horizontal ,itemBuilder: (_,index){
                    return NewRealizeWidget();
                  },itemCount: 5,separatorBuilder: (_,index)=>SizedBox(width: 5,),),
                )
              ],
            ),
          ),
          SizedBox(height: 30,),
          Container(
            color: Color(0xFF282A28),
            height: 187,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Recomended',style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),),
                SizedBox(height: 12,),
                Expanded(
                  child: ListView.separated(
                    scrollDirection:Axis.horizontal ,itemBuilder: (_,index){
                    return RecomendedWidget();
                  },itemCount: 5,separatorBuilder: (_,index)=>SizedBox(width: 5,),),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
