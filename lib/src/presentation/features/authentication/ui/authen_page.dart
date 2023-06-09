import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/api/remote.dart';

class AuthenPage extends StatefulWidget {
  const AuthenPage({super.key});

  @override
  State<AuthenPage> createState() => _AuthenPageState();
}

class _AuthenPageState extends State<AuthenPage> {
  late Remote remote;
  bool hidePassword = true;
  bool tapLogin = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    remote = RemoteImpl();
    super.initState();
  }

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
              !tapLogin
                  ? OutlinedButton(
                      onPressed: () async {
                        setState(() {
                          tapLogin = !tapLogin;
                        });
                        final data = await remote.loginRTAF({
                          "user": usernameController.text,
                          "pass": passwordController.text,
                        });

                        log(data.toString());

                        if (data["result"] == "Process-Complete") {
                          await Future.sync(
                            () => ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${data["user_name"]} เข้าสู่ระบบเรียบร้อย',
                                ),
                              ),
                            ),
                          );
                          await Future.delayed(const Duration(seconds: 1));
                          await Future.sync(
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                final profile = ProfileModel(
                                  rank: data["rank"],
                                  name: data["fname"],
                                  position: data["user_position"],
                                );
                                return MyDetails(profile: profile);
                              }),
                            ),
                          );
                        } else {
                          await Future.sync(
                            () => ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'เข้าสู่ระบบไม่ได้',
                                ),
                              ),
                            ),
                          );
                        }

                        setState(() {
                          setState(() {
                            tapLogin = !tapLogin;
                          });
                        });
                      },
                      child: const Text("เข้าสู่ระบบ"),
                    )
                  : OutlinedButton(
                      onPressed: () {
                        log("Loading .....");
                      },
                      child: const SizedBox(
                        width: 80,
                        child: LinearProgressIndicator(),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileModel {
  final String name;
  final String position;
  final String rank;

  ProfileModel({
    required this.name,
    required this.position,
    required this.rank,
  });
}

class MyDetails extends StatelessWidget {
  final ProfileModel profile;

  const MyDetails({required this.profile, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
            child: Text(profile.name),
          ),
          SizedBox(
            height: 20,
            child: Text(profile.position),
          ),
          SizedBox(
            height: 20,
            child: Text(profile.rank),
          ),
        ],
      ),
    );
  }
}
