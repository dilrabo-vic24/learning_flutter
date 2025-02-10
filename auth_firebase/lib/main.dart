import 'dart:developer';

import 'package:auth_firebase/data/auth_service.dart';
import 'package:auth_firebase/firebase_options.dart';
import 'package:auth_firebase/presentations/screens/auth_screen.dart';
import 'package:auth_firebase/presentations/screens/home_screen.dart';
import 'package:auth_firebase/providers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthentificationProvider(
          authService: AuthenticationService(
        firebaseAuth: FirebaseAuth.instance,
      )),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.idTokenChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              FirebaseAuth.instance.currentUser!.reload().then(
                (value) {
                  try {
                    if (FirebaseAuth.instance.currentUser == null) {
                      FirebaseAuth.instance.signOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AuthScreen(),
                          ));
                    }
                  } on FirebaseAuthException catch (e) {
                    log(e.toString());
                  }
                },
              );
              log(snapshot.data.toString());
              return HomeScreen();
            }
            return AuthScreen();
          },
        ),
      ),
    );
  }
}
