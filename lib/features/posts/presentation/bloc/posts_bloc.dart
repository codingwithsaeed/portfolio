import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:portfolio/core/exceptions.dart';
import 'package:portfolio/features/posts/domain/repositories/posts_repository.dart';

import '../../domain/entities/post.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepository _repo;

  PostsBloc(this._repo) : super(PostsState(PostsInitial())) {
    on<GetPostsEvent>(
      (event, emit) async {
        emit(state.copyWith(status: PostsLoading()));
        try {
          final response = await _repo.getPosts();
          emit(state.copyWith(status: PostsLoaded(response)));
        } on AppException catch (e) {
          emit(state.copyWith(status: PostsError(e.message)));
        }
      },
    );
  }
}
