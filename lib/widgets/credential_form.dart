
import 'package:flutter/material.dart';

class CredentialForm extends StatefulWidget {
  const CredentialForm({super.key, required this.buttonText, required this.onSubmit});

  final String buttonText;
  final Function onSubmit;

  @override
  State<CredentialForm> createState() => _CredentialFormState();
}

class _CredentialFormState extends State<CredentialForm> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'อีเมล',
            ),
          ),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'รหัสผ่าน',
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                widget.onSubmit(
                  _emailController.text,
                  _passwordController.text,
                );

                _emailController.clear();
                _passwordController.clear();

                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Text(widget.buttonText),
            ),
          ),
        ],
      ),
    );
  }
}