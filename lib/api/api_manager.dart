// ignore_for_file: use_rethrow_when_possible

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/models/articles_response.dart';
import 'package:news_app/models/sources_response.dart';

class ApiManager {
  /// Fetching News `Sourses`
  static Future<SourcesResponse?> getNewsSourses(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.soursesEndpoint, {
      'apiKey': '1f947e49d6534e428bdda6cc3e84d7d6',
      'category': categoryId,
    });
    try {
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      return SourcesResponse.fromJson(jsonData);
    } catch (e) {
      throw e;
    }
  }

  /// Fetch News `Articles` by News [Sourse Id]
  static Future<ArticlesResponse?> getNewsArticles(String sourceID,
      {int? pageSize, int? page}) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.articlesEndpoint, {
      'apiKey': '1f947e49d6534e428bdda6cc3e84d7d6',
      'sources': sourceID,
      'pageSize': "$pageSize",
      'page': "$page"
    });

    try {
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      return ArticlesResponse.fromJson(jsonData);
    } catch (e) {
      throw e;
    }
  }

  /// Fetch News `Articles` with [query] of the `User` input in `SearchBar`
  static Future<ArticlesResponse?> getSearchedNewsArticles(String query) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.articlesEndpoint,
        {'apiKey': '1f947e49d6534e428bdda6cc3e84d7d6', 'q': query});
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return ArticlesResponse.fromJson(jsonData);
  }
  /**
   * https://newsapi.org/v2/top-headlines/sources?apiKey=
   * 1f947e49d6534e428bdda6cc3e84d7d6
   */
}
