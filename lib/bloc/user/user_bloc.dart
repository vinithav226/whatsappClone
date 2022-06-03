import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:whatsapp/model/services.dart';
import 'package:whatsapp/model/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepo userRepo;
  late List<User> users;

  UserBloc({required this.userRepo}) : super(UserState()) {
    on<UserFetchedEvent>((event, emit) async {
      users = await userRepo.getUserList();
      emit(UserLoadedState(users: users));
    });
  }
}
