import 'package:flutter/material.dart';

Widget customTextFormField(TextInputType _textInputType, String _label,
    String _hint, TextEditingController _controller, enabledBool) {
  return TextFormField(
    enabled: enabledBool,
    controller: _controller,
    keyboardType: _textInputType,
    decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.indigo,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.indigo,
            width: 1.0,
          ),
        ),
        alignLabelWithHint: true,
        labelText: _label,
        hintText: _hint,
        hintStyle: TextStyle(fontSize: 13.0)),
  );
}