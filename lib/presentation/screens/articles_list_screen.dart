import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/article_provider.dart';
import '../widgets/article_item.dart';
import '../widgets/article_shimmer.dart';
import '../widgets/build_custome_appbar.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ArticlesProvider>(context);

    return Scaffold(
      appBar: buildCustomAppBar(),
      body: provider.isLoading
          ? ArticleShimmer()
          : provider.errorMessage != null
          ? Center(child: Text(provider.errorMessage!))
          : ListView.builder(
        itemCount: provider.articles.length,
        itemBuilder: (context, index) {
          return ArticleItem(article: provider.articles[index]);
        },
      ),
    );
  }
}
