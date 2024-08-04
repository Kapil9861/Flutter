import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key, required this.hint, required this.height});
  final String hint;
  final double height;

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
