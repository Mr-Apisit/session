import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthenPage extends StatelessWidget {
  const AuthenPage({super.key});

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
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "password",
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r"^[a-zA-Z!@#$%^&*()_+]+$"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              OutlinedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'กำลังเข้าสู่ระบบ....',
                      ),
                    ),
                  );
                },
                child: const Text("เข้าสู่ระบบ"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
