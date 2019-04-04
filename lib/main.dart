import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:funky/backendCall.dart';

void main() => runApp(FirestoreBackendCall());

class FirestoreBackendCall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    BackendCall.attachListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("FUNKY"),
        centerTitle: true,
      ),
      body: displayWidget(context),
    );
  }

  Widget displayWidget(context) {
    return StreamBuilder(
      stream: BackendCall.outSnaps,
      builder: (context, snapshot) {
        return anotherwidget(context, snapshot);
      },
    );
  }

  Widget anotherwidget(BuildContext context, AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.documents.length,
      itemBuilder: (context, index) {
        DocumentSnapshot ds = snapshot.data[index];
        return Card(
          elevation: 8,
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(ds.data['info']),
          ),
        );
      },
    );
  }
}
