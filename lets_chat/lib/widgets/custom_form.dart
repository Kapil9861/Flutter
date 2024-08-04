import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({
    super.key,
    required this.hint,
    required this.height,
    required this.customRegExp,
    this.obscureText = false,
    required this.onSave,
  });
  final String hint;
  final double height;
  final RegExp customRegExp;
  final bool obscureText;
  final void Function(String?) onSave;

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: TextFormField(
        onSaved: widget.onSave,
        obscureText: widget.obscureText,
        validator: (value) {
          if (value != null &&
              value.isNotEmpty &&
              widget.customRegExp.hasMatch(value)) {
            return null;
          } else {
            return "Enter a valid ${widget.hint}";
          }
        },
        decoration: InputDecoration(
          hintText: widget.hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
