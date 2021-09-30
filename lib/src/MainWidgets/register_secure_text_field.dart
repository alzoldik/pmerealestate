import 'package:flutter/material.dart';

class RegisterSecureTextField extends StatefulWidget {
  final String label;
  final IconData icon;

  final String errorText;
  final Function onChange;
  final Function error;

  const RegisterSecureTextField(
      {Key key,
      this.label,
      this.errorText,
      this.onChange,
      this.icon,
      this.error})
      : super(key: key);

  @override
  _RegisterSecureTextFieldState createState() =>
      _RegisterSecureTextFieldState();
}

class _RegisterSecureTextFieldState extends State<RegisterSecureTextField> {
  bool see = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          textAlign: TextAlign.right,
          onChanged: widget.onChange,
          obscureText: see,
          validator: (value) {
            if (value.isEmpty) {
              return "${widget.label} مطلوب";
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: widget.label,
            errorText: widget.errorText ?? null,
            // prefixIcon: widget.icon != null
            //     ? Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: CircleAvatar(
            //           radius: 1,
            //           child: Icon(
            //             widget.icon,
            //             size: 15,
            //             color: Colors.white,
            //           ),
            //           backgroundColor: Theme.of(context).primaryColor,
            //         ),
            //       )
            //     : null,
            suffixIcon: IconButton(
              icon: Icon(
                see == true ? Icons.lock_outline : Icons.lock_open,
              ),
              onPressed: () {
                setState(() {
                  see = !see;
                });
              },
            ),
            contentPadding: EdgeInsets.only(top: 20, right: 10),
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ),
    );
  }
}
