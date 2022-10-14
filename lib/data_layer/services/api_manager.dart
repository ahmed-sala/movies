import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/data_layer/model/GenersModel.dart';
import 'package:movies_app/data_layer/model/Movies.dart';
import 'package:movies_app/data_layer/model/RecomendedMovies.dart';

import '../model/MoviesList.dart';

class ApiManager {
  static const String API_KEY = '5245761b44754de3780aee5902c8e6be';

  static Future<Movies> getMoviesDetails() async {
    var url = Uri.https('api.themoviedb.org', '/3/movie/popular', {
      'api_key': API_KEY,
    });
    var getData = await http.get(url);
    var json = jsonDecode(getData.body);
    var bodyResponse = Movies.fromJson(json);
    return bodyResponse;
  }

  static Future<RecomendedMovies> getMoreMovies() async {
    var url = Uri.https('api.themoviedb.org', '/3/movie/top_rated', {
      'api_key': API_KEY,
    });
    var getData = await http.get(url);
    var json = jsonDecode(getData.body);
    var bodyResponse = RecomendedMovies.fromJson(json);
    return bodyResponse;
  }

  static Future<GenersModel> getGeners() async {
    var uri = Uri.parse(
        'https://api.themoviedb.org/3/genre/movie/list?api_key=$API_KEY');
    var getData = await http.get(uri);
    var json = jsonDecode(getData.body);
    var genersResponse = GenersModel.fromJson(json);
    return genersResponse;
  }

  static Future<MoviesList> getMoviesList(String categortId) async {
    var url = Uri.https('api.themoviedb.org', '/3/discover/movie',
        {'api_key': API_KEY, 'with_genres': categortId});
    var getData = await http.get(url);
    var json = jsonDecode(getData.body);
    var bodyResponse = MoviesList.fromJson(json);
    return bodyResponse;
  }

  static Future<Movies> getSearch(String query) async {
    Uri url = Uri.https('api.themoviedb.org', '/3/search/movie',
        {'api_key': API_KEY, 'query': query});
    final response = await http.get(url);
    var search = Movies.fromJson(jsonDecode(response.body));
    return search;
  }
}
