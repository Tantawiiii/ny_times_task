import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ny_times_task/utils/helpers/spacing.dart';
import 'package:shimmer/shimmer.dart';
import '../../data/models/article_model.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final ArticleModel article;

  const ArticleDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(article.title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              verticalSpace(10),
              Text(article.byline, style: TextStyle(fontSize: 16, color: Colors.grey)),
              verticalSpace(10),
              article.imageUrl != null
                  ? CachedNetworkImage(
                imageUrl: article.imageUrl!,
                height: 300.h,
                fit: BoxFit.cover,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 75.w,
                    height: 75.h,
                    color: Colors.white,
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.broken_image, size: 50.sp),
              )
                  :  SizedBox(),
              verticalSpace(10),
              Text(article.abstract, style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
