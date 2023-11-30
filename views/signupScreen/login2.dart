import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Provider/song_provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    datalist = prefs.getStringList('username')!;
  }

  List<String> datalist = [];
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

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
                  const SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 50),
                    child: TextFormField(
                      controller: emailcontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Your Email";
                        } else {
                          RegExp emailRegExp = RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                          );
                          if (!emailRegExp.hasMatch(value)) {
                            return "Enter a valid Email";
                          }
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        isDense: true,
                        suffixIcon: Icon(CupertinoIcons.mail,
                            size: 25, color: Colors.blue),
                        label: Text(
                          "E-mail",
                          style: TextStyle(fontSize: 20, color: Colors.black45),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 50),
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^[a-zA-Z@]+')),
                      ],
                      controller: passwordcontroller,
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
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black45),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        if (datalist[0] == emailcontroller.text &&
                            datalist[1] == passwordcontroller.text) {
                          Navigator.pushReplacementNamed(context, '/');
                          prefs.setBool('isSignUp', true);
                        } else {
                          print("Error");
                          print(datalist);
                        }
                      },
                      child: const Text("Save",
                          style: TextStyle(fontSize: 20, color: Colors.blue)),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Dont have Account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'Signin');
                        },
                        child: const Text("Sign Up"),
                      )
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
