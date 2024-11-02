class MainFailures {
  final String message;

  MainFailures._(this.message);

  factory MainFailures.authFailure() => MainFailures._('Authentication failed');
  factory MainFailures.serverFailure() =>
      MainFailures._('Server error occurred');
  factory MainFailures.cancelledByUser() =>
      MainFailures._('Sign-in cancelled by user');
}
