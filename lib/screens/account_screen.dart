import 'package:app/service/auth_service.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key, required this.auth});

  final AuthService auth;


  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Account Screen",
      ),
    );
  }
}
