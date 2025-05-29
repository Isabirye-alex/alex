
class Contact {
  int? id;
  String phone;
  String root;

  Contact({required this.phone, this.id, required this.root});

  @override
  String toString() {
    return 'Contact(phone: $phone, id: $id, root: $root)';
  }


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'phone': phone,
      'root': root,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map['id'] != null ? map['id'] as int : null,
      phone: map['phone'] ?? '',
      root: map['root'] ?? '',
    );
  }
}
