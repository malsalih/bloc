import 'dart:async';

import 'package:bloc_lesson/BlocStateManagmentTemplates/data/UserProvider.dart';

import '../bloc/user_events.dart';
import '../bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent,UserState> {
  UserBloc() : super(InitialState()) {
    on<GetUserEvent>(_getUserList);
  }

  FutureOr<void> _getUserList(GetUserEvent event, Emitter<UserState> emit) async {
    emit(LoadingState());
    List<User> user = await ApiProvider().getUsers();
    emit(SuccessUserList(user));
  }
}
