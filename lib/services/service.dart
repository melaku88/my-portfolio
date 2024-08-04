import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Services {

  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static snackBarSuccess(BuildContext context, String msg) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green.shade700,
      content: Center(
        child: Text(
          msg,
          style: TextStyle(color: Colors.white),
        ),
      ),
    ));
  }

  static snackBarError(BuildContext context, String msg) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.redAccent,
      content: Center(
        child: Text(
          msg,
          style: TextStyle(color: Colors.white),
        ),
      ),
    ));
  }

  static sendMessage(BuildContext context,String name, String email, String message)async{
    try {
      if(name.isNotEmpty && email.isNotEmpty && message.isNotEmpty){
        return await firestore.collection('Clients').add({
          'name': name,
          'email': email,
          'message': message
        }).then((value){
          snackBarSuccess(context, 'Your Message sent successfully!');
        });
      }else{
        return snackBarError(context, 'All fields are required, please fill and try again!');
      }
    }on FirebaseException catch (e) {
      return Services.snackBarError(context, e.code);
    }
  }
}
