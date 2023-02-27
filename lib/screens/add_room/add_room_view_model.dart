import 'package:chat_app/base.dart';
import 'package:chat_app/screens/add_room/add_room_navigator.dart';
import '../../DatabaseUtils/database_utils.dart';
import '../../models/room.dart';

class AddRoomViewModel extends BaseViewModel<AddRoomNavigator> {
  void AddRoomToDB(String title, String desc, String catId) {
    Room room = Room(title: title, desc: desc, catId: catId);

    DatabaseUtils.AddRoomToFirestore(room).then((value) {
navigator!.roomCreated();
    }).catchError((error){
    });
  }
}