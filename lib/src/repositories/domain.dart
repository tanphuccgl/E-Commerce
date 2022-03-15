import 'package:e_commerce/src/repositories/features/account/repo.dart';
import 'package:e_commerce/src/repositories/features/account/repo_impl.dart';
import 'package:e_commerce/src/repositories/features/favorite/repo.dart';
import 'package:e_commerce/src/repositories/features/favorite/repo_impl.dart';
import 'package:e_commerce/src/repositories/features/profile/repo.dart';
import 'package:e_commerce/src/repositories/features/profile/repo_impl.dart';
import 'package:e_commerce/src/repositories/features/categories/repo.dart';
import 'package:e_commerce/src/repositories/features/categories/repo_impl.dart';
import 'package:e_commerce/src/repositories/features/product/repo.dart';
import 'package:e_commerce/src/repositories/features/product/repo_impl.dart';
import 'package:e_commerce/src/repositories/features/sign/repo.dart';
import 'package:e_commerce/src/repositories/features/sign/repo_impl.dart';

class Domain {
  static Domain? _internal;
  Domain._() {
    account = AccountRepositoryImpl();
    sign = SignRepositoryImpl();
    profile = ProfileRepositoryImpl();
    product = ProductRepositoryImpl();
    category = CategoryRepositoryImpl();
    favorite = FavoriteRepositoryImpl();
  }
  factory Domain() {
    _internal ??= Domain._();
    return _internal!;
  }

  late final AccountRepository account;
  late final SignRepository sign;
  late final ProfileRepository profile;
  late final ProductRepository product;
  late final CategoryRepository category;
  late final FavoriteRepository favorite;
}
