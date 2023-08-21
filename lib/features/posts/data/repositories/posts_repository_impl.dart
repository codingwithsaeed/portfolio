import 'package:portfolio/core/repostitory_wrapper.dart';
import 'package:portfolio/features/posts/data/datasources/remote/posts_api.dart';
import 'package:portfolio/features/posts/domain/entities/post.dart';
import '../../domain/repositories/posts_repository.dart';

final class PostsRepositoryImpl implements PostsRepository {
  final PostsApi _api;
  const PostsRepositoryImpl(this._api);

  @override
  Future<List<Post>> getPosts() async {
    final response = await RepositoryWrapper.wrap(() => _api.getPosts());
    return (response as List ).map((e) => Post.fromJson(e)).toList();
  }
}
