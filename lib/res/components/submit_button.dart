import 'package:contact_app/res/colors.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;

  const SubmitButton(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: loading
              ? CircleAvatar()
              : Text('The name', style: TextStyle(color: AppColors.white)),
        ),
      ),
    );
  }
}
