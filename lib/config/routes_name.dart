enum RoutesName {
  login,
  signUp,

  profilePage,
  postCreationScreen,
  postListScreen
}

extension RoutesNameHelper on RoutesName {
  String get name {
    switch (this) {
      case RoutesName.login:
        return 'login';
      case RoutesName.signUp:
        return 'signUp';

      case RoutesName.profilePage:
        return 'profilePage';
      case RoutesName.postCreationScreen:
        return 'postCreationScreen';
      case RoutesName.postListScreen:
        return 'postListScreen';
    }
  }

  String get path {
    switch (this) {
      case RoutesName.login:
        return '/login';
      case RoutesName.signUp:
        return '/signUp';

      case RoutesName.profilePage:
        return '/profilePage';
      case RoutesName.postCreationScreen:
        return '/postCreationScreen';
      case RoutesName.postListScreen:
        return '/postListScreen';
    }
  }
}
