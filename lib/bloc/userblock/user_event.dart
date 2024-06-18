import 'package:simplemessage/model/users.dart';


abstract class UserEvent {}

class LoadUsers extends UserEvent {}

class AddUser extends UserEvent {
  final Users user;

  AddUser(this.user);
}
class SyncUsers extends UserEvent {
  final List<Users> users;

  SyncUsers(this.users);
}

class UpdateUser extends UserEvent {
  final Users user;

  UpdateUser(this.user);
}

class DeleteUser extends UserEvent {
  final String userId;

  DeleteUser(this.userId);
}