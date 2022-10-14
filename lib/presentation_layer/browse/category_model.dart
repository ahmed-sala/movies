import 'package:flutter/material.dart';

class CategoryModel {
  String? id;
  String? title;
  String? imageUrl;

  CategoryModel(this.id, this.title, this.imageUrl);

  static List<CategoryModel> getAllCategoreies(BuildContext context) {
    return [
      CategoryModel('action', 'Action', 'action'),
      CategoryModel('adventure', 'Adventure', 'adventure'),
      CategoryModel('animation', 'Animation', 'animation'),
      CategoryModel('comedy', 'Comedy', 'comedy'),
      CategoryModel('crime', 'Crime', 'crime'),
      CategoryModel('drama', 'Drama', 'drama'),
      CategoryModel('documentary', 'Documentary', 'documentary'),
      CategoryModel('family', 'Family', 'family'),
      CategoryModel('fantasy', 'Fantasy', 'fantasy'),
      CategoryModel('history', 'History', 'history'),
      CategoryModel('horror', 'Horror', 'horror'),
      CategoryModel('music', 'Music', 'music'),
      CategoryModel('mystery', 'Mystery', 'mystery'),
      CategoryModel('romance', 'Romance', 'romance'),
      CategoryModel('war', 'War', 'war'),
      CategoryModel('western', 'Western', 'western'),
      CategoryModel('thriller', 'Thriller', 'thriller'),
      CategoryModel('thriller', 'Thriller', 'thriller'),
      CategoryModel('thriller', 'Thriller', 'thriller'),
    ];
  }
}