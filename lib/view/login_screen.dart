import 'package:contact_app/res/components/submit_button.dart';
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _passwordVisibility.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gap = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            SizedBox(
              height: gap * 0.1,
            ),
            SubmitButton(
              title: 'Login',
              onPress: () {
                if (_emailController.text.isEmpty) {
                  Utils.errorMessage('Please enter email', context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.errorMessage('Please enter password', context);
                } else if (_passwordController.text.length < 6) {
                  Utils.errorMessage(
                      'Password must have 6 alphanumaric characters.', context);
                } else {
                  print('API hit');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
