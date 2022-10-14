import 'package:flutter/material.dart';
import 'package:movies_app/presentation_layer/browse/category_model.dart';
import '../../data_layer/model/GenersModel.dart';
import 'category_list.dart';

class CategoryWidget extends StatelessWidget {
  CategoryModel category;
  Genres genres;

  CategoryWidget(this.category, this.genres);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return CategoryList(genres);
        }));
      },
      child: Container(
        width: 150,
        height: 95,
        child: Stack(

          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                'assets/images/${category.imageUrl}.jpg',
                fit: BoxFit.cover,
                height: 120,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 30,
              left: 50,
              child: Text(
                genres.name!,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
