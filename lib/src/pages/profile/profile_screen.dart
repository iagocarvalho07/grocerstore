import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocerstore/src/config/custom_color.dart';
import 'package:grocerstore/src/pages/authentication/auth_controler.dart';
import 'package:grocerstore/src/pages/components/custom_text_field.dart';

import '../../config/ap_data.dart';

class ProfileTabScreen extends StatefulWidget {
  const ProfileTabScreen({super.key});


  @override
  State<ProfileTabScreen> createState() => _ProfileTabScreenState();
}

class _ProfileTabScreenState extends State<ProfileTabScreen> {
  final authControlher = Get.find<authControlhe>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.customSwatColor,
        title: Text("Perfil do Usuario"),
        actions: [
          IconButton( onPressed: () {
            authControlher.SingOut();
      }, icon: const Icon(Icons.logout),),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          CustomTextField(
            readOnly: true,
            initialValue: users.email,
            icon: Icons.email,
            label: "email",
            isobscureIconSenha: false,
          ),
          CustomTextField(
            readOnly: true,
            initialValue: users.name,
            icon: Icons.person,
            label: "Nome",
            isobscureIconSenha: false,
          ),
          CustomTextField(
            readOnly: true,
            initialValue: users.celular,
            icon: Icons.phone,
            label: "Celular",
            isobscureIconSenha: false,
          ),
          CustomTextField(
            readOnly: true,
            initialValue: users.cpf,
            icon: Icons.file_copy,
            label: "CPF",
            isobscureIconSenha: true,
          ),
          SizedBox(
              height: 50,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: CustomColor.customSwatColor,
                  ),
                  onPressed: () {
                    showAlertDialogRecoveryPassword();
                  },
                  child: const Text(
                    "Atualizar Senha",
                    style: TextStyle(color: Colors.white),
                  )))
        ],
      ),
    );
  }

  Future showAlertDialogRecoveryPassword() {
    return showDialog(
        context: context,
        builder: (context) {
          return  AlertDialog(
            title: Row(
              children: [
                const Text("Recovery Password"),
                IconButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(icon: Icons.password, label: "Senha Atual",),
                CustomTextField(icon: Icons.password, label: "Nova Senha",),
                CustomTextField(icon: Icons.password, label: "Confirmação senha",),
                ElevatedButton(onPressed: (){}, child: const Text("Alterar Senha"))
              ],
            ),
          );
        });
  }
}
