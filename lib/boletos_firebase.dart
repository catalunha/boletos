import 'package:boletos/boletos_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class BoletosFirebase extends StatefulWidget {
  const BoletosFirebase({Key? key}) : super(key: key);

  @override
  _BoletosFirebaseState createState() => _BoletosFirebaseState();
}

class _BoletosFirebaseState extends State<BoletosFirebase> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Material(
            child: Center(
              child: Text(
                'Não foi possível inicializar o Firebase',
                textDirection: TextDirection.ltr,
              ),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return BoletosApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Material(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
