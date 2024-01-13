import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocerstore/src/config/custom_color.dart';
import 'package:grocerstore/src/pages/authentication/auth_controler.dart';
import 'package:grocerstore/src/pages_routes/app_page_routes.dart';
import 'package:grocerstore/src/services/validators.dart';

import '../components/custom_text_field.dart';

class SingScreen extends StatelessWidget {
  SingScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final emailControler = TextEditingController();
  final passwordlControler = TextEditingController();

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
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // nome do app
                  Text.rich(
                    TextSpan(style: const TextStyle(fontSize: 40), children: [
                      const TextSpan(
                        text: 'Green',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Grocer',
                        style: TextStyle(
                          color: CustomColor.customContrastColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]),
                  ),
                  // Categorias
                  SizedBox(
                    height: 30,
                    child: DefaultTextStyle(
                      style: const TextStyle(fontSize: 25),
                      child: AnimatedTextKit(
                        pause: Duration.zero,
                        repeatForever: true,
                        animatedTexts: [
                          FadeAnimatedText("Frutas"),
                          FadeAnimatedText("Verduras"),
                          FadeAnimatedText("Legumes"),
                          FadeAnimatedText("Carnes"),
                          FadeAnimatedText("Cereais"),
                        ],
                      ),
                    ),
                  ),
                ],
              )),

              //formulario
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
                      //email
                      CustomTextField(
                        controller: emailControler,
                        icon: Icons.email,
                        label: 'Email',
                        isobscureIconSenha: false,
                        validator: emailValidator,
                      ),
                      //senha
                      CustomTextField(
                        controller: passwordlControler,
                        icon: Icons.password,
                        label: 'Password',
                        isobscuretext: true,
                        validator: passwordValidator,
                      ),
                      // botão entrar
                      SizedBox(
                        height: 50,
                        child: GetX<authControlhe>(
                          initState: (_) {},
                          builder: (authControlhe) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(),
                              onPressed: authControlhe.isloading.value ? null : () {

                                // Navigator.of(context).pushReplacement(
                                // MaterialPageRoute(builder: (c) {
                                //   return BaseScreen();
                                // }));
                                FocusScope.of(context).unfocus();
                                if (_formKey.currentState!.validate()) {
                                  String email = emailControler.text;
                                  String password = passwordlControler.text;
                                  authControlhe.singIn(
                                      email: email, password: password);
                                }
                                //Get.toNamed(PageRoutesName.BaseScreen);
                              },
                              child: authControlhe.isloading.value
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      "Entrar",
                                      style: TextStyle(fontSize: 18),
                                    ),
                            );
                          },
                        ),
                      ),
                      //esqueceu senha
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Esqueceu a Senha?",
                            style: TextStyle(
                                color: CustomColor.customContrastColor),
                          ),
                        ),
                      ),
                      // divisor
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("Ou"),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Botão novo usuario
                      SizedBox(
                        height: 50,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                  width: 2, color: Colors.green),
                            ),
                            onPressed: () {
                              // Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                              //   return SingUpScreen();
                              // }));
                              Get.toNamed(PageRoutesName.SingUpScreen);
                            },
                            child: const Text("Criar Conta")),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
