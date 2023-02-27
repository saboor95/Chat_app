import 'package:chat_app/base.dart';
import 'package:chat_app/screens/chat/chat_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/room.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = 'chat';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends BaseView<ChatScreen, ChatViewModel>
    implements ChatNavigator {
  var messageController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var room=ModalRoute.of(context)!.settings.arguments as Room;
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
                title: Text(room.title),
                centerTitle: true,
              ),
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                decoration: BoxDecoration(
                  color:Colors.white ,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child:Column(
                  children: [
                    Expanded(child: Container()),
                    Container(
                      padding: EdgeInsets.only(bottom: 6,left: 4),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller:messageController,
                              decoration: InputDecoration(
                                hintText: 'Type a message',
                          contentPadding:EdgeInsets.zero ,
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.only(topRight: Radius.circular(12),

                              ),
                              borderSide: BorderSide(
                                  color:  Colors.blue
                              )
                          ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.only(topRight: Radius.circular(12),

                                  ),
                                  borderSide: BorderSide(
                                    color:  Colors.blue
                                  )
                                )
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(8),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.blue,
                            ),
                            child: Row(
                              children: [
                                Text('send',style: TextStyle(
                                  color: Colors.white
                                      ,fontSize: 14
                                ),),
                                SizedBox(width: 6,),
                                Icon(Icons.send,color: Colors.white,),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ) ,
              ),
            )
          ],
        ));
  }

  @override
  ChatViewModel initViewModel() => ChatViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }
}
