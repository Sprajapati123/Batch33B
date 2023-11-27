import 'package:flutter/material.dart';

class CommonTextField extends StatefulWidget {
  TextEditingController? controller;
  bool ? obscureText = false;
  Widget? suffixIcon;
  Widget? label;
  Widget? prefixIcon;
   CommonTextField({super.key,this.prefixIcon,this.label, this.controller,this.obscureText,this.suffixIcon});

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText!,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        label: widget.label,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
