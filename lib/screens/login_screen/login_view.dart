import 'package:chat_app/base.dart';
import 'package:chat_app/models/my_user.dart';
import 'package:chat_app/screens/create_account/create_account.dart';
import 'package:chat_app/screens/login_screen/login_navigator.dart';
import 'package:chat_app/screens/login_screen/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/my_provider.dart';
import '../home/home.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseView<LoginScreen, LoginViewModel>
    implements LoginNavigator {
  GlobalKey<FormState>formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Stack(children: [
          Image.asset(
            'assets/images/main_bg.png',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: Text('Login'),
                centerTitle: true,
              ),
              body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Form(
                      key: formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              validator: (text) {
                                if (text!.trim() == '') {
                                  return 'Please Enter email';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              obscureText: true,
                              obscuringCharacter: '*',
                              controller: passwordController,
                              textInputAction: TextInputAction.done,
                              validator: (text) {
                                if (text!.trim() == '') {
                                  return 'Please Enter password';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    )),
                              ),
                            ),
                            SizedBox(height: 5,),
                            ElevatedButton(onPressed: () {
                              ValidateForm();
                            },
                                child: Text('Login')),
                            TextButton(onPressed: (){
                              Navigator.pushReplacementNamed(context, CreateAccountScreen.routeName);
                            },
                                child: Text("Don't Have An Account ?" ))
                          ]))))
        ]));

  }
  void ValidateForm() {
    if (formKey.currentState!.validate())
  viewModel.loginWithFirebaseAuth(emailController.text, passwordController.text);
  }
  @override
  LoginViewModel initViewModel() {
    return LoginViewModel();
  }

  @override
  void goToHome(MyUser myUser) {
 Provider.of<MyProvider>(context,listen: false);
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
}

