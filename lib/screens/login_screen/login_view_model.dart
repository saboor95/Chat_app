

import 'package:chat_app/DatabaseUtils/database_utils.dart';
import 'package:chat_app/base.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/my_user.dart';
import 'login_navigator.dart';

class LoginViewModel extends BaseViewModel<LoginNavigator> {

  var auth = FirebaseAuth.instance;
String message='';

  void loginWithFirebaseAuth(String email, String password) async {
    try {
      navigator!.showLoading();
      final credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      message='Successfully logged';
    MyUser? myUser=await DatabaseUtils.readUserFromFirestore(credential.user?.uid??'');
    if (myUser!=null){
      navigator!.hideDialog();
      navigator!.goToHome(myUser);
      return;
    }
    } on FirebaseAuthException catch (e) {
      message='wrong email or password';

    } catch (e) {
      message='Something went wrong $e';
    }
    if (message!=''){
navigator!.hideDialog();
navigator!.showMessage(message);
    }
  }
}