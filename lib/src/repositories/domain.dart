import 'package:e_commerce/src/repositories/sign_repository.dart';

import 'account_repository.dart';

class Domain {
  static Domain? _internal;
  Domain._() {
    account = AccountRepositoryImpl();
    sign = SignRepositoryImpl();
  }
  factory Domain() {
    _internal ??= Domain._();
    return _internal!;
  }

  late final AccountRepository account;
  late final SignRepository sign;
}
