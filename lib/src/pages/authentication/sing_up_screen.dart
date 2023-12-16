import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocerstore/src/config/custom_color.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../components/custom_text_field.dart';

class SingUpScreen extends StatelessWidget {
  SingUpScreen({super.key});

  final cpfFormater = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')}
  );

  final phoneFormater = MaskTextInputFormatter(
      mask: '## # ####-####',
      filter: {'#': RegExp(r'[0-9]')}
  );


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColor.customSwatColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(children: [
            Column(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
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
                        inputFormatters: [phoneFormater],
                        isobscureIconSenha: false,
                      ),
                      CustomTextField(
                        icon: Icons.file_copy,
                        label: "CPF",
                        inputFormatters: [cpfFormater],
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
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
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
            Positioned(
              top: 10,
              left: 10,
              child: SafeArea(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
