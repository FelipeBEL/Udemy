import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model{

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;
  Map<String, dynamic> userData = Map();

  bool isLoading = false;

  void signUp({@required Map<String, dynamic> userData, @required String pass, @required VoidCallback onSucess, @required VoidCallback onFail}) {
    _changeLoadingStatus(true);

    _auth.createUserWithEmailAndPassword(email: userData["email"], password: pass).then((user) async{
      firebaseUser = user;

      await _saveUserData(userData);

      onSucess();
      _changeLoadingStatus(false);
    }).catchError((e){
      onFail();
      _changeLoadingStatus(false);
    });
  }

  void singIn() async{  // Tu vai fazer o login agr patrao
    _changeLoadingStatus(true);
    
    await Future.delayed(Duration(seconds: 3));

    _changeLoadingStatus(false);
  }

  void signOut() async{
    await _auth.signOut();

    userData = Map();
    firebaseUser = null;

    notifyListeners();
  }

  void recoverPass(){

  }

  bool isLoggedIn(){
    return firebaseUser != null;
  }

  void _changeLoadingStatus(bool status){
    isLoading = status;
    notifyListeners();
  }

  Future<Null> _saveUserData(Map<String, dynamic> userData) async{
    this.userData = userData;
    await Firestore.instance.collection("users").document(firebaseUser.uid).setData(userData);
  }
}