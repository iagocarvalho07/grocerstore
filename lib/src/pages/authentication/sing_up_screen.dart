import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grocerstore/src/config/custom_color.dart';
import 'package:grocerstore/src/services/validators.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../components/custom_text_field.dart';
import 'auth_controler.dart';

class SingUpScreen extends StatelessWidget {
  SingUpScreen({super.key});

  final cpfFormater = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {'#': RegExp(r'[0-9]')});

  final phoneFormater = MaskTextInputFormatter(
      mask: '## # ####-####', filter: {'#': RegExp(r'[0-9]')});

  final _formKey = GlobalKey<FormState>();
  final authControlher = Get.find<authControlhe>();

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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextField(
                          icon: Icons.email,
                          label: "Email",
                          onSave: (value) {
                            authControlher.user.email = value;
                          },
                          isobscureIconSenha: false,
                          TextInputTypes: TextInputType.emailAddress,
                          validator: emailValidator,
                        ),
                        CustomTextField(
                          icon: Icons.password,
                          label: "Password",
                          isobscuretext: true,
                          onSave: (value) {
                            authControlher.user.senha = value;
                          },
                          validator: passwordValidator,
                        ),
                        CustomTextField(
                          icon: Icons.person,
                          label: "Nome",
                          onSave: (value) {
                            authControlher.user.name = value;
                          },
                          isobscureIconSenha: false,
                          validator: nameValidator,
                        ),
                        CustomTextField(
                          icon: Icons.phone,
                          label: "Celular",
                          inputFormatters: [phoneFormater],
                          isobscureIconSenha: false,
                          onSave: (value) {
                            authControlher.user.celular = value;
                          },
                          TextInputTypes: TextInputType.phone,
                          validator: phoneValidator,
                        ),
                        CustomTextField(
                          icon: Icons.file_copy,
                          label: "CPF",
                          onSave: (value) {
                            authControlher.user.cpf = value;
                          },
                          inputFormatters: [cpfFormater],
                          isobscureIconSenha: false,
                          TextInputTypes: TextInputType.number,
                          validator: cpfValidator,
                        ),
                        SizedBox(
                          height: 50,
                          child: Obx(() {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18))),
                              onPressed: authControlher.isloading.value
                                  ? null
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        authControlher.signUp();
                                      }
                                      ;
                                    },
                              child: authControlher.isloading.value
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      "Criar usuario",
                                      style: TextStyle(fontSize: 18),
                                    ),
                            );
                          }),
                        )
                      ],
                    ),
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
