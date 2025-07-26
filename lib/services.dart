import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> student({
  required BuildContext context,
  required String Name,
  required String email,
  required String phone_number,
  required String department,
}) async {
  try {
    await FirebaseFirestore.instance.collection("datas").add({
      "Name": Name,
      "phone Number": phone_number,
      "Email": email,
      "Department": department,
    });
    Navigator.pop(context);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("student data added")));
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

Stream<QuerySnapshot> fetch_data() {
  return FirebaseFirestore.instance.collection("datas").snapshots();
}

Future<void> deletestudent(String id, BuildContext context) async {
  try {
    await FirebaseFirestore.instance.collection("datas").doc(id).delete();
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Student data deleted")));
  }
}

Future<void> updatestudent(
  String id,
  String Name,
  String phone_number,
  String email,
  String department,
  BuildContext context,
) async {
  try {
    await FirebaseFirestore.instance.collection("datas").doc(id).update({
      "Name": Name,
      "phone Number": phone_number,
      "Email": email,
      "Department": department,
    });
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Student data updated")));
  }
}
