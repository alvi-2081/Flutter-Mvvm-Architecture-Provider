import 'package:flutter/material.dart';
import 'package:flutter_mvvm/res/components/round_button.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/utils/utils.dart';
import 'package:flutter_mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();

    emailFocus.dispose();
    passwordFocus.dispose();

    obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewmodel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'TutorialKart',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: emailController,
                  focusNode: emailFocus,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.alternate_email),
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  ),
                  onSubmitted: (val) {
                    Utils.fieldFocusChange(context, emailFocus, passwordFocus);
                  },
                ),
              ),
              ValueListenableBuilder(
                  valueListenable: obsecurePassword,
                  builder: (context, value, child) => Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextField(
                          obscureText: value,
                          controller: passwordController,
                          focusNode: passwordFocus,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.password),
                            suffixIcon: InkWell(
                                onTap: () {
                                  obsecurePassword.value =
                                      !obsecurePassword.value;
                                },
                                child: Icon(obsecurePassword.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility)),
                            labelText: 'Password',
                          ),
                        ),
                      )),
              TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: const Text(
                  'Forgot Password',
                ),
              ),
              RoundButton(
                title: 'Login',
                loading: authViewModel.loading,
                onPress: () {
                  Map data = {
                    'email': emailController.text.toString(),
                    'password': passwordController.text.toString()
                  };
                  authViewModel.login(data, context);
                },
              ),
              // Container(
              //     height: 50,
              //     padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              //     child: ElevatedButton(
              //       child: const Text('Login'),
              //       onPressed: () {
              //         // Navigator.pushNamed(context, RoutesName.home);
              //         // Utils.toastMessage("No internat connection");
              //         Utils.flushBarErrorMessage(
              //             "No internet connection", context);
              //         print(nameController.text);
              //         print(passwordController.text);
              //       },
              //     )),
              Row(
                children: <Widget>[
                  const Text('Does not have account?'),
                  TextButton(
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesName.signup);
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          )),
    );
  }
}
