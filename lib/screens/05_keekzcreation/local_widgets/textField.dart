import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.icon,
      this.hint,
      this.obsecure = false,
      this.validator,
      this.onSaved});
  final FormFieldSetter<String> onSaved;
  final Icon icon;
  final String hint;
  final bool obsecure;
  final FormFieldValidator<String> validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12),
      child: TextFormField(
        onChanged: (value) => {
          {print("check")}
        },
        onSaved: onSaved,
        validator: validator,
        autofocus: false,
        obscureText: obsecure,
        style: TextStyle(
          fontSize: 18,
        ),
        decoration: InputDecoration(
            hintStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
            hintText: hint,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1,
              ),
            ),
            prefixIcon: Padding(
              child: IconTheme(
                data: IconThemeData(color: Colors.orangeAccent),
                child: icon,
              ),
              padding: EdgeInsets.only(left: 20, right: 10),
            ),
            suffixText: '+50 KP',
            suffixStyle: const TextStyle(color: Colors.greenAccent)),
      ),
    );
  }
}
