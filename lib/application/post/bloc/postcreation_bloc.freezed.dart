// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'postcreation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PostcreationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Post post) createPost,
    required TResult Function() getPosts,
    required TResult Function() getWeather,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Post post)? createPost,
    TResult? Function()? getPosts,
    TResult? Function()? getWeather,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Post post)? createPost,
    TResult Function()? getPosts,
    TResult Function()? getWeather,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreatePost value) createPost,
    required TResult Function(GetPosts value) getPosts,
    required TResult Function(GetWeather value) getWeather,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreatePost value)? createPost,
    TResult? Function(GetPosts value)? getPosts,
    TResult? Function(GetWeather value)? getWeather,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreatePost value)? createPost,
    TResult Function(GetPosts value)? getPosts,
    TResult Function(GetWeather value)? getWeather,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostcreationEventCopyWith<$Res> {
  factory $PostcreationEventCopyWith(
          PostcreationEvent value, $Res Function(PostcreationEvent) then) =
      _$PostcreationEventCopyWithImpl<$Res, PostcreationEvent>;
}

/// @nodoc
class _$PostcreationEventCopyWithImpl<$Res, $Val extends PostcreationEvent>
    implements $PostcreationEventCopyWith<$Res> {
  _$PostcreationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostcreationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CreatePostImplCopyWith<$Res> {
  factory _$$CreatePostImplCopyWith(
          _$CreatePostImpl value, $Res Function(_$CreatePostImpl) then) =
      __$$CreatePostImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Post post});
}

/// @nodoc
class __$$CreatePostImplCopyWithImpl<$Res>
    extends _$PostcreationEventCopyWithImpl<$Res, _$CreatePostImpl>
    implements _$$CreatePostImplCopyWith<$Res> {
  __$$CreatePostImplCopyWithImpl(
      _$CreatePostImpl _value, $Res Function(_$CreatePostImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostcreationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post = null,
  }) {
    return _then(_$CreatePostImpl(
      null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post,
    ));
  }
}

/// @nodoc

class _$CreatePostImpl implements CreatePost {
  const _$CreatePostImpl(this.post);

  @override
  final Post post;

  @override
  String toString() {
    return 'PostcreationEvent.createPost(post: $post)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePostImpl &&
            (identical(other.post, post) || other.post == post));
  }

  @override
  int get hashCode => Object.hash(runtimeType, post);

  /// Create a copy of PostcreationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePostImplCopyWith<_$CreatePostImpl> get copyWith =>
      __$$CreatePostImplCopyWithImpl<_$CreatePostImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Post post) createPost,
    required TResult Function() getPosts,
    required TResult Function() getWeather,
  }) {
    return createPost(post);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Post post)? createPost,
    TResult? Function()? getPosts,
    TResult? Function()? getWeather,
  }) {
    return createPost?.call(post);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Post post)? createPost,
    TResult Function()? getPosts,
    TResult Function()? getWeather,
    required TResult orElse(),
  }) {
    if (createPost != null) {
      return createPost(post);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreatePost value) createPost,
    required TResult Function(GetPosts value) getPosts,
    required TResult Function(GetWeather value) getWeather,
  }) {
    return createPost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreatePost value)? createPost,
    TResult? Function(GetPosts value)? getPosts,
    TResult? Function(GetWeather value)? getWeather,
  }) {
    return createPost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreatePost value)? createPost,
    TResult Function(GetPosts value)? getPosts,
    TResult Function(GetWeather value)? getWeather,
    required TResult orElse(),
  }) {
    if (createPost != null) {
      return createPost(this);
    }
    return orElse();
  }
}

abstract class CreatePost implements PostcreationEvent {
  const factory CreatePost(final Post post) = _$CreatePostImpl;

  Post get post;

  /// Create a copy of PostcreationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatePostImplCopyWith<_$CreatePostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetPostsImplCopyWith<$Res> {
  factory _$$GetPostsImplCopyWith(
          _$GetPostsImpl value, $Res Function(_$GetPostsImpl) then) =
      __$$GetPostsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetPostsImplCopyWithImpl<$Res>
    extends _$PostcreationEventCopyWithImpl<$Res, _$GetPostsImpl>
    implements _$$GetPostsImplCopyWith<$Res> {
  __$$GetPostsImplCopyWithImpl(
      _$GetPostsImpl _value, $Res Function(_$GetPostsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostcreationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetPostsImpl implements GetPosts {
  const _$GetPostsImpl();

  @override
  String toString() {
    return 'PostcreationEvent.getPosts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetPostsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Post post) createPost,
    required TResult Function() getPosts,
    required TResult Function() getWeather,
  }) {
    return getPosts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Post post)? createPost,
    TResult? Function()? getPosts,
    TResult? Function()? getWeather,
  }) {
    return getPosts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Post post)? createPost,
    TResult Function()? getPosts,
    TResult Function()? getWeather,
    required TResult orElse(),
  }) {
    if (getPosts != null) {
      return getPosts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreatePost value) createPost,
    required TResult Function(GetPosts value) getPosts,
    required TResult Function(GetWeather value) getWeather,
  }) {
    return getPosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreatePost value)? createPost,
    TResult? Function(GetPosts value)? getPosts,
    TResult? Function(GetWeather value)? getWeather,
  }) {
    return getPosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreatePost value)? createPost,
    TResult Function(GetPosts value)? getPosts,
    TResult Function(GetWeather value)? getWeather,
    required TResult orElse(),
  }) {
    if (getPosts != null) {
      return getPosts(this);
    }
    return orElse();
  }
}

