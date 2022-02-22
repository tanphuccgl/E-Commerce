import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/user_model.dart';

abstract class AccountRepository {
  Future<XResult<XUser>> getCurrentUser();
}
