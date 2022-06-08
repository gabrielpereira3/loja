import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models/user_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criar Conta"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          if (model.isLoading) return const Center(child: CircularProgressIndicator());
          return Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(hintText: "Nome Completo"),
                  validator: (text) {
                    if (text!.isEmpty) return "Nome inválido!";
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(hintText: "E-mail"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (text) {
                    if (text!.isEmpty || !text.contains("@"))
                      return "E-mail inválido!";
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(hintText: "Senha"),
                  obscureText: true,
                  validator: (text) {
                    if (text!.isEmpty || text.length < 8)
                      return "Senha inválida!";
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(hintText: "Endereço"),
                  validator: (text) {
                    if (text!.isEmpty) return "Endereço inválido!";
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
                      if (_formKey.currentState!.validate()) {

                        Map<String, dynamic> userData = {
                          "name": _nameController.text,
                          "email": _emailController.text,
                          "address": _addressController.text
                        };

                        model.signUp(
                            userData: userData,
                            password: _passwordController.text,
                            onSuccess: _onSuccess,
                            onFail: _onFail
                        );
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
          );
        },
      ),
    );
  }

  void _onSuccess(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Usuário criado com sucesso!"),
        backgroundColor: Theme.of(context).primaryColor,
        duration: const Duration(seconds: 2),
      ),
    );

    Future.delayed(const Duration(seconds: 2)).then((_){
      Navigator.of(context).pop();
    });
  }

  void _onFail(){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Falha ao criar do usuário!"),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      ),
    );
  }
}