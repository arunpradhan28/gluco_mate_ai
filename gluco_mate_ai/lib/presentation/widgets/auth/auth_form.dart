import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final void Function(String email, String password) onSubmit;
  final bool isLogin;
  final VoidCallback onToggle;

  const AuthForm({
    super.key,
    required this.onSubmit,
    required this.isLogin,
    required this.onToggle,
  });

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void _trySubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();
      widget.onSubmit(_email, _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                key: const ValueKey('email'),
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  prefixIcon: const Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (val) => _email = val!.trim(),
                validator: (val) =>
                    val == null || !val.contains('@') ? 'Enter a valid email' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                key: const ValueKey('password'),
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  prefixIcon: const Icon(Icons.lock),
                ),
                obscureText: true,
                onSaved: (val) => _password = val!,
                validator: (val) =>
                    val == null || val.length < 6 ? 'Password must be at least 6 characters' : null,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _trySubmit,
          child: Text(widget.isLogin ? 'Login' : 'Register'),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: const Color(0xFF4CAF50),
            textStyle: const TextStyle(fontSize: 16),
          ),
        ),
        TextButton(
          onPressed: widget.onToggle,
          child: Text(
            widget.isLogin ? 'Don’t have an account? Register' : 'Already have an account? Login',
            style: const TextStyle(fontSize: 14),
          ),
        )
      ],
    );
  }
}
