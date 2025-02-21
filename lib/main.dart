import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ny_times_task/presentation/providers/article_provider.dart';
import 'package:ny_times_task/presentation/screens/articles_list_screen.dart';
import 'package:ny_times_task/utils/constants/text_strings.dart';
import 'package:ny_times_task/utils/networking/dio_client.dart';
import 'package:provider/provider.dart';

import 'data/repositories/article_repository.dart';

void main() {
  final dioClient = DioClient();
  final articlesRepository = ArticlesRepository(dioClient);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ArticlesProvider(articlesRepository)..loadArticles()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: TTexts.appTitle,
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const ArticlesScreen(),
        );
      },
    );
  }
}
