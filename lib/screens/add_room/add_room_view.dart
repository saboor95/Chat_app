import 'package:chat_app/base.dart';
import 'package:chat_app/models/category.dart';
import 'package:chat_app/screens/add_room/add_room_navigator.dart';
import 'package:chat_app/screens/add_room/add_room_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddRoomScreen extends StatefulWidget {
  static const String routeName = 'addroom';

  @override
  State<AddRoomScreen> createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends BaseView<AddRoomScreen, AddRoomViewModel>
    implements AddRoomNavigator {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var categories = RoomCategory.getCategories();
  late RoomCategory selectedCategory = categories[0];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
    selectedCategory = categories[0];
  }

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
              title: Text('Add Room'),
              centerTitle: true,
            ),
            body: Card(
              margin: EdgeInsets.all(30),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.transparent)),
              color: Colors.white,
              elevation: 22,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                  child: Form(
                      key: formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text('Create New Room',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                )),
                            Image.asset('assets/images/create_room_bg.png'),
                            TextFormField(
                              controller: titleController,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              validator: (text) {
                                if (text!.trim() == '') {
                                  return 'Please Enter room title';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Title',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<RoomCategory>(
                                value: selectedCategory,
                                isDense: true,
                                  items: categories
                                      .map(
                                          (cat) => DropdownMenuItem<RoomCategory>(
                                              value: cat,
                                              child: Row(
                                                children: [
                                                  Image.asset(cat.image),
                                                  SizedBox(width: 15,),
                                                  Text(cat.name),
                                                ],
                                              )))
                                      .toList(),
                                  onChanged: (category) {
                                    if (category == null) {
                                      return;
                                    } else {
                                      selectedCategory = category;
                                    }
                                    setState(() {});
                                  }),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: descriptionController,
                              textInputAction: TextInputAction.done,
                              validator: (text) {
                                if (text!.trim() == '') {
                                  return 'Please Enter room description';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Description',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                                style: ButtonStyle(),
                                onPressed: () {
                                  ValidateForm();
                                },
                                child: Text('Create Room')),
                          ]))),
            ),
          )
        ]));
  }

  void ValidateForm() {
    if (formKey.currentState!.validate()) {
      viewModel.AddRoomToDB(
          titleController.text,
          descriptionController.text,
          selectedCategory.id);
    }
  }

  @override
  AddRoomViewModel initViewModel() {
    return AddRoomViewModel();
  }

  @override
  void roomCreated() {
  Navigator.pop(context);
  }
}
