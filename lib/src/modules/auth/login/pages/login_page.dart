import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/auth/login/logic/login_bloc.dart';
import 'package:e_commerce/src/modules/auth/widgets/app_bar_sign.dart';
import 'package:e_commerce/src/modules/auth/widgets/bottom_sign.dart';
import 'package:e_commerce/src/modules/auth/widgets/header_sign.dart';

import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:e_commerce/src/widgets/text_button/text_button_custom.dart';
import 'package:e_commerce/src/widgets/text_field/base_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final paddingHori = size.width / 20;

    final height = size.height -
        MediaQuery.of(context).padding.bottom -
        MediaQuery.of(context).padding.top;
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: const AppBarSign(),
            body: SingleChildScrollView(
              child: SizedBox(
                height: height,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: paddingHori),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      const HeaderSign(title: "Login"),
                      Column(
                        children: [
                          XTextField(
                            label: "Email",
                            value: state.email,
                            textInputType: TextInputType.emailAddress,
                            errorText: state.isValidEmail,
                            onChanged: (value) =>
                                context.read<LoginBloc>().changedEmail(value),
                          ),
                          XTextField(
                            label: "Password",
                            value: state.password,
                            obscureText: true,
                            errorText: state.isValidPassword,
                            onChanged: (value) => context
                                .read<LoginBloc>()
                                .changedPassword(value),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: XTextButtonCus(
                              title: "Forgot your password?",
                              onPressed: () {},
                            ),
                          ),
                          state.isLoading
                              ? const CircularProgressIndicator()
                              : XButton(
                                  width: size.width,
                                  label: "LOGIN",
                                  onPressed: state.isValidLogin
                                      ? () => context
                                          .read<LoginBloc>()
                                          .loginWithEmailAndPassword(
                                            context,
                                          )
                                      : null,
                                  height: 48,
                                ),
                          state.messageError.isEmpty
                              ? const SizedBox.shrink()
                              : Center(
                                  child: Text(
                                  state.messageError,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: MyColors.colorPrimary,
                                      fontWeight: FontWeight.w500),
                                ))
                        ],
                      ),
                      const Spacer(),
                      BottomSign(
                          title: "Or login with social account",
                          onClickGoogle: () =>
                              context.read<LoginBloc>().withGoogle(context)),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ));
      }),
    );
  }
}
