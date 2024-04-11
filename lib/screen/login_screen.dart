import 'package:api_with_provider/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Email'
                ),
                controller: emailController,
              ),
              const SizedBox(height: 20,),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Password'
                ),
                controller: passwordController,
              ),
              const SizedBox(height: 50,),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    onPressed: (){
                      loginProvider.login(emailController.text.trim(), passwordController.text.trim());
                    },
                    child: loginProvider.loading ? const CircularProgressIndicator(color: Colors.indigo,) : const Text('LOGIN')
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
