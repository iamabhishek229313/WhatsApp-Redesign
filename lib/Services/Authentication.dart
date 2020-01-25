import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp_redesign/Models/User.dart';

class Authentication {
  FirebaseAuth _auth = FirebaseAuth.instance ;

  User _userFromFireBaseUser(FirebaseUser user){
    return user != null ? User(uid : user.uid) : null ;
  }

  Stream<User> get user{
    return _auth.onAuthStateChanged.map((FirebaseUser user) => _userFromFireBaseUser(user));
  }
 //Sign in anon
  Future SignInAnon() async{
    try{
      AuthResult result  = await _auth.signInAnonymously();
      UserInfo user = result.user ;
      return _userFromFireBaseUser(user);
    }catch(ex){
      print(ex.toString());
      return null ;
    }
  }

  // Sign out
  Future signOut() async{
    try{
      return await _auth.signOut() ;
    }catch(ex){
      print(ex.toString());
      return null ;
    }
  }


}