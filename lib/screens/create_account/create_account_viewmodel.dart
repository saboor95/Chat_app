import 'package:chat_app/base.dart';
import 'package:chat_app/models/my_user.dart';
import 'package:chat_app/shared/components/firebase_errors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../DatabaseUtils/database_utils.dart';
import 'create_account_navigator.dart';

class CreateAccountViewModel extends BaseViewModel<CreateAccountNavigator>{

String message='';
var auth=FirebaseAuth.instance;
  void CreateAccountWithFirebaseAuth(String email,String password,String FirstName,String userName)async{
    try {
      navigator!.showLoading();
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      message='Account Created';
      MyUser myUser=MyUser(id: credential.user?.uid??'', fName: FirstName, userName: userName,
          email: email);
       DatabaseUtils.AddUserToFirestore(myUser).then((value) {
        navigator!.hideDialog();
        navigator!.goToHome(myUser);
        return;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseError.weakPassword) {
        message='The password provided is too weak';

      } else if (e.code ==  FirebaseError.emailInUse) {
        message='This account already exists for that email.';
      }
    } catch (e) {
      message='Something went wrong $e';
    }
    if (message!=''){
      navigator!.hideDialog();
      navigator!.showMessage(message);
    }
  }
}
