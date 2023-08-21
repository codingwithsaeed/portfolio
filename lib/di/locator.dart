import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../core/core.dart';
import '../core/data/remote/client/dio/dio_utils.dart';
import '../core/data/remote/client/dio/dio_client.dart';
import '../features/posts/data/datasources/remote/posts_api.dart';
import '../features/posts/data/repositories/posts_repository_impl.dart';
import '../features/posts/domain/repositories/posts_repository.dart';
import '../features/posts/presentation/bloc/posts_bloc.dart';

final locator = GetIt.instance;

Future<void> locateDependencies() async {
  locator.registerLazySingleton<Dio>(() => Dio(dioOptions));
  locator.registerLazySingleton<ApiClient>(() => DioClient(locator()));
  locator.registerFactory<PostsApi>(() => PostsApiImpl(locator()));
  locator.registerFactory<PostsRepository>(() => PostsRepositoryImpl(locator()));
  locator.registerFactory<PostsBloc>(() => PostsBloc(locator()));
}
