class Movies {
  int? page;
  List<Results>? results;
  String? status_code;
  String? status_message;

  Movies({
    this.page,
    this.results,
    this.status_code,
    this.status_message,
  });

  Movies.fromJson(dynamic json) {
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
}

class Results {
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  String? voteAverage;

  Results.fromJson(Map<String, dynamic> json) {
    backdropPath = json["backdrop_path"];
    genreIds = json["genre_ids"] != null ? json["genre_ids"].cast<int>() : [];
    id = json["id"];
    overview = json["overview"];
    posterPath = json["poster_path"];
    releaseDate = json["release_date"];
    title = json["title"];
    video = json["video"];
    voteAverage = json["vote_average"].toString();
  }
}
