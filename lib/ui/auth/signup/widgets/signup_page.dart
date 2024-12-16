import 'package:app/ui/_widgets/button.dart';
import 'package:app/ui/_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Informações',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          children: [
            const Text(
              'Crie sua Conta',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              'Seja um corretor de seguros e amplie suas oportunidades. Gerencie clientes e propostas de forma prática e eficiente!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade600,
              ),
            ),
            CustomTextField(
              controller: TextEditingController(),
              label: 'Nome',
              hintText: 'Insira seu nome completo',
              prefixIcon: const Icon(Icons.person_outline),
            ),
            CustomTextField(
              controller: TextEditingController(),
              label: 'Telefone',
              hintText: 'Ex.: (00) 00000-0000',
              prefixIcon: const Icon(Icons.phone_outlined),
            ),
            CustomTextField(
              controller: TextEditingController(),
              label: 'CPF',
              hintText: 'Ex.: 000.000.000-00',
              prefixIcon: const Icon(Icons.badge_outlined),
            ),
            CustomTextField(
              controller: TextEditingController(),
              label: 'Email',
              hintText: 'Insira seu email',
              prefixIcon: const Icon(Icons.mail_outline),
            ),
            CustomTextField(
              controller: TextEditingController(),
              label: 'Senha',
              hintText: 'Insira sua senha',
              obscureText: true,
              prefixIcon: const Icon(Icons.lock_outline),
            ),
            Button(
              label: 'Continuar',
              onPressed: () => {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Já tem uma conta?',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade600,
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
