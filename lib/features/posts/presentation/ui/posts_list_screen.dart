import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/di/locator.dart';
import 'package:portfolio/features/posts/presentation/bloc/posts_bloc.dart';

class PostsListScreen extends StatelessWidget {
  const PostsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostsBloc>(
      create: (_) => locator(),
      child: Builder(builder: (context) {
        return Scaffold(
            body: BlocBuilder<PostsBloc, PostsState>(
          bloc: context.read<PostsBloc>()..add(GetPostsEvent()),
          builder: (context, state) {
            if (state.status is PostsInitial || state.status is PostsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.status is PostsLoaded) {
              final posts = (state.status as PostsLoaded).posts;
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) => Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black26),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(title: Text(posts[index].title), dense: true),
                ),
              );
            }
            return Center(child: Text((state.status as PostsError).message));
          },
        ));
      }),
    );
  }
}
