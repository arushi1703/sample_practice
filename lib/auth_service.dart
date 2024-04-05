import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth =FirebaseAuth.instance;

  /*Future <UserCredential> createUser(String email, String password) async{
    try{
      UserCredential user= await _auth.createUserWithEmailAndPassword(email: email, password: password)
    }
  }*/

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