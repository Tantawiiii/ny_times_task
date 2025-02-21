import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../data/models/article_model.dart';
import '../screens/articles_details_screen.dart';

class ArticleItem extends StatelessWidget {
  final ArticleModel article;

  const ArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailsScreen(article: article),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(6.0),
        child: ListTile(
          leading: article.imageUrl != null
              ? CachedNetworkImage(
            imageUrl: article.imageUrl!,
            width: 75.w,
            height: 90.h,
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
              :  Icon(Icons.image_sharp, size: 50.sp),
          title: Text(article.title, maxLines: 1, overflow: TextOverflow.ellipsis),
          subtitle: Text(article.byline, maxLines: 2, overflow: TextOverflow.ellipsis),
          trailing: IconButton(
            icon: const Icon(Icons.double_arrow_outlined),
            onPressed: () {
            },
          ),
        ),
      ),
    );
  }
}
