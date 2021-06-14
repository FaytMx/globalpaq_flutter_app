import 'package:flutter/material.dart';
import 'package:globalpaq_app/app/utils/constatnts.dart';

class CreaInput extends StatelessWidget {
  const CreaInput({
    Key key,
    this.hintText = "Nombre",
    this.labelText = "Nombre",
    this.suffixIcon = Icons.accessibility,
    this.onChanged,
    this.keyboard = TextInputType.text,
    this.textValue = "",
  }) : super(key: key);

  final String hintText;
  final String labelText;
  final IconData suffixIcon;
  final Function onChanged;
  final TextInputType keyboard;
  final String textValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding / 2),
      child: TextField(
        keyboardType: keyboard,
        controller: TextEditingController(text: textValue),
        // autofocus: true,
        // textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: hintText,
          labelText: labelText,
          helperText: null,
          suffixIcon: Icon(suffixIcon),
          // icon: Icon(icon),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
