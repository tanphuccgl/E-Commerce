import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/models/user_model.dart';
import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'setting_state.dart';

class SettingBloc extends AccountBloc<SettingState> {
  SettingBloc(SettingState initialState) : super(initialState);

  void changedName(String name) {
    emit(state.copyWith(name: name.trimLeft(), pureName: true));
  }

  void changedBirthDay(String day) {
    emit(state.copyWith(birthDay: day.trimLeft(), pureBirthDay: true));
  }

  void saveInformation(BuildContext context) async {
    if (state.isValidChangeInfo) {
      var value = await domain.profile
          .updateInfo(name: state.name, birthDay: state.birthDay);
      if (value.isSuccess) {
        context.read<AccountBloc>().setDataLogin(user: value.data);
        XCoordinator.pop(context);

        XSnackBar.show(msg: "Successfully changed information");
      } else {
        XSnackBar.show(msg: "change information failed");
      }
    }
  }
}
