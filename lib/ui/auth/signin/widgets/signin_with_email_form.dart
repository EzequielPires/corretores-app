import 'package:app/ui/_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SigninWithEmailForm extends StatefulWidget {
  const SigninWithEmailForm({super.key});

  @override
  State<SigninWithEmailForm> createState() => _SigninWithEmailFormState();
}

class _SigninWithEmailFormState extends State<SigninWithEmailForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        spacing: 16,
        children: [
          CustomTextField(
            controller: TextEditingController(),
          ),
          CustomTextField(
            controller: TextEditingController(),
          ),
        ],
      ),
    );
  }
}
