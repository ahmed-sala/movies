import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  String imPath;
  String imPath2;
  String movieName;
  String movieYear;
  String movieDescription;

  Details(this.imPath, this.imPath2, this.movieName, this.movieYear,
      this.movieDescription);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Image.asset(imPath,width: 140,height: 89,),
            Positioned(
              bottom: 1,
              right: 20,
              left: 20,
              child: Image.asset(imPath2,width: 90,height: 41,),
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
          Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movieName,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(height: 5,),
              Text(
                movieYear,
                style: const TextStyle(color: Color(0xFF707070), fontSize: 13),
              ),
              SizedBox(height: 5,),

              Text(
                movieDescription,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF707070),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
