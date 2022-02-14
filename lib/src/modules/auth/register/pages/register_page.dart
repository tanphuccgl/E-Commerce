import 'package:e_commerce/src/modules/auth/login/router/sign_router.dart';
import 'package:e_commerce/src/modules/auth/login/widgets/bottom_sign.dart';
import 'package:e_commerce/src/modules/auth/login/widgets/header_sign.dart';
import 'package:e_commerce/src/modules/auth/login/widgets/app_bar_sign.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:e_commerce/src/widgets/text_button/text_button_custom.dart';
import 'package:e_commerce/src/widgets/text_form_field/base_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final paddingHori = size.width / 20;
    const textButton = "Already have an account?";
    const labelSignUp = "SIGN UP";
    const titleBottom = "Or sign up with social account";
    const titleHeader = "SIGN UP";
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final sizeHeightBody = size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
        backgroundColor: Colors.white54,
        appBar: const AppBarSign(),
        body: SingleChildScrollView(
          child: SizedBox(
            height: sizeHeightBody,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingHori),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                      flex: 2,
                      child: HeaderSign(
                        title: titleHeader,
                      )),
                  Expanded(
                    flex: 6,
                    child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            XTextFormField(
                                controller: _nameController,
                                label: "Name",
                                textInputType: TextInputType.name,
                                validator: (String? value) {
                                  return "";
                                }),
                            XTextFormField(
                                controller: _emailController,
                                label: "Email",
                                textInputType: TextInputType.emailAddress,
                                validator: (String? value) {
                                  return "";
                                }),
                            XTextFormField(
                                controller: _passwordController,
                                label: "Password",
                                obscureText: true,
                                validator: (String? value) {
                                  return "";
                                }),
                            Align(
                              alignment: Alignment.centerRight,
                              child: XTextButtonCus(
                                title: textButton,
                                onPressed: () {},
                              ),
                            ),
                            XButton(
                              width: size.width,
                              label: labelSignUp,
                              onPressed: () {
                                SignCoordinator.showSignIn(context);
                              },
                              height: 45,
                            ),
                          ],
                        )),
                  ),
                  const Expanded(
                      flex: 2,
                      child: BottomSign(
                        title: titleBottom,
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
