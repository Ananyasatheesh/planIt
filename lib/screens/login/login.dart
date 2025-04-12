import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 652,
          width: 400,
          child: Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0x1AFFFFFF)),
            child: Column(
              children: [
                Text(
                  "Welcome back",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Sign in to continue",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 32,
                ),
                TextFormField(),
                SizedBox(
                  height: 16,
                ),
                TextField(),
                SizedBox(
                  height: 8,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text("Forgot password")),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Sign in",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                    height: 21,
                    width: 46,
                    color: Color(0xFF287291),
                    child: Text(
                      "or",
                      textAlign: TextAlign.center,
                    )),
                SizedBox(
                  height: 32,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Color(0x2AFFFFFF))),
                      onPressed: () {},
                      child: Text(
                        "Continue with Google",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                SizedBox(
                  height: 32,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(text: "Don't have an account?"),
                  TextSpan(
                      text: " Sign Up",
                      style: TextStyle(fontWeight: FontWeight.bold))
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
