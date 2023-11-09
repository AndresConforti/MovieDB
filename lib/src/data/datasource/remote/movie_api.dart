import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:movie_db/src/data/model/movie_response_model.dart';

import './interface/api_interface.dart';
import '../../../core/utils/strings.dart';

class MovieApi extends ApiInterface {
  @override
  Future<MovieResponseModel> fetch(String url) async {
    final response = await http.get(
      Uri.parse('${Strings.apiUrl}$url${Strings.apiKey}'),
    );
    if (response.statusCode == HttpStatus.ok) {
      return MovieResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception(Strings.apiErrorMsg);
    }
  }
}
