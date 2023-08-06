
import 'package:flutter/material.dart';

import '../helper.dart';
import '../service/auth_service.dart';
import '../widgets/credential_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key, required this.auth});

  final AuthService auth;

  @override
  Widget build(BuildContext context) {

    Future<void> onSubmit(String email, String password) async {
      try {
        await auth.register(email, password);
        if (context.mounted) {
          Navigator.of(context).pop();
        }
      } on Exception catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(getErrorMessage(e.toString())),
          ),
        );
      }
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'ลงทะเบียน',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              CredentialForm(buttonText: 'สมัครสมาชิก', onSubmit: onSubmit),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('เข้าสู่ระบบ'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}