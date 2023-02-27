import 'package:chat_app/providers/my_provider.dart';
import 'package:chat_app/screens/add_room/add_room_view.dart';
import 'package:chat_app/screens/chat/chat_view.dart';
import 'package:chat_app/screens/create_account/create_account.dart';
import 'package:chat_app/screens/home/home.dart';
import 'package:chat_app/screens/login_screen/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (context)=>MyProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return MaterialApp(
      initialRoute:provider.firebaseUser!=null?HomeScreen.routeName:
      LoginScreen.routeName,
      routes:{
        CreateAccountScreen.routeName:(context)=>CreateAccountScreen(),
        LoginScreen.routeName:(c)=>LoginScreen(),
        HomeScreen.routeName:(c)=>HomeScreen(),
        AddRoomScreen.routeName:(c)=>AddRoomScreen(),
        ChatScreen.routeName:(c)=>ChatScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
