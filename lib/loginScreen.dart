import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_application_1/utils/routes.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //String name = " ";
  bool changedInButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/login_image.png',
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 5.0,
              ),
              Text("Welcome",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter your username ",
                          labelText: "Username"),
                      // onChanged: (value) {
                      //   name = value;
                      //   setState(() {});
                      // }
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter your Password ",
                          labelText: "Password"),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    InkWell(
                        onTap: () async {
                          setState(() {
                            changedInButton = true;
                          });
                          await Future.delayed(Duration(seconds: 1));
                          Navigator.pushNamed(context, ScreenRoutes.homeRoute);
                        },
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          height: 50,
                          width: changedInButton ? 50 : 120,
                          alignment: Alignment.center,
                          child: changedInButton
                              ? Icon(Icons.done, color: Colors.white)
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            // shape: changedInButton
                            //     ? BoxShape.circle
                            //     : BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.circular(changedInButton ? 50 : 8),
                          ),
                        )
                        // ElevatedButton(
                        //   onPressed: () {
                        //     Navigator.pushNamed(context, ScreenRoutes.homeRoute);
                        //   },
                        //   child: Text("Login"),
                        //   style: TextButton.styleFrom(minimumSize: Size(100, 40)),
                        // )
                        )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
