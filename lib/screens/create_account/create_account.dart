import 'package:chat_app/base.dart';
import 'package:chat_app/screens/create_account/create_account_navigator.dart';
import 'package:chat_app/screens/home/home.dart';
import 'package:chat_app/screens/login_screen/login_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/my_user.dart';
import '../../providers/my_provider.dart';
import 'create_account_viewmodel.dart';

class CreateAccountScreen extends StatefulWidget {
  static const String routeName = 'CreateAccount';

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState
    extends BaseView<CreateAccountScreen, CreateAccountViewModel>
    implements CreateAccountNavigator {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var fNameController = TextEditingController();
  var userNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Stack(
        children: [
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
              title: Text('Create Account'),
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
                      controller: fNameController,
                      validator: (text) {
                        if (text!.trim() == '') {
                          return 'Please Enter First Name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'First Name',
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
                      controller: userNameController,
                      validator: (text) {
                        if (text!.trim() == '') {
                          return 'Please Enter UserName';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'UserName',
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
                      validator: (text) {
                        if (text!.trim() == '') {
                          return 'Please Enter E-mail';
                        }
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(text);
                        if (!emailValid) {
                          return ('Please Enter Vaild Email');
                        }
                        return null;
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'E-mail',
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
                      validator: (text) {
                        if (text!.trim() == '') {
                          return 'Please Enter Password';
                        }
                        return null;
                      },
                      obscureText: true,
                      obscuringCharacter: '*',
                      controller: passwordController,
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
                    SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          ValidateForm();
                        },
                        child: Text('Create Account')),
                    TextButton(onPressed: (){
                      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                    },
                        child: Text("I Have An Account" ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void ValidateForm() async {
    if (formKey.currentState!.validate()) {
      viewModel.CreateAccountWithFirebaseAuth(
          emailController.text,
          passwordController.text,
          fNameController.text,
          userNameController.text);
    }
  }

  @override
  CreateAccountViewModel initViewModel() {
    return CreateAccountViewModel();
  }

  @override
  void goToHome(MyUser myUser) {
    Provider.of<MyProvider>(context,listen: false);
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
}
