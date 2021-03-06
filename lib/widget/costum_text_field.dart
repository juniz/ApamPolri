import 'package:flutter/material.dart';

class CostumTextField extends StatelessWidget {
  CostumTextField(
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
  FocusNode myFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        focusNode: myFocusNode,
        onSaved: onSaved,
        validator: validator,
        autofocus: true,
        obscureText: obsecure,
        style: TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
          hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.black,
              width: 3,
            ),
          ),
          prefixIcon: Padding(
            child: IconTheme(
              child: icon,
              data: IconThemeData(color: Theme.of(context).primaryColor),
            ),
            padding: EdgeInsets.only(left: 30, right: 10),
          ),
        ),
      ),
    );
  }
}
