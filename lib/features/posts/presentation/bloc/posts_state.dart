part of 'posts_bloc.dart';

class PostsState {
  final PostsStatus status;
  PostsState(this.status);

  PostsState copyWith({PostsStatus? status}) => PostsState(status ?? this.status);
}

@immutable
sealed class PostsStatus {
  const PostsStatus();
}

final class PostsInitial extends PostsStatus {}

final class PostsLoading extends PostsStatus {}

final class PostsLoaded extends PostsStatus {
  final List<Post> posts;
  const PostsLoaded(this.posts);
}

final class PostsError extends PostsStatus {
  final String message;
  const PostsError(this.message);
}
