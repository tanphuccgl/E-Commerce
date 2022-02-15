import 'package:e_commerce/src/modules/auth/login/logic/login_bloc.dart';
import 'package:e_commerce/src/modules/auth/widgets/app_bar_sign.dart';
import 'package:e_commerce/src/modules/auth/widgets/bottom_sign.dart';
import 'package:e_commerce/src/modules/auth/widgets/header_sign.dart';

import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:e_commerce/src/widgets/text_button/text_button_custom.dart';
import 'package:e_commerce/src/widgets/text_form_field/base_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final paddingHori = size.width / 20;
    final _formKey = GlobalKey<FormState>();

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
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              XTextFormField(
                                label: "Email",
                                textInputType: TextInputType.emailAddress,
                                errorText:  state.isValidEmail
                                    ? ""
                                    : "invalid email",
                                onChanged: (value) => context
                                    .read<LoginBloc>()
                                    .changedEmail(value),
                              ),
                              XTextFormField(
                                label: "Password",
                                obscureText: true,
                                errorText:  state.isValidPassword
                                    ? ""
                                    : "invalid password",
                                onChanged: (value) => context
                                    .read<LoginBloc>()
                                    .changePassword(value),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: XTextButtonCus(
                                  title: "Forgot your password?",
                                  onPressed: () {},
                                ),
                              ),
                              XButton(
                                width: size.width,
                                label: "LOGIN",
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context
                                        .read<LoginBloc>()
                                        .login();
                                  }
                                },
                                height: 48,
                              ),
                            ],
                          )),
                      const Spacer(),
                      const BottomSign(title: "Or login with social account"),
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
