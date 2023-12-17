import 'package:catelog_web/main.dart';
import 'package:catelog_web/src/core/util/app_router.dart';
import 'package:catelog_web/src/core/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'login_vm.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer(builder: (context, ref, _) {
          final _vm = ref.watch(loginVmProvider);
          return FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                // Align(
                //   alignment: Alignment.center,
                //   child: Image.asset(
                //     'assets/omcreation_logo.png',
                //     height: 100,
                //     fit: BoxFit.contain,
                //     width: 200,
                //   ),
                // ),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Welcome Back',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Please login to continue',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 14,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: FormBuilderTextField(
                    decoration: const InputDecoration(
                      fillColor: Colors.red,
                      border: OutlineInputBorder(),
                      labelText: "Email",
                    ),
                    name: 'email',
                    controller: emailController,
                    onChanged: (val) {
                      _formKey.currentState!.fields['email']!.validate();
                      setState(() {});
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: FormBuilderTextField(
                    decoration: InputDecoration(
                      fillColor: Theme.of(context).primaryColor,
                      border: const OutlineInputBorder(),
                      labelText: "Password",
                    ),
                    name: 'password',
                    controller: passwordController,
                    obscureText: true,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    onChanged: (val) {
                      !_formKey.currentState!.fields['password']!.validate();
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return const ForgotPasswordScreen();
                      // }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Forgot Password?',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              color: colorPrimary,
                              fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.saveAndValidate()) {
                      _vm.onLogin(emailController.text, passwordController.text,
                          context);
                    }
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        color: colorPrimary,
                        borderRadius: BorderRadius.circular(6.0)),
                    child: Center(
                      child: Text(
                        'LOGIN',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    navigatorKey.currentState
                        ?.pushReplacementNamed(AppRouter.homescreen);
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Skip',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return const SignUpScreen();
                        // }));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style:
                                Theme.of(context).textTheme.headline2!.copyWith(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Sign Up',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  color: colorPrimary,
                                  fontSize: 14,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
