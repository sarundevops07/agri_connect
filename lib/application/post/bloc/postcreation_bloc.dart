import 'package:agri_connect/domain/core/failures/main_failure.dart';
import 'package:agri_connect/domain/model/post.dart';
import 'package:agri_connect/domain/repository/post/post_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'postcreation_event.dart';
part 'postcreation_state.dart';
part 'postcreation_bloc.freezed.dart';

@injectable
class PostcreationBloc extends Bloc<PostcreationEvent, PostcreationState> {
  final PostRepo postRepo;
  PostcreationBloc(this.postRepo) : super(PostcreationState.initial()) {
    on<CreatePost>((event, emit) async {
      emit(const PostcreationState(
          errorMessage: null, posts: [], postCreated: false));
      final result = await postRepo.createPost(event.post);
      result.fold(
        (failure) {
          emit(state.copyWith(
            errorMessage: failure.message,
          ));
        },
        (success) {
          emit(state.copyWith(postCreated: true));
        },
      );
    });
    on<GetPosts>((event, emit) async {
      emit(const PostcreationState(
          errorMessage: null, posts: [], postCreated: false));

      await emit.forEach<Either<MainFailures, List<Post>>>(
        postRepo.getPosts(),
        onData: (result) => result.fold(
          (failure) => state.copyWith(
            errorMessage: failure.message,
            posts: [],
          ),
          (post) => state.copyWith(
            posts: post,
            errorMessage: null,
          ),
        ),
        onError: (_, __) => state.copyWith(
          errorMessage: "An error occurred while fetching post.",
          posts: [],
        ),
      );
    });
  }
}
