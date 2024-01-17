import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices{

  FirebaseAuth _auth =FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(String email,String password)async{
    try{
      UserCredential Credential =await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return Credential.user;
    }
    catch(e){
    print("some error occured");
    }
  }
    Future<User?> signInWithEmailAndPassword(String email,String password)async{
    try{
      UserCredential Credential =await _auth.signInWithEmailAndPassword(email: email, password: password);
      return Credential.user;
    }
    catch(e){
    print("some error occured");
    }
  }
}


 