import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String id;
  final String Name;
  final String email;
  final List<Map<String, dynamic>> cart = [];
  UserData({
    required this.id,
    required this.Name,
    required this.email,
  });
  Map<String, dynamic> toMap() => {
        'id': id,
        'name': Name,
        'email': email,
      };

  static UserData fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserData(
      email: snapshot['email'],
      id: snapshot['id'],
      Name: snapshot['name'],
    );
  }
}
