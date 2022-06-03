part of 'user_bloc.dart';

class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserInitState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final List<User> users;
  UserLoadedState({
    required this.users,
  });
}

class UserListError extends UserState {}
