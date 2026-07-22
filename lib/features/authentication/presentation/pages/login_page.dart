import 'package:flutter/material.dart';
import '../../../../shared/widgets/layouts/smart_scaffold.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_spacing.dart';
import  '/features/authentication/widgets/login_header.dart';
import '../../../../app/router/app_routes.dart';
import '../../../../shared/widgets/buttons/app_button.dart';
import '../../../../shared/widgets/forms/app_password_field.dart';
import '../../../../shared/widgets/forms/app_text_field.dart';
/// Login screen for SmartShop AI.
///
/// Currently this screen performs local validation only.
/// Authentication logic will be connected in the next sprint
/// using Riverpod and the AuthRepository.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Temporary fake login.
    await Future.delayed(
      const Duration(seconds: 1),
    );

    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });

    context.go(AppRoutes.dashboard);
  }

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
            title: 'Login',

      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 450,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const LoginHeader(),

                  AppTextField(
                    controller: _emailController,
                    label: 'Email Address',
                    hintText: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    prefixIcon: const Icon(Icons.email_outlined),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Email is required';
                      }

                      if (!value.contains('@')) {
                        return 'Enter a valid email address';
                      }

                      return null;
                    },
                  ),

                  AppSpacing.gapLG,

                  AppPasswordField(
                    controller: _passwordController,
                    label: 'Password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }

                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }

                      return null;
                    },
                  ),

                  AppSpacing.gapXL,

                  AppButton(
                    label: 'Sign In',
                    isLoading: _isLoading,
                    onPressed: _login,
                  ),

                  AppSpacing.gapLG,

                  TextButton(
                    onPressed: () {
                      // Forgot Password screen
                    },
                    child: const Text(
                      'Forgot Password?',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}