import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../service/auth_service.dart';
import 'login_screen.dart';
import 'main_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late final AuthService auth;
  late final Stream<User?> user;

  @override
  void initState() {
    auth = AuthService();
    user = auth.authStateChanges();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: user,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MainScreen(auth: auth);
        }

        return LoginScreen(auth: auth,);
      },
    );
  }
}
