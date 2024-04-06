import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService{
  final FirebaseAuth _auth =FirebaseAuth.instance;
  final FirebaseFirestore _firestore= FirebaseFirestore.instance;

  Future<ConfirmationResult> sendOtp(String phonenumber) async{
    try{
      await _auth.setSettings(appVerificationDisabledForTesting: true);
      ConfirmationResult confirmation= await _auth.signInWithPhoneNumber(phonenumber);
      return confirmation;
    }
    on FirebaseAuthException catch (e){
      throw Exception(e.code);
    }
  }

  Future<UserCredential> loginOtp(ConfirmationResult confirmation, String otp) async{
    try{
      UserCredential user= await confirmation.confirm(otp);
      return user;
    }
    on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
}

  Future <UserCredential> createUser(String email, password, name, age) async{
    try{
      UserCredential user= await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      print('Hi');
      _firestore.collection("users").doc(name).set(
          {
            'email': email,
            'password': password,
            'name': name,
            'age': int.tryParse(age),
            'admin': false,
          }
      );
      return user;
    }
    on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }

  Future <UserCredential> loginUser(String email,String password) async{
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return user;
    }
    on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }

  void logOut() async{
    await _auth.signOut();
  }

}