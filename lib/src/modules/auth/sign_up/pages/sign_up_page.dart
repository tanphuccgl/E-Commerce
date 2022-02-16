import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/auth/login/router/sign_router.dart';
import 'package:e_commerce/src/modules/auth/sign_up/logic/sign_up_bloc.dart';

import 'package:e_commerce/src/modules/auth/widgets/app_bar_sign.dart';
import 'package:e_commerce/src/modules/auth/widgets/bottom_sign.dart';
import 'package:e_commerce/src/modules/auth/widgets/header_sign.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:e_commerce/src/widgets/text_button/text_button_custom.dart';
import 'package:e_commerce/src/widgets/text_form_field/base_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late bool obscureText;
  @override
  void initState() {
    obscureText = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const paddingHori = 16.0;

    final sizeHeightBody = size.height -
        MediaQuery.of(context).padding.bottom -
        MediaQuery.of(context).padding.top;

    return BlocProvider(
        create: (context) => SignUpBloc(),
        child: BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) {
            return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: const AppBarSign(),
                body: SingleChildScrollView(
                  child: SizedBox(
                    height: sizeHeightBody,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: paddingHori),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const HeaderSign(
                            title: "Sign up",
                          ),
                          Column(
                            children: [
                              XTextFormField(
                                label: "Name",
                                suffixIcon: state.name.isNotEmpty
                                    ? IconButton(
                                        icon: const Icon(
                                          Icons.cancel,
                                          color: MyColors.colorGray,
                                        ),
                                        onPressed: () {
                                          context
                                              .read<SignUpBloc>()
                                              .clear(SignUpParam.name);
                                        },
                                      )
                                    : null,
                                textInputType: TextInputType.name,
                                errorText: state.isValidName,
                                onChanged: (value) => context
                                    .read<SignUpBloc>()
                                    .changedName(value),
                              ),
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
                                              .read<SignUpBloc>()
                                              .clear(SignUpParam.email);
                                        },
                                      )
                                    : null,
                                textInputType: TextInputType.emailAddress,
                                errorText: state.isValidEmail,
                                onChanged: (value) => context
                                    .read<SignUpBloc>()
                                    .changedEmail(value),
                              ),
                              XTextFormField(
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
                                label: "Password",
                                obscureText: obscureText,
                                errorText: state.isValidPassword,
                                onChanged: (value) => context
                                    .read<SignUpBloc>()
                                    .changePassword(value),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: XTextButtonCus(
                                  title: "Already have an account?",
                                  onPressed: () {
                                    SignCoordinator.showLogin(context);
                                  },
                                ),
                              ),
                              state.isLoading
                                  ? const CircularProgressIndicator()
                                  : XButton(
                                      width: size.width,
                                      label: "SIGN UP",
                                      onPressed: () {
                                        context
                                            .read<SignUpBloc>()
                                            .createAccount(context);
                                      },
                                      height: 48,
                                    ),
                              state.messageError.isEmpty
                                  ? const SizedBox.shrink()
                                  : Center(
                                      child: Text(
                                      state.messageError,textAlign: TextAlign.center, 
                                      style: const TextStyle(
                                          color: MyColors.colorPrimary,fontWeight: FontWeight.w500),
                                    ))
                            ],
                          ),
                          const Spacer(),
                          const BottomSign(
                            title: "Or sign up with social account",
                          ),
                          const SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                ));
          },
        ));
  }
}
