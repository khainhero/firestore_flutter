import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

Firestore _firestore = Firestore.instance;

class BackendCall {
  StreamController<QuerySnapshot> _backendController =
      StreamController.broadcast();
  Stream<QuerySnapshot> get outSnaps => _backendController.stream;

  attachListener() {
    CollectionReference ref = _firestore.collection('users');

    ref.snapshots().listen((QuerySnapshot qs) {
      _backendController.add(qs);
    });
  }
}
