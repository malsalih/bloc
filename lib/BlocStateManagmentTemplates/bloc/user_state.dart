

import '../data/UserProvider.dart';

abstract class UserState {}

class InitialState extends UserState {}

class SuccessUserList extends UserState{
  List<User> userList;
  SuccessUserList(this.userList);
}

class LoadingState extends UserState{}


