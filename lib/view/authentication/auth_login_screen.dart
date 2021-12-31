import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:superior_comp/app/constant/auth_exception_handling.dart';
import 'package:superior_comp/app/constant/controllers.dart';
import 'package:superior_comp/app/constant/custom_snackbar.dart';
import 'package:superior_comp/app/constant/image_paths.dart';
import 'package:superior_comp/app/constant/imp.dart';
import 'package:superior_comp/app/router/router_generator.dart';
import 'package:superior_comp/app/utils/colors.dart';
import 'package:superior_comp/view/authentication/auth_controller.dart';
import 'package:superior_comp/view/components/auth_button.dart';
import 'package:superior_comp/view/components/auth_social_button.dart';
import 'package:superior_comp/view/components/auth_textfield.dart';


class AuthLoginScreen extends StatefulWidget {
  const AuthLoginScreen({Key? key}) : super(key: key);

  @override
  State<AuthLoginScreen> createState() => _AuthLoginScreenState();
}

class _AuthLoginScreenState extends State<AuthLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obSecureText = true;

  final authController = Get.put(AuthController());

  void _trySubmit() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      // CALL LOGIN METHOD
      final status =
      await authController.loginUser(emailController.text.trim(), passwordController.text);
      if (status == AuthResultStatus.successful) {
        navigationController.getOffAll(customDrawer);
        CustomSnackBar.showSnackBar(
            title: "Login Successful",
            message: '',
            backgroundColor: snackBarSuccess);
      } else {
        final errorMsg = AuthExceptionHandler.generateExceptionMessage(status);
        CustomSnackBar.showSnackBar(
            title: errorMsg, message: '', backgroundColor: snackBarError);
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Positioned(
                top: 0.05.sh,
                left: 0.02.sw,
                child: GestureDetector(
                    onTap: () => navigationController.goBack(),
                    child: Image.asset(
                      ImagePaths.backArrow,
                      color: primaryColor,
                    )),
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 0.1.sh,
                      ),
                      Image.asset(ImagePaths.shopkoLogo),
                      SizedBox(
                        height: 0.01.sh,
                      ),
                      _buildEmailField(),
                      _buildPasswordField(),
                      SizedBox(
                        height: 0.03.sh,
                      ),
                      _buildLoginButton(),

                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 0.03.sh),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              indent: 0.05.sw,
                              endIndent: 0.05.sw,
                            ),
                          ),
                          _buildSignUpText(),
                          Expanded(
                            child: Divider(
                              indent: 0.05.sw,
                              endIndent: 0.05.sw,
                            ),
                          ),
                        ],
                      ),


                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: AuthTextField(
        enabled: true,
        controller: emailController,
        borderRadius: authTextFieldContainerBorderRadius,
        containerBoxColor: authTextFieldContainerColor,
        hintText: 'Email',
        suffixIcon: const SizedBox.shrink(),
        keyType: TextInputType.name,
        validator: (str) {
          if (str == null || str == '') {
            return "Email is required";
          } else if (!emailValidate.hasMatch(str)) {
            return "Email is not valid";
          }
          return null;
        },
        obSecureText: false,
        action: TextInputAction.next,
      ),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: AuthTextField(
        enabled: true,
        controller: passwordController,
        borderRadius: authTextFieldContainerBorderRadius,
        containerBoxColor: authTextFieldContainerColor,
        hintText: 'Password',
        suffixIcon: IconButton(
          splashRadius: 0.1,
          onPressed: () => setState(() => obSecureText = !obSecureText),
          icon: obSecureText
              ? const Icon(
                  Icons.visibility,
                )
              : const Icon(
                  Icons.visibility_off,
                ),
        ),
        validator: (str) {
          if (str == null || str == '') {
            return "Password is required";
          }
          return null;
        },
        action: TextInputAction.done,
        obSecureText: obSecureText,
        keyType: TextInputType.text,
      ),
    );
  }

  Widget _buildLoginButton() {
    return AuthButton(
      onPressed: _trySubmit,
      buttonText: 'LOGIN',
    );
  }

  Widget _buildSignUpText() {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: "Don't have an account? ",
          style: Theme.of(context).textTheme.headline2?.copyWith(
                color: Colors.black,
              ),
        ),
        TextSpan(
          text: "Signup",
          recognizer: TapGestureRecognizer()
            ..onTap = () {
             navigationController.navigateToNamed(authSignUpScreen);
            },
          style: Theme.of(context).textTheme.headline2?.copyWith(
              color: primaryColor, decoration: TextDecoration.underline, fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}
