import 'package:flutter/material.dart';
import 'package:globalpaq_app/app/modules/login/widgets/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
final ValueChanged<String> onChnaged;

  const RoundedPasswordField({
    Key key, this.onChnaged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChnaged,
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Contraseña",
          icon: Icon(
            Icons.lock,
            color: Colors.orange,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Colors.orange,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
