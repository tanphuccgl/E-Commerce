import 'login_repository.dart';

class Domain {
  static Domain? _internal;
  Domain._() {
    login = LoginRepositoryImpl();
  }
  factory Domain() {
    _internal ??= Domain._();
    return _internal!;
  }

  late final LoginRepository login;
}
