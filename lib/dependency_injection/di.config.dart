// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../application/auth_screen/bloc/authscreen_bloc.dart' as _i554;
import '../application/post/bloc/postcreation_bloc.dart' as _i701;
import '../data/auth_screen/auth_screen_repo_impl.dart' as _i882;
import '../data/post/post_repo_impl.dart' as _i746;
import '../domain/repository/auth_screen/auth_screen_repo.dart' as _i20;
import '../domain/repository/post/post_repo.dart' as _i825;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i20.AuthScreenRepo>(() => _i882.AuthScreenRepoImpl());
    gh.lazySingleton<_i825.PostRepo>(() => _i746.PostRepoImpl());
    gh.factory<_i554.AuthscreenBloc>(
        () => _i554.AuthscreenBloc(gh<_i20.AuthScreenRepo>()));
    gh.factory<_i701.PostcreationBloc>(
        () => _i701.PostcreationBloc(gh<_i825.PostRepo>()));
    return this;
  }
}
