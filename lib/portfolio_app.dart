import 'package:flutter/material.dart';
import 'package:portfolio/features/posts/presentation/ui/posts_list_screen.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostsListScreen(),
    );
  }
}
