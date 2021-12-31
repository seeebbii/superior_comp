import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class AuthModel {
  String? uid;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  Timestamp? createdAt;
  String? role;
  String? status;

  AuthModel(
      {this.uid, this.firstName, this.lastName, this.email, this.imageUrl, this.createdAt, this.role , this.status});

  AuthModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    uid = doc.id;
    firstName = doc['firstName'];
    lastName = doc['lastName'];
    email = doc['email'];
    imageUrl = doc['imageUrl'];
    createdAt = doc['createdAt'];
    role = doc['role'];
    status = doc['status'];
  }
}