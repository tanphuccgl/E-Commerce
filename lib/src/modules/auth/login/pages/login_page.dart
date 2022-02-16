import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/auth/login/logic/login_bloc.dart';
import 'package:e_commerce/src/modules/auth/widgets/app_bar_sign.dart';
import 'package:e_commerce/src/modules/auth/widgets/bottom_sign.dart';
import 'package:e_commerce/src/modules/auth/widgets/header_sign.dart';

import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:e_commerce/src/widgets/text_button/text_button_custom.dart';
import 'package:e_commerce/src/widgets/text_form_field/base_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bool obscureText;
  @override
  void initState() {
    obscureText = true;
    super.initState();
  }

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
                          XTextFormField(
                            label: "Email",
                            suffixIcon: state.email.isNotEmpty
                                ? IconButton(
                                    icon: const Icon(
                                      Icons.cancel,
                                      color: MyColors.colorGray,
                                    ),
                                    onPressed: () {
                                      context
                                          .read<LoginBloc>()
                                          .clear(param: LoginParam.email);
                                    },
                                  )
                                : null,
                            textInputType: TextInputType.emailAddress,
                            errorText: state.isValidEmail,
                            onChanged: (value) =>
                                context.read<LoginBloc>().changedEmail(value),
                          ),
                          XTextFormField(
                            label: "Password",
                            obscureText: obscureText,
                            suffixIcon: IconButton(
                              icon: Icon(
                                obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: MyColors.colorGray,
                              ),
                              onPressed: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                            ),
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
                                  onPressed: () {
                                    context.read<LoginBloc>().login(context);
                                  },
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
