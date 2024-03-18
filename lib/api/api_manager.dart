// ignore_for_file: use_rethrow_when_possible

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/models/source_response.dart';

class ApiManager {
  static Future<SourceResponse?> getNewsSourses() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.soursesEndpoint,
        ApiConstants.apiKey);
    try {
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      return SourceResponse.fromJson(jsonData);
    } catch (e) {
      throw e;
    }
  }

  /**
   * https://newsapi.org/v2/top-headlines/sources?apiKey=
   * 1f947e49d6534e428bdda6cc3e84d7d6
   */
}
