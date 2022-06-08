import 'package:flutter/material.dart';
import 'package:loja/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models/user_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrar"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
            child: const Text(
              "CRIAR CONTA",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
      body: ScopedModelDescendant<UserModel>(builder: (context, child, model) {
        if (model.isLoading) return const Center(child: CircularProgressIndicator());
        return Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: "E-mail"),
                keyboardType: TextInputType.emailAddress,
                validator: (text) {
                  if (text!.isEmpty || !text.contains("@"))
                    return "E-mail inválido!";
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(hintText: "Senha"),
                obscureText: true,
                validator: (text) {
                  if (text!.isEmpty || text.length < 8)
                    return "Senha inválida!";
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.zero)),
                  onPressed: () {},
                  child: const Text(
                    "Esqueci minha senha",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              SizedBox(
                height: 44,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).primaryColor)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                    model.signIn();
                  },
                  child: const Text(
                    "Entrar",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
