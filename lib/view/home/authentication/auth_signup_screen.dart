import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:superior_comp/app/constant/auth_exception_handling.dart';
import 'package:superior_comp/app/constant/controllers.dart';
import 'package:superior_comp/app/constant/image_paths.dart';
import 'package:superior_comp/app/constant/imp.dart';
import 'package:superior_comp/app/utils/colors.dart';
import 'package:superior_comp/view/authentication/auth_controller.dart';
import 'package:superior_comp/view/components/auth_button.dart';
import 'package:superior_comp/view/components/auth_textfield.dart';
import 'package:superior_comp/app/constant/custom_snackbar.dart';
class AuthSignUpScreen extends StatefulWidget {
  const AuthSignUpScreen({Key? key}) : super(key: key);

  @override
  _AuthSignUpScreenState createState() => _AuthSignUpScreenState();
}

class _AuthSignUpScreenState extends State<AuthSignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final numberController = TextEditingController();
  final countryController = TextEditingController(text: "HEYGEYH");
  final passwordController = TextEditingController();

  String countrySelected = '';
  DateTime selectedDate = DateTime.now();
  bool obSecureText = true;
  final authController = Get.put(AuthController());
  void _trySubmit() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid ) {
      // CALL LOGIN METHOD

      if(countrySelected != '' && selectedDate != DateTime.now()){
        final status = await authController.createUser(
          emailController.text.trim(),
          passwordController.text,
          '', ''
        );

        if (status == AuthResultStatus.successful) {
          Get.back();
          CustomSnackBar.showSnackBar(
              title: "Account created Successfully",
              message: '',
              backgroundColor: snackBarSuccess);
        } else {
          final errorMsg = AuthExceptionHandler.generateExceptionMessage(status);
          CustomSnackBar.showSnackBar(
              title: errorMsg, message: '', backgroundColor: snackBarError);
        }
      }else{
        Fluttertoast.showToast(
            msg: "Please select date/country",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                        _buildUsernameField(),
                        _buildPhoneField(),
                        _buildCountryField(),
                        _buildDateField(),
                        _buildPasswordField(),
                        SizedBox(
                          height: 0.03.sh,
                        ),
                        _buildSignUpButton(),
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
      ),
    );
  }

  Widget _buildEmailField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: AuthTextField(
        controller: emailController,
        borderRadius: authTextFieldContainerBorderRadius,
        containerBoxColor: authTextFieldContainerColor,
        hintText: 'Email',
        suffixIcon: const SizedBox.shrink(),
        keyType: TextInputType.emailAddress,
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
        enabled: true,
      ),
    );
  }

  Widget _buildUsernameField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: AuthTextField(
        controller: usernameController,
        borderRadius: authTextFieldContainerBorderRadius,
        containerBoxColor: authTextFieldContainerColor,
        hintText: 'Username',
        suffixIcon: const SizedBox.shrink(),
        keyType: TextInputType.name,
        validator: (str) {
          if (str == null || str == '') {
            return "Username is required";
          }
          return null;
        },
        obSecureText: false,
        action: TextInputAction.next,
        enabled: true,
      ),
    );
  }

  Widget _buildPhoneField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: AuthTextField(
        controller: numberController,
        borderRadius: authTextFieldContainerBorderRadius,
        containerBoxColor: authTextFieldContainerColor,
        hintText: 'Phone Number',
        suffixIcon: const SizedBox.shrink(),
        keyType: TextInputType.phone,
        validator: (str) {
          if (str == null || str == '') {
            return "Phone Number is required";
          }
          return null;
        },
        obSecureText: false,
        action: TextInputAction.next,
        enabled: true,
      ),
    );
  }

  Widget _buildCountryField() {
    return GestureDetector(
      onTap: () {
        showCountryPicker(
          context: context,
          showPhoneCode: false,
          // optional. Shows phone code before the country name.
          onSelect: (Country country) {
            print('Select country: ${country.name}');
            countryController.text = country.name;
            setState(() {
              countrySelected = country.name;
            });
          },
        );
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Select Country: ",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                width: 0.01.sw,
              ),
              Text(
                countrySelected,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontSize: 13.sp),
              ),
            ],
          )),
    );
  }

  Widget _buildDateField() {
    return GestureDetector(
      onTap: () {
        DatePicker.showDatePicker(
          context,
          showTitleActions: true,
          minTime: DateTime(1990, 1, 1),
          maxTime: DateTime.now(),
          onChanged: (date) {},
          onConfirm: (date) {
            setState(() {
              selectedDate = date;
            });
          },
          currentTime: DateTime.now(),
        );
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Select Date: ",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                width: 0.01.sw,
              ),
              Text(
                DateFormat('yyyy-MM-dd').format(selectedDate),
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontSize: 13.sp),
              ),
            ],
          )),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: AuthTextField(
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
        enabled: true,
      ),
    );
  }

  Widget _buildSignUpButton() {
    return AuthButton(
      onPressed: _trySubmit,
      buttonText: 'SIGN UP',
    );
  }
}
