import 'package:flutter/material.dart';

import '../../../../shared/widgets/buttons/app_button.dart';
import '../../../../shared/widgets/forms/app_password_field.dart';
import '../../../../shared/widgets/forms/app_text_field.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          label: 'Email',
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const Icon(Icons.email_outlined),
        ),

        const SizedBox(height: 20),

        AppPasswordField(label: 'Password', controller: passwordController),

        const SizedBox(height: 32),

        AppButton(label: 'Sign In', onPressed: () {}),
      ],
    );
  }
}
