part of 'postcreation_bloc.dart';

@freezed
class PostcreationEvent with _$PostcreationEvent {
  const factory PostcreationEvent.createPost(Post post) = CreatePost;
  const factory PostcreationEvent.getPosts() = GetPosts;
  const factory PostcreationEvent.getWeather() = GetWeather;
}
