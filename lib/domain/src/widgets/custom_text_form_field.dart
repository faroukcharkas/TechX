import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.icon,
    required this.validator,
    required this.controller,
    this.onChanged,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final String label;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          obscureText: obscureText,
          style: TextStyle(
            color: Colors.white,
          ),
          textCapitalization: textCapitalization,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.white,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            contentPadding: EdgeInsets.all(20.0),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                width: 0.25,
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                width: 1,
                color: Colors.blue,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.white.withOpacity(0.25),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                width: 1,
                color: Colors.red,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                width: 1,
                color: Colors.red,
              ),
            ),
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.5),
            ),
          ),
        ),
      ],
    );
  }
}
