class Users {
  String id;
  String firstname;
  String lastname;
  String email;
  String message;

  Users({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.message,
  });


  Users copyWith({
    String? id,
    String? firstname,
    String? lastname,
    String? email,
    String? message,
  }) {
    return Users(
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      message: message ?? this.message,
    );
  }
}
