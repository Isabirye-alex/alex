class UserView {
  final int id;
  final String phoneNumber;
  const UserView({required this.id, required this.phoneNumber});
  //Conversion of user model to map
  Map<String, Object?> toMap() {
    return {'id': id, 'phoneNumber': phoneNumber};
  }
  @override
  String toString() {
    return 'Dog{id: $id, name: $phoneNumber}';
  }
  factory UserView.fromMap(Map<String, dynamic> map) {
    return UserView(
      id: map['id'] as int,
      phoneNumber: map['phoneNumber'] as String,
    );
  }
}