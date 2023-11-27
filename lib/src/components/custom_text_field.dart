import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  bool isobscuretext;
  bool isobscureIconSenha;

  CustomTextField(
      {super.key,
      required this.icon,
      required this.label,
      this.isobscuretext = false,
      this.isobscureIconSenha = true});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
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
