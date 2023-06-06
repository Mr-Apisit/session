import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthenPage extends StatefulWidget {
  const AuthenPage({super.key});

  @override
  State<AuthenPage> createState() => _AuthenPageState();
}

class _AuthenPageState extends State<AuthenPage> {
  bool hidePassword = true;
  bool tapLogin = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login"),
      ),
      body: Container(
        width: double.infinity,
        alignment: Alignment.topCenter,
        color: Colors.yellow,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text("Login เข้าระบบ"),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: "username",
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r"^[a-z_]+$"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: passwordController,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      icon: hidePassword
                          ? const Icon(Icons.remove_red_eye)
                          : const Icon(Icons.close),
                    ),
                    labelText: "password",
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r"^[0-9a-zA-Z!@#$_+]+$"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              OutlinedButton(
                  onPressed: () async {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${usernameController.text} กำลังเข้าสู่ระบบ....',
                        ),
                      ),
                    );
                    setState(() {
                      tapLogin = !tapLogin;
                    });
                    await Future.delayed(const Duration(seconds: 2));
                    setState(() {
                      setState(() {
                        tapLogin = !tapLogin;
                      });
                    });
                  },
                  child: tapLogin
                      ? const SizedBox(
                          width: 80, child: LinearProgressIndicator())
                      : const Text("เข้าสู่ระบบ")),
            ],
          ),
        ),
      ),
    );
  }
}
