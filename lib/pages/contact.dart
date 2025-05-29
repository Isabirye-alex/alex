//
// class Contact {
//   int? id;
//   String phone;
//
//   Contact({required this.phone, this.id});
//
//   @override
//   String toString() {
//     return 'Contact(phone: $phone, id: $id)';
//   }
//
//   // Convert a Contact object into a Map
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'phone': phone,
//     };
//   }
//
//   factory Contact.fromMap(Map<String, dynamic> map) {
//     return Contact(
//       id: map['id'] != null ? map['id'] as int : null,
//       phone: map['phone'] ?? '',
//     );
//   }
// }
