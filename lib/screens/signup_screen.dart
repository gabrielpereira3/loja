import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criar Conta"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: "Nome Completo"),
              validator: (text) {
                if(text!.isEmpty) return "Nome inválido!";
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(hintText: "E-mail"),
              keyboardType: TextInputType.emailAddress,
              validator: (text) {
                if(text!.isEmpty || !text.contains("@")) return "E-mail inválido!";
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(hintText: "Senha"),
              obscureText: true,
              validator: (text) {
                if(text!.isEmpty || text.length < 8) return "Senha inválida!";
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(hintText: "Endereço"),
              validator: (text) {
                if(text!.isEmpty) return "Endereço inválido!";
              },
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 44,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor)),
                onPressed: () {
                  if(_formKey.currentState!.validate()){

                  }
                },
                child: const Text(
                  "Criar Conta",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
