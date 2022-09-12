import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = " ";
  bool changedInButton = false;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changedInButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, ScreenRoutes.homeRoute);
      setState(() {
        changedInButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.canvasColor,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/login_image.png',
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Text("Welcome",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Enter your username ",
                            labelText: "Username"),
                        onChanged: ((value) {
                          name = value;
                          setState(() {});
                        }),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: "Enter your Password ",
                            labelText: "Password"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 6) {
                            return "Password length should be greater then 5";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Material(
                        color: Colors.green,
                        borderRadius:
                            BorderRadius.circular(changedInButton ? 50 : 8),
                        child: InkWell(
                            onTap: () => moveToHome(context),
                            child: AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                height: 50,
                                width: changedInButton ? 50 : 120,
                                alignment: Alignment.center,
                                child: changedInButton
                                    ? const Icon(Icons.done,
                                        color: Colors.white)
                                    : "Login".text.bold.lg.make())),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
