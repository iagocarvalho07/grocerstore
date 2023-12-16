import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  bool isobscuretext;
  bool isobscureIconSenha;
  final List<TextInputFormatter>? inputFormatters;

  CustomTextField(
      {super.key,
      required this.icon,
      required this.label,
      this.isobscuretext = false,
      this.isobscureIconSenha = true,
      this.inputFormatters,
      });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        inputFormatters: widget.inputFormatters,
        obscureText: widget.isobscuretext,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.isobscureIconSenha
              ? IconButton(
                  onPressed: () {
                    setState(
                      () {
                        widget.isobscuretext = !widget.isobscuretext;
                      },
                    );
                  },
                  icon: widget.isobscuretext
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                )
              : null,
          labelText: widget.label,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
