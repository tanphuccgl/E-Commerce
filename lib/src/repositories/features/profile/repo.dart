import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/user_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProfileRepository {
  Future<XResult<XUser>> uploadAvatar(XFile image);
    Future<XResult<XUser>> updateInfo({String name, String birthDay });


}
