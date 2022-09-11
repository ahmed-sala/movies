import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/data_layer/model/Movies.dart';

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
}
