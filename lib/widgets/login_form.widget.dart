import 'package:cookify/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CookifyLoginForm extends StatefulWidget {
  const CookifyLoginForm({Key? key, required this.usernameController, required this.passwordController}) : super(key: key);

  final TextEditingController usernameController;
  final TextEditingController passwordController;

  @override
  State<CookifyLoginForm> createState() => _CookifyLoginFormState();
}

class _CookifyLoginFormState extends State<CookifyLoginForm> {
  bool _showPassword = false;
  void _toggleShowPassword() => setState(() => _showPassword = !_showPassword);

  Widget get _buildShowPasswordButton => IconButton(
        splashRadius: 16.0,
        icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
        onPressed: _toggleShowPassword,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: const BorderSide(color: CookifyColors.yellow)),
              hintText: 'username',
              prefixIcon: const Icon(Icons.person),
            ),
            keyboardType: TextInputType.text,
            controller: widget.usernameController,
          ),
          const SizedBox(height: 20.0),
          TextField(
            controller: widget.passwordController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: 'password',
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: _buildShowPasswordButton,
            ),
            obscureText: !_showPassword,
          ),
        ],
      ),
    );
  }
}
