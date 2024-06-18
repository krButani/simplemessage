import 'package:bloc/bloc.dart';
import 'package:simplemessage/bloc/userblock/user_event.dart';
import 'package:simplemessage/bloc/userblock/user_state.dart';
import 'package:simplemessage/config/krButani/all.dart';
import 'package:simplemessage/services/firestore_service.dart';


class UserBloc extends Bloc<UserEvent, UserState> {
  final FirestoreService _firestoreService;

  UserBloc(this._firestoreService) : super(UserInitial()) {
    on<LoadUsers>((event, emit) async {
      try {
        emit(UserLoading());
        final Users = await _firestoreService
            .getUsers()
            .first;
        emit(UserLoaded(Users));
      } catch (e) {
        emit(UsersError('Failed to load users.'));
      }
    });



    on<SyncUsers>((event, emit) async {
      try {
        emit(UserLoading());
        for(var i=0;i<event.users.length;i++) {
          await _firestoreService.addUser(event.users[i]);
        }
        emit(UsersOperationSuccess('User added successfully.'));
      } catch (e) {

        emit(UsersError('Failed to add user.'));
      }
    });

    on<AddUser>((event, emit) async {
      try {
        emit(UserLoading());
        await _firestoreService.addUser(event.user);
        emit(UsersOperationSuccess('User added successfully.'));
      } catch (e) {
        emit(UsersError('Failed to add user.'));
      }
    });

    on<UpdateUser>((event, emit) async {
      try {
        emit(UserLoading());
        await _firestoreService.updateUser(event.user);
        emit(UsersOperationSuccess('User updated successfully.'));
      } catch (e) {
        emit(UsersError('Failed to update user.'));
      }
    });

    on<DeleteUser>((event, emit) async {
      try {
        emit(UserLoading());
        await _firestoreService.deleteUser(event.userId);
        emit(UsersOperationSuccess('User deleted successfully.'));
      } catch (e) {
        emit(UsersError('Failed to delete user.'));
      }
    });
  }
}
