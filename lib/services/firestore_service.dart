import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simplemessage/model/users.dart';

class FirestoreService {
  final CollectionReference _usersCollection =
  FirebaseFirestore.instance.collection('users');

  Stream<List<Users>> getUsers() {
    return _usersCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Users(
          id: doc.id,
          firstname: data['firstname'],
          lastname: data['lastname'],
          email: data['email'],
          message: data['message'],
        );
      }).toList();
    });
  }

  Future<void> addUser(Users user) {
    return _usersCollection.add({
      'firstname': user.firstname,
      'lastname': user.lastname,
      'email': user.email,
      'message': user.message,
    });
  }

  Future<void> updateUser(Users user) {
    return _usersCollection.doc(user.id).update({
      'firstname': user.firstname,
      'lastname': user.lastname,
      'email': user.email,
      'message': user.message,
    });
  }

  Future<void> deleteUser(String userId) {
    return _usersCollection.doc(userId).delete();
  }
}