import 'package:flutter/material.dart';

class MoreDetailsMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.start,
          '2019  PG-13 2h 7m',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                    child: Image.asset(
                  'assets/images/doraFilm.png',
                  width: 130,
                  height: 200,
                )),
                Positioned(
                  right: 100,
                  child: Image.asset('assets/images/bookmark.png'),
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      'Action',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Having spent most of her life exploring the jungle'
                    ', nothing could prepare Dora for her most '
                    'dangerous adventure yet high school.',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 14),
                    textDirection: TextDirection.ltr,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      ImageIcon(
                        AssetImage('assets/images/star-2.png'),
                        color: Color(0xFFFFBB3B),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '7.7',
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
