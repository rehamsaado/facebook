import 'package:flutter/material.dart';

class AppTextFieldWidget extends StatelessWidget {
  final String? hint;
  final TextEditingController? textController;

  const AppTextFieldWidget({
    Key? key,
    this.hint,
    this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        filled: true,
        hintText: hint,
      ),
    );
  }
}
