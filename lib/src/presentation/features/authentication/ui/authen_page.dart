import 'package:flutter/material.dart';

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
              const SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "username",
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                width: 300,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "password",
                  ),
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
