import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/models/my_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseService {

  final String uid;

  DatabaseService({this.uid});

  // collection reference
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');



  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // brew list from snapshot
  List<Brew> _brewListFromShnapshot (QuerySnapshot shnapshot){
    return shnapshot.docs.map((doc){
      return Brew(
        sugars: doc.data()['sugars'],
        name: doc.data()['name'],
        strenght: doc.data()['strength'],
      );
    }).toList();
  }

  // user data from shanpshot
  MyUserData _userDataFromSnapshot (DocumentSnapshot document){
    return MyUserData(
      uid: uid,
      sugars: document.data()['sugars'],
      name: document.data()['name'],
      strength: document.data()['strength'],
    );
  }

  // get brew stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots()
      .map(_brewListFromShnapshot);
  }

  // get user doc stream
  Stream<MyUserData> get userData {
    return brewCollection.doc(uid).snapshots()
      .map(_userDataFromSnapshot);
  }


}