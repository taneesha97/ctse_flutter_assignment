import 'package:firebase_auth/firebase_auth.dart';

class UserAuthentication {

  final FirebaseAuth _firebaseAuth;

  UserAuthentication(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<void> registerUser(String userName, String password) async {
    print('done');
    print('uname $userName pass $password' );
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: userName,
          password: password
      );
      print('done');
    } on FirebaseAuthException catch (e) {
      print('excep $e');
    } catch (e) {
      print(e);
    }
  }

  Future<void> logInUser(String userName, String password) async {
    print('$userName pwd $password');
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: userName,
          password: password
      );
      print('hello');
    } on FirebaseAuthException catch (e) {
     print('exception $e');
    }
  }

  Future<void> signoutUser() async {
    try{
      await _firebaseAuth.signOut();
    }on FirebaseAuthException catch (e) {
    }
  }

}