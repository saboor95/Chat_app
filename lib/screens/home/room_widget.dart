import 'package:chat_app/screens/chat/chat_view.dart';
import 'package:flutter/material.dart';

import '../../models/room.dart';

class RoomWidget extends StatelessWidget {
  Room room;
  RoomWidget(this.room);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
Navigator.pushNamed(context, ChatScreen.routeName,arguments: room);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(12),
          height: MediaQuery.of(context).size.height*0.40,
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
          child: Column(
            children: [

              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset('assets/images/${room.catId}.png',
                  width: MediaQuery.of(context).size.width*0.30,
                    fit: BoxFit.fitWidth,
                  )),
              SizedBox(height: 10,),
              Text(room.title),
            ],
          ),
        ),
      ),
    );
  }
}
