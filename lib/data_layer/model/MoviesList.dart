import 'Movies.dart';

class MoviesList {
  MoviesList({
    this.results,
  });

  MoviesList.fromJson(dynamic json) {
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }

  List<Results>? results;
}
