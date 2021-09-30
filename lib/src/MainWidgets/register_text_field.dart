import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class RegisterTextField extends StatefulWidget {
  final String label;
  final IconData icon;
  final TextInputType type;
  final String hint;
  final String errorText;
  final Function onChange;
  final String init;
  final bool edit;
  final Function onChangeCountry;
  final Function onInit;

  const RegisterTextField(
      {Key key,
      this.icon,
      this.label,
      this.type,
      this.hint,
      this.errorText,
      this.onChange,
      this.init,
      this.edit,
      this.onChangeCountry,
      this.onInit})
      : super(key: key);

  @override
  _RegisterTextFieldState createState() => _RegisterTextFieldState();
}

class _RegisterTextFieldState extends State<RegisterTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 30, left: 30),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            initialValue: widget.init,
            textAlign: TextAlign.right,
            keyboardType:
                widget.hint == 'رقم الجوال' ? TextInputType.phone : widget.type,
            onFieldSubmitted: (v) {},
            onChanged: widget.onChange,
            validator: (value) {
              if (value.isEmpty) {
                return "${widget.hint == null ? widget.label : widget.hint} مطلوب";
              }
              if (widget.label == 'رقم الجوال' || widget.hint == 'رقم الجوال') {
                if (!value.startsWith("05")) {
                  return "يجب انا يبدا الهاتف ب05";
                } else if (value.length > 10 || value.length < 10) {
                  return "يجب ان يكون الهاتف عبارة عن 10 رقم";
                }
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: widget.label,
              errorText: widget.errorText ?? null,
              suffixIcon: widget.edit == null
                  ? null
                  : widget.edit
                      ? Padding(
                          padding: EdgeInsets.all(6), child: Icon(Icons.edit))
                      : CountryCodePicker(
                          onChanged: print,
                          initialSelection: 'eg',
                          favorite: [
                            '+966',
                          ],
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                          textStyle: TextStyle(fontWeight: FontWeight.bold),
                          closeIcon: Icon(
                            Icons.close,
                            size: 30,
                          ),
                          flagWidth: 20,
                        ),
              hintText: widget.hint == null ? '' : widget.hint,
              contentPadding: EdgeInsets.only(top: 20, right: 10),
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ));
  }
}
