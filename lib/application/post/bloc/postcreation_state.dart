part of 'postcreation_bloc.dart';

@freezed
class PostcreationState with _$PostcreationState {
  const factory PostcreationState({
    required String? errorMessage,
    required bool postCreated,
    required List<Post> posts,
    required Weather? weather,
  }) = _Initial;
  factory PostcreationState.initial() => const PostcreationState(
        errorMessage: null,
        posts: [],
        postCreated: false,
        weather: null,
      );
}
