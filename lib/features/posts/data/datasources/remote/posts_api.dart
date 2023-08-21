import 'package:portfolio/core/core.dart';

abstract interface class PostsApi {
  Future<ApiResponse> getPosts();
}

class PostsApiImpl implements PostsApi {
  final ApiClient _client;
  const PostsApiImpl(this._client);
  
  @override
  Future<ApiResponse> getPosts() {
    return _client.get(Endpoints.posts);
  }
}