abstract class GetPosts implements PostcreationEvent {
  const factory GetPosts() = _$GetPostsImpl;
}

/// @nodoc
abstract class _$$GetWeatherImplCopyWith<$Res> {
  factory _$$GetWeatherImplCopyWith(
          _$GetWeatherImpl value, $Res Function(_$GetWeatherImpl) then) =
      __$$GetWeatherImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetWeatherImplCopyWithImpl<$Res>
    extends _$PostcreationEventCopyWithImpl<$Res, _$GetWeatherImpl>
    implements _$$GetWeatherImplCopyWith<$Res> {
  __$$GetWeatherImplCopyWithImpl(
      _$GetWeatherImpl _value, $Res Function(_$GetWeatherImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostcreationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetWeatherImpl implements GetWeather {
  const _$GetWeatherImpl();

  @override
  String toString() {
    return 'PostcreationEvent.getWeather()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetWeatherImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Post post) createPost,
    required TResult Function() getPosts,
    required TResult Function() getWeather,
  }) {
    return getWeather();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Post post)? createPost,
    TResult? Function()? getPosts,
    TResult? Function()? getWeather,
  }) {
    return getWeather?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Post post)? createPost,
    TResult Function()? getPosts,
    TResult Function()? getWeather,
    required TResult orElse(),
  }) {
    if (getWeather != null) {
      return getWeather();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreatePost value) createPost,
    required TResult Function(GetPosts value) getPosts,
    required TResult Function(GetWeather value) getWeather,
  }) {
    return getWeather(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreatePost value)? createPost,
    TResult? Function(GetPosts value)? getPosts,
    TResult? Function(GetWeather value)? getWeather,
  }) {
    return getWeather?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreatePost value)? createPost,
    TResult Function(GetPosts value)? getPosts,
    TResult Function(GetWeather value)? getWeather,
    required TResult orElse(),
  }) {
    if (getWeather != null) {
      return getWeather(this);
    }
    return orElse();
  }
}

abstract class GetWeather implements PostcreationEvent {
  const factory GetWeather() = _$GetWeatherImpl;
}

/// @nodoc
mixin _$PostcreationState {
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get postCreated => throw _privateConstructorUsedError;
  List<Post> get posts => throw _privateConstructorUsedError;
  Weather? get weather => throw _privateConstructorUsedError;

  /// Create a copy of PostcreationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostcreationStateCopyWith<PostcreationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostcreationStateCopyWith<$Res> {
  factory $PostcreationStateCopyWith(
          PostcreationState value, $Res Function(PostcreationState) then) =
      _$PostcreationStateCopyWithImpl<$Res, PostcreationState>;
  @useResult
  $Res call(
      {String? errorMessage,
      bool postCreated,
      List<Post> posts,
      Weather? weather});
}

/// @nodoc
class _$PostcreationStateCopyWithImpl<$Res, $Val extends PostcreationState>
    implements $PostcreationStateCopyWith<$Res> {
  _$PostcreationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostcreationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? postCreated = null,
    Object? posts = null,
    Object? weather = freezed,
  }) {
    return _then(_value.copyWith(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      postCreated: null == postCreated
          ? _value.postCreated
          : postCreated // ignore: cast_nullable_to_non_nullable
              as bool,
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      weather: freezed == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $PostcreationStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? errorMessage,
      bool postCreated,
      List<Post> posts,
      Weather? weather});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PostcreationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostcreationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? postCreated = null,
    Object? posts = null,
    Object? weather = freezed,
  }) {
    return _then(_$InitialImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      postCreated: null == postCreated
          ? _value.postCreated
          : postCreated // ignore: cast_nullable_to_non_nullable
              as bool,
      posts: null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      weather: freezed == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.errorMessage,
      required this.postCreated,
      required final List<Post> posts,
      required this.weather})
      : _posts = posts;

  @override
  final String? errorMessage;
  @override
  final bool postCreated;
  final List<Post> _posts;
  @override
  List<Post> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  final Weather? weather;

  @override
  String toString() {
    return 'PostcreationState(errorMessage: $errorMessage, postCreated: $postCreated, posts: $posts, weather: $weather)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.postCreated, postCreated) ||
                other.postCreated == postCreated) &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.weather, weather) || other.weather == weather));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage, postCreated,
      const DeepCollectionEquality().hash(_posts), weather);

  /// Create a copy of PostcreationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements PostcreationState {
  const factory _Initial(
      {required final String? errorMessage,
      required final bool postCreated,
      required final List<Post> posts,
      required final Weather? weather}) = _$InitialImpl;

  @override
  String? get errorMessage;
  @override
  bool get postCreated;
  @override
  List<Post> get posts;
  @override
  Weather? get weather;

  /// Create a copy of PostcreationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
