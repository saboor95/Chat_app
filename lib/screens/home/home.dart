import 'package:chat_app/base.dart';
import 'package:chat_app/screens/add_room/add_room_view.dart';
import 'package:chat_app/screens/home/home_navigator.dart';
import 'package:chat_app/screens/home/home_view_model.dart';
import 'package:chat_app/screens/home/room_widget.dart';
import 'package:chat_app/screens/login_screen/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName='home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseView<HomeScreen,HomeViewModel>implements HomeNavigator {
  @override
  void initState(){
    super.initState();
    viewModel.navigator=this;
    viewModel.readRooms();
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
            backgroundColor: Colors.transparent,
            floatingActionButton: FloatingActionButton(
              onPressed: (){
Navigator.pushNamed(context, AddRoomScreen.routeName);
              },
              child: Icon(Icons.add,color: Colors.white,),
            ),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Text('Chat App',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              centerTitle: true,
              actions: [
                IconButton(onPressed: (){
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                }, icon: Icon(Icons.logout))
              ],
            ),
            body: Consumer<HomeViewModel>(
              builder: (context,HomeViewModel,c){
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 6,
                    ),
                  itemBuilder: (context,index){
                  return RoomWidget(HomeViewModel.rooms[index]);
                },itemCount: HomeViewModel.rooms.length,);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  HomeViewModel initViewModel() {
   return HomeViewModel();
  }
}
