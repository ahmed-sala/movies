import 'package:movies_app/data_layer/model/Movies.dart';

class RecomendedMovies {
  RecomendedMovies(
      {this.page, this.results, this.status_message, this.status_code});

  RecomendedMovies.fromJson(dynamic json) {
    page = json['page'];
    status_code = json['status_code'];
    status_message = json['status_message'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }

  int? page;
  List<Results>? results;
  String? status_code;
  String? status_message;
}

// class MoreMoviesResults {
//   MoreMoviesResults({
//     this.backdropPath,
//     this.originalTitle,
//     this.overview,
//     this.posterPath,
//     this.releaseDate,
//     this.title,
//     this.voteAverage,
//   });
//
//   MoreMoviesResults.fromJson(dynamic json) {
//     backdropPath = json['backdrop_path'];
//     originalTitle = json['original_title'];
//     overview = json['overview'];
//     posterPath = json['poster_path'];
//     releaseDate = json['release_date'];
//     title = json['title'];
//     voteAverage = json['vote_average'];
//   }
//
//   String? backdropPath;
//   String? originalTitle;
//   String? overview;
//   String? posterPath;
//   String? releaseDate;
//   String? title;
//   double? voteAverage;
// }
