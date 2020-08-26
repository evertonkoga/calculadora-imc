import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  String label;
  String hint;
  TextEditingController controller;
  FormFieldValidator<String> validator;
  TextInputType keyboardType;

  AppTextField(this.label,
      {this.hint, this.controller, this.validator, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      style: TextStyle(
        color: Colors.grey,
      ),
      cursorColor: Colors.teal,
      decoration: InputDecoration(
        filled: true,
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(
          color: Colors.teal,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.teal,
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
