import '../entities/post.dart';

abstract interface class PostsRepository {
  Future<List<Post>> getPosts();
}
