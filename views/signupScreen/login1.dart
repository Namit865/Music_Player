import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Provider/song_provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
          ),
          Stack(
            children: [
              Align(
                alignment: const Alignment(10, -2),
                child: Container(
                  height: 390,
                  width: 390,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(250),
                      color: const Color(0xff38B4FE)),
                ),
              ),
              Align(
                alignment: const Alignment(-4, -1.6),
                child: Container(
                  height: 360,
                  width: 360,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(250),
                      color: const Color(0xff308EE8)),
                ),
              ),
              Align(
                alignment: const Alignment(-4, -1.6),
                child: Container(
                  height: 330,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(250),
                    color: const Color(0xff1F6AC7),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0, -0.6),
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.white),
                  child: const FlutterLogo(),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      "Create",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 70,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Center(
                    child: Text(
                      "Account",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 50),
                    child: TextFormField(
                      controller: username,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          color: Colors.black),
                      decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.mail),
                        hintText: "E-mail",
                        hintStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 50),
                    child: TextFormField(
                      controller: password,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          color: Colors.black),
                      obscureText:
                      Provider.of<SongProvider>(context).listModel.issecure,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: () {
                            Provider.of<SongProvider>(context, listen: false)
                                .secure();
                          },
                          child: (Provider.of<SongProvider>(context)
                              .listModel
                              .issecure)
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                        hintText: "Password",
                        hintStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                      prefs.setStringList(
                          'username', [username.text, password.text]);
                      Navigator.of(context).pushNamed('SignUp');
                    },
                    child: const Text("Save"),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("You have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'Signin');
                          },
                          child: const Text("Sign in"))
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}