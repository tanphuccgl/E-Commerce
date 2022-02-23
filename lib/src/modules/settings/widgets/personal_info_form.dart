import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/widgets/text_field/base_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInfoForm extends StatelessWidget {
  const PersonalInfoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<AccountBloc, AccountState>(builder: (context, state) {
      var name = state.data.name ?? 'N/A';
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Personal Information",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: MyColors.colorBlack),
          ),
          SizedBox(
            height: size.height * 0.026,
          ),
          XTextField(
              label: "Full name",
              value: name,
              textInputType: TextInputType.name,
              errorText: "Error",
              onChanged: (value) {}),
          XTextField(
              label: "Date of Birth",
              value: "empty",
              textInputType: TextInputType.datetime,
              errorText: "Error",
              onChanged: (value) {}),
        ],
      );
    });
  }
}
