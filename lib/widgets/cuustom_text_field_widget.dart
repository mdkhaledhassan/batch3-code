import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFieldWidget extends StatefulWidget {
  CustomTextFieldWidget({super.key, required this.controller, this.keyboardType, required this.obscureText, this.prefixIcon, this.suffixIcon, this.validator, this.hintText});
  TextEditingController? controller;
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  bool? obscureText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  String? hintText;


  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
              controller: widget.controller,
              validator: widget.validator,
              keyboardType: widget.keyboardType,
              obscureText: widget.obscureText!,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500
                ),
              decoration: InputDecoration(
                // fillColor: Colors.teal,
                // filled: true,
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1
                  )
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1
                  )
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1
                  )
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 1
                  )
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1
                  )
                ),
              ),
            );
  }
}