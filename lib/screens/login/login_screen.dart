
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  final LoginController _loginController = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          resizeToAvoidBottomInset: false,
          body:  Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              //padding: EdgeInsets.only(left: 5.w, right: 5.w),
              color: Theme.of(context).colorScheme.onPrimary,
              child: Center(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                      /*children: [
                        Container(
                          height: 7.h,
                            width: 65.w,
                            margin: EdgeInsets.only(top: 5.h, bottom: 3.h),
                            child: Image.asset('assets/images/main_logo.png',
                              fit: BoxFit.fill,
                            )),
                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                          child:
                          Container(
                              padding: EdgeInsets.only(
                                  top: 2.h,
                                  left: 6.w,
                                  right: 5.w),
                              height: 48.h,
                              child:
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      'WELCOME !',
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        color: Theme.of(context).colorScheme.primary,)
                                  ),),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 4.h)),

                                  Text('Email', style: Theme.of(context).textTheme.bodyLarge,),
                                  /// Email
                                  Container(
                                    width:  77.w,
                                    height: 5.5.h,
                                    margin: EdgeInsets.only(
                                      top: 2.h,
                                    ),
                                    child: TextField(
                                      controller: emailTextController,
                                      focusNode: emailFocus,
                                      keyboardType: TextInputType.emailAddress,
                                      onEditingComplete: () {
                                        passwordFocus.requestFocus();
                                      },
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                          color: Theme.of(context).primaryColorDark,fontWeight: FontWeight.w500 ),
                                      onChanged: (value) {
                                        _loginController.emailOnChanged();
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Theme.of(context).shadowColor),
                                            borderRadius:
                                            BorderRadius.circular(0.5.h)),
                                        hintText: 'Axxxxaxa@carediary.au',
                                        hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                            color: (_loginController.emailEmptyError.value ||
                                                _loginController.emailValidError.value)
                                                ? Theme.of(context).colorScheme.onPrimary
                                                : Theme.of(context).shadowColor,fontWeight: FontWeight.w500 ),

                                        enabledBorder: (_loginController.emailEmptyError.value ||
                                            _loginController.emailValidError.value)
                                            ? OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Theme.of(context).colorScheme.error),
                                            borderRadius:
                                            BorderRadius.circular(0.5.h))
                                            : OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Theme.of(context).shadowColor),
                                            borderRadius:
                                            BorderRadius.circular(0.5.h)),
                                        contentPadding: EdgeInsets.only(
                                          left: 2.w,
                                        ),
                                        focusedBorder: (_loginController.emailValidError.value ||
                                            _loginController.emailEmptyError.value)
                                            ? OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Theme.of(context).colorScheme.error),
                                            borderRadius:
                                            BorderRadius.circular(0.5.h))
                                            : null,
                                      ),
                                    ),
                                  ),

                                  (_loginController.emailEmptyError.value)?
                                  Offstage(
                                    offstage: !_loginController.emailEmptyError.value,
                                    child: Container(
                                      height: 2.6.h,
                                      padding: EdgeInsets.only(
                                          left: 2.w, top: 0.8.h),
                                      child: Text(
                                        'Required',
                                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                            color: Theme.of(context).colorScheme.error,
                                            fontWeight: FontWeight.w400)
                                      ),
                                    ),
                                  )
                                      : SizedBox(
                                      height: 1.7.h),

                                  Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 1.h)),

                                  Text('Password', style: Theme.of(context).textTheme.bodyLarge,),
                                  /// Password
                                  Container(
                                      width: 77.w,
                                      height: 5.5.h,
                                      margin: EdgeInsets.only(
                                          top: 1.h),
                                      child: TextField(
                                        controller: passwordTextController,
                                        focusNode: passwordFocus,
                                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                          color: Theme.of(context).primaryColorDark,
                                        ),
                                        obscureText:
                                        (_loginController.passwordVisible.value) ? false : true,
                                        enableSuggestions: false,
                                        autocorrect: false,
                                        onChanged: (value) {
                                          _loginController.passwordOnChanged();
                                          if(passwordTextController.value.text.isEmpty){
                                            _loginController.iconHide();
                                          }
                                          else if(passwordTextController.value.text.isNotEmpty){
                                            _loginController.iconShow();
                                          }
                                        },

                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(),
                                          hintText: '********',
                                          hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                            color: (_loginController.passwordEmptyError.value)
                                                ? Theme.of(context).colorScheme.onPrimary
                                                : Theme.of(context).shadowColor,
                                            fontWeight: FontWeight.w500,
                                          ),

                                          suffixIcon:
                                          (_loginController.iconVisible.value)?
                                          IconButton(
                                            icon: Icon(
                                              // Based on passwordVisible state choose the icon
                                              _loginController.passwordVisible.value
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: (_loginController.passwordEmptyError.value ||
                                                  _loginController.passwordValidError.value)
                                                  ? Theme.of(context).colorScheme.error
                                                  : null,
                                            ),
                                            onPressed: () {
                                                if(passwordTextController.text.isNotEmpty){
                                                  _loginController.passwordVisible.value = !_loginController.passwordVisible.value;
                                                }
                                            },
                                          )
                                          :
                                              const SizedBox(),
                                          enabledBorder: (_loginController.passwordEmptyError.value ||
                                              _loginController.passwordValidError.value)
                                              ? OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:Theme.of(context).colorScheme.error),
                                              borderRadius:
                                              BorderRadius.circular(
                                                  0.5.h))
                                              : OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Theme.of(context).shadowColor),
                                              borderRadius:
                                              BorderRadius.circular(0.5.h)),
                                          contentPadding: EdgeInsets.only(
                                            left: 2.w,
                                          ),
                                          focusedBorder: (_loginController
                                              .passwordValidError.value ||
                                              _loginController.passwordEmptyError.value)
                                              ? OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Theme.of(context).colorScheme.error),
                                              borderRadius:
                                              BorderRadius.circular(
                                                  0.5.h))
                                              : null,
                                        ),
                                      )),

                                  (_loginController.passwordEmptyError.value)
                                      ? Offstage(
                                    offstage: !_loginController.passwordEmptyError.value,
                                    child: Container(
                                      height: 3.3.h,
                                      padding: EdgeInsets.only(
                                          left: 2.w,
                                          bottom: 0.5.h,
                                          top: 0.8.h),
                                      child: Text(
                                        'Required',
                                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                            color: Theme.of(context).colorScheme.error,
                                            fontWeight: FontWeight.w400)
                                      ),
                                    ),
                                  )
                                      : SizedBox(
                                      height: 2.4.h),

                                  /// Forgot Password
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                              onPressed: () {
                                                Util.hideKeyboard(context);
                                                Get.to(const ForgotPasswordScreen());
                                              },
                                              child: Center(
                                                child: Text(
                                                  'Forgot Password?',
                                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                    color: Theme.of(context).colorScheme.primary,
                                                    fontWeight: FontWeight.w500
                                                  )
                                                ),
                                              )),
                                    ],
                                  ),
                                  ///sign in button
                                  Container(
                                      width: 77.w,
                                      height:  6.h,
                                      margin: EdgeInsets.only(
                                          top: 1.h),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                            (_loginController.loading.value)
                                                ? Theme.of(context).shadowColor
                                                : Theme.of(context).colorScheme.primary,
                                          ),
                                          onPressed: () {
                                            FocusManager.instance.primaryFocus?.unfocus();
                                            Util.hideKeyboard(context);
                                            _loginController.validateAndLogin(
                                                emailTextController.text,
                                                passwordTextController.text);
                                            if (_loginController.emailEmptyError.value ||
                                                _loginController.emailValidError.value ||
                                                _loginController.passwordEmptyError.value ||
                                                _loginController.passwordValidError.value) {
                                              _loginController.loading.value =
                                              false;
                                            } else {
                                              _loginController.loading.value =
                                              true;
                                            }
                                          },
                                          child: Text(
                                            'Sign In',
                                            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                              color: Theme.of(context).colorScheme.onPrimary,
                                              fontWeight: FontWeight.w700
                                            )
                                          ))),
                                ],
                              )
                          ),
                        ),

                        Padding(
                            padding: EdgeInsets.only(
                                bottom: 12.h)),

                        RichText(
                            text: TextSpan(
                              text: 'By clicking the Sign in button, you consent and agree to Care Diary’s ',
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w400
                              ),
                              children: [
                                TextSpan(
                                  text: 'Terms & Conditions',
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      decoration: TextDecoration.underline,
                                      color: Theme.of(context).colorScheme.primary
                                    ),
                                  recognizer: TapGestureRecognizer()..onTap = () {
                                    Get.to(CustomizedWebView(termsAndConditionsUrl));
                                  },
                                ),
                                const TextSpan(
                                  text: ' and ',
                                ),
                                TextSpan(
                                  text: 'Privacy Policy.',
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      decoration: TextDecoration.underline,
                                      color: Theme.of(context).colorScheme.primary
                                  ),
                                  recognizer: TapGestureRecognizer()..onTap = () {
                                    Get.to(CustomizedWebView(privacyPolicyUrl));
                                  },
                                )
                              ]
                            ),
                        ),
                      ]*/),
                ),
              )));
  }
}
