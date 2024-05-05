import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_events.dart';
import '../bloc/user_state.dart';
import '../bloc/user_bloc.dart';
import '../data/UserProvider.dart';

class MyBlocPage extends StatefulWidget {
  MyBlocPage({Key? key}) : super(key: key);

  @override
  State<MyBlocPage> createState() => _MyBlocPageState();
}

class _MyBlocPageState extends State<MyBlocPage> {
  bool change = true;
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.person_add),
      ),
      body: buildBloc(),
    );
  }

  /**  --------------- Focus Here  ----------------------- **/
  Widget buildBloc() {
    return BlocBuilder<UserBloc,UserState>(builder: (context, state) {
      if (state is LoadingState) return Center(child: CircularProgressIndicator());
      if ( state is SuccessUserList){
        List<User> userList = state.userList;
        return buildUserList(userList);
      }
      return Center(
          child: ElevatedButton(
            onPressed: (){
              context.read<UserBloc>().add(GetUserEvent());
            },
            child: Text("Get Users List"),));
    },);
  }
  /** 
   --------------- Focus Here  -----------------------
     **/

  Widget buildUserList(List<User> users) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.person),
            title: Text("${users[index].name}"),
            subtitle: Text("${users[index].email}"),
          );
        });
  }
}
