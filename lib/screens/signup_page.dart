import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:union_shop/widgets/header.dart';
import 'package:union_shop/widgets/body_with_footer.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSignUp() {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email')),
      );
      return;
    }

    if (password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your password')),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyWithFooter(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Header(
              onLogoTap: () => context.go('/'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 480),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('Create account', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      const Text('Sign up to get started', style: TextStyle(color: Colors.black54)),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(labelText: 'Full name', border: OutlineInputBorder()),
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
                        obscureText: true,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _confirmPasswordController,
                        decoration: const InputDecoration(labelText: 'Confirm password', border: OutlineInputBorder()),
                        obscureText: true,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _handleSignUp,
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4d2963)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 14.0),
                          child: Text('Create account'),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account?'),
                          TextButton(onPressed: () => context.push('/login'), child: const Text('Sign in')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
