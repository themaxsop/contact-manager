import 'package:contact_app/utils/routes/routes_name.dart';
import 'package:contact_app/utils/utils.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Utils.snackBar("No internet connection", context);
                // Utils.errorMessage("No internet connection", context);
                // Utils.toastMessage("No internet connection");
                // Navigator.pushNamed(context, RoutesName.home);
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
