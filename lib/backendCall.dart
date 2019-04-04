import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

Firestore _firestore = Firestore.instance;

class BackendCall {
  static StreamController<QuerySnapshot> _backendController =
      StreamController.broadcast();
  static Stream<QuerySnapshot> get outSnaps => _backendController.stream;

  static void attachListener() {
    CollectionReference ref = _firestore.collection('users');

    ref.snapshots().listen((QuerySnapshot qs) {
      _backendController.add(qs);
    });
  }
}
