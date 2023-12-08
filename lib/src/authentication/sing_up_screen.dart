import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocerstore/src/components/custom_text_field.dart';
import 'package:grocerstore/src/config/custom_color.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColor.customSwatColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              const Expanded(
                child: Center(
                  child: Text(
                    "Cadastro",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextField(
                      icon: Icons.email,
                      label: "Email",
                      isobscureIconSenha: false,
                    ),
                    CustomTextField(
                      icon: Icons.password,
                      label: "Password",
                      isobscuretext: true,
                    ),
                    CustomTextField(
                      icon: Icons.person,
                      label: "Nome",
                      isobscureIconSenha: false,
                    ),
                    CustomTextField(
                      icon: Icons.phone,
                      label: "Celular",
                      isobscureIconSenha: false,
                    ),
                    CustomTextField(
                      icon: Icons.file_copy,
                      label: "CPF",
                      isobscureIconSenha: false,
                    ),
                    CustomTextField(
                      icon: Icons.email,
                      label: "Email",
                      isobscureIconSenha: false,
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18))),
                        onPressed: () {},
                        child: Text(
                          "Criar usuario",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
