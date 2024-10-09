import 'package:components/components.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.valueName,
    required this.focusNode,
    this.hintText = "",
  });
  final TextEditingController controller;
  final String valueName;
  final FocusNode focusNode;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), border: Border.all()),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            focusNode: focusNode,
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                focusNode.requestFocus();
                return "Please fill the $valueName field.";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: hintText,
              helper: StyledText(
                text: valueName.toUpperCase(),
              ),
              fillColor: Colors.grey,
              filled: true,
            ),
          ),
        ),
      ),
    );
  }
}
