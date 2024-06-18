import 'package:simplemessage/model/users.dart';


abstract class UserState {}

class UserInitial extends UserState {}
class UserLoading extends UserState {}
class UserLoaded extends UserState {
  final List<Users> users;

  UserLoaded(this.users);
}

class UsersOperationSuccess extends UserState {
  final String message;

  UsersOperationSuccess(this.message);
}

class UsersError extends UserState {
  final String errorMessage;

  UsersError(this.errorMessage);
}