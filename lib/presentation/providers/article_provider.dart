import 'package:flutter/material.dart';
import '../../data/models/article_model.dart';
import '../../data/repositories/article_repository.dart';

class ArticlesProvider extends ChangeNotifier {
  final ArticlesRepository _repository;

  ArticlesProvider(this._repository);

  List<ArticleModel> _articles = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<ArticleModel> get articles => _articles;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadArticles() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _articles = await _repository.fetchArticles();
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
