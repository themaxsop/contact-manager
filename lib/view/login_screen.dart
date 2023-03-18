import 'package:contact_app/utils/routes/routes_name.dart';
import 'package:contact_app/utils/utils.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ValueNotifier<bool> _passwordVisibility = ValueNotifier<bool>(true);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              focusNode: emailFocusNode,
              decoration: const InputDecoration(
                labelText: "Email address",
                hintText: "user@example.com",
                prefixIcon: Icon(Icons.email),
              ),
              onFieldSubmitted: (value) => Utils.fieldFocusChange(
                  passwordFocusNode, emailFocusNode, context),
            ),
            ValueListenableBuilder(
              valueListenable: _passwordVisibility,
              builder: (context, value, child) => TextFormField(
                controller: _passwordController,
                focusNode: passwordFocusNode,
                obscureText: _passwordVisibility.value,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "********",
                  prefixIcon: const Icon(Icons.lock_open),
                  suffixIcon: InkWell(
                    onTap: () {
                      _passwordVisibility.value = !_passwordVisibility.value;
                    },
                    child: Icon(_passwordVisibility.value
                        ? Icons.visibility_off
                        : Icons.visibility),
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
