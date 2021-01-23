import 'package:cloud_firestore/cloud_firestore.dart';

class CarUser {
  String name;
  String surname;
  String email;

  CarUser(this.name, this.surname, this.email);

  CarUser.fromFirestore(QueryDocumentSnapshot doc) {
    this.name = doc['name'];
    this.surname = doc['surname'];
    this.email = doc['email'];
  }

  Map<String, dynamic> toFirestore() => {
        'name': name,
        'surname': surname,
        'email': email,
      };
}
