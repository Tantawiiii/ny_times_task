
import '../../utils/networking/api_constants.dart';
import '../../utils/networking/dio_client.dart';
import '../models/article_model.dart';

class ArticlesRepository {
  final DioClient _dioClient;

  ArticlesRepository(this._dioClient);

  Future<List<ArticleModel>> fetchArticles() async {
    try {
      final response = await _dioClient.get(ApiConstants.articlesSection, queryParams: {
        "api-key": ApiConstants.apiAuthKey,
      });

      if (response.statusCode == 200) {
        final List<dynamic> results = response.data['results'];
        return results.map((json) => ArticleModel.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load articles");
      }
    } catch (e) {
      throw Exception("Error fetching articles: $e");
    }
  }
}
