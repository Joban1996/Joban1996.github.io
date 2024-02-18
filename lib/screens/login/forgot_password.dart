import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_controller.dart';

class ForgotPasswordScreen extends StatefulWidget {

  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  var emailTextController = TextEditingController();
  FocusNode emailFocus = FocusNode();


  final LoginController _loginController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              leading:  IconButton(
                onPressed: (){
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back),
                color: Theme.of(context).colorScheme.primary,
              ),
              automaticallyImplyLeading: true),
          body: /*Obx(() => Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 6.h),
              color: Theme.of(context).colorScheme.onPrimary,
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                    children: [
                      Container(
                          height: 7.0.px,
                          width: 65.0.px,
                          margin: EdgeInsets.only(bottom: 3.0.px),
                          child: Image.asset('assets/images/main_logo.png',
                            fit: BoxFit.fill,
                          )
                      ),
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.h),
                        ),
                        child: Container(
                            padding: EdgeInsets.only(top: 3.h, left: 4.w, right: 3.w),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onPrimary,
                              borderRadius: BorderRadius.circular(0.5.h),
                            ),
                            height: 38.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Forgot Password?',
                                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: Theme.of(context).colorScheme.primary
                                      )),
                                Padding(padding: EdgeInsets.only(bottom: 1.8.h)),
                                Flexible(
                                  child: Text('Enter your email and we\'ll send you instructions to reset your password',
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.w500
                                    )),
                                ),
                                Padding(padding: EdgeInsets.only(top: 2.h)),

                                Text('Email', style: Theme.of(context).textTheme.bodyLarge,),
                                /// Email
                                Container(
                                  height: 5.5.h,
                                  margin: EdgeInsets.only(top: 1.h,),
                                  child: TextField(
                                    controller: emailTextController,
                                    focusNode: emailFocus,
                                    keyboardType: TextInputType.emailAddress,
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Theme.of(context).primaryColorDark,fontWeight: FontWeight.w500 ),
                                    onChanged: (value){
                                    },
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      hintText: 'Enter email',
                                      hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                          color: (_loginController.emailErrorForgot.value)
                                              ? Theme.of(context).colorScheme.error
                                              : Theme.of(context).shadowColor,fontWeight: FontWeight.w500 ),

                                      enabledBorder: (_loginController.emailErrorForgot.value)
                                          ? OutlineInputBorder(
                                          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
                                          borderRadius: BorderRadius.circular(0.5.h))
                                          : OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(context).shadowColor),
                                          borderRadius:
                                          BorderRadius.circular(0.5.h)),
                                      contentPadding: EdgeInsets.only(left: 2.w,  ),
                                      focusedBorder: (_loginController.emailValidErrorForgot.value || _loginController.emailErrorForgot.value)
                                          ? OutlineInputBorder(
                                          borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
                                          borderRadius: BorderRadius.circular(0.5.h))
                                          : null,
                                    ),
                                  ),
                                ),

                                (_loginController.emailErrorForgot.value)?
                                Offstage(
                                  offstage: !_loginController.emailErrorForgot.value,
                                  child: Container(
                                    height: 2.8.h,
                                    padding: EdgeInsets.only(left: 2.w, top: 0.8.h),
                                    child: Text('Required', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                        color: Theme.of(context).colorScheme.error,
                                        fontWeight: FontWeight.w400),),
                                  ),
                                )
                                    :
                                SizedBox(height:  2.5.h),

                                ///sign in button
                                Container(
                                    width: Get.width,
                                    height: 6.h,
                                    margin: EdgeInsets.only(top:  1.h),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          FocusManager.instance.primaryFocus?.unfocus();
                                          Util.hideKeyboard(context);

                                          _loginController.forgotPass(emailTextController.text);
                                        },
                                        child: Text(
                                          'Send reset request',
                                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                            color: Theme.of(context).colorScheme.onPrimary,
                                            fontWeight: FontWeight.w700
                                          )
                                        ))),
                              ],
                            )
                        ),
                      ),
                    ]),
              )))*/Container());
  }
}
