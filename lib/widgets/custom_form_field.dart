import 'package:flutter/material.dart';

const String NUMBER_TYPE_INPUT = 'TextInputType.number';
const String TEXT_TYPE_INPUT = 'TextInputType.text';

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
      validator: (value) {
        // Workaround to get type of input
        var type = _textInputType.toJson()['name'];
        bool invalid = false;

        if (type == NUMBER_TYPE_INPUT) {
          if (value.isEmpty || int.tryParse(value) == null || value == 0) {
            invalid = true;
          }
        } else if (type == TEXT_TYPE_INPUT) {
          if (value.isEmpty) invalid = true;
        }
        if (invalid) {
          return 'Campo inválido';
        }
        return null;
      });
}

String validateFormField(value, _textInputType) {
  if (_textInputType == TextInputType.number) {}
  return 'Please fix';
}
