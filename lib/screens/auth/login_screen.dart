import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_note_app/components/roundbutton.dart';
import 'package:firebase_note_app/constants/color.dart';
import 'package:firebase_note_app/screens/auth/signup_screen.dart';
import 'package:firebase_note_app/utils/toast.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  //
  final _fromKey = GlobalKey<FormState>();
  //
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //
  final Utils _utils = Utils();
  //
  bool isLoading = false;
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.65,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          //
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                  key: _fromKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        //
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty || value == null) {
                              return 'Enter a valid email';
                            } else {
                              return null;
                            }
                          },
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Email',
                            prefixIcon: const Icon(Icons.mail_outline_outlined),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        //
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty || value == null) {
                              return 'Enter a valid password';
                            } else {
                              return null;
                            }
                          },
                          controller: _passwordController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Password',
                            prefixIcon: const Icon(Icons.lock_outline),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        //Login Button
                        RoundButton(
                          isLoading: false,
                          color: primaryColor,
                          onTap: () {},
                          titleText: 'Login',
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        //SignupButton
                        RoundButton(
                          isLoading: false,
                          color: tdRed,
                          onTap: () {},
                          titleText: 'Login with Phone number',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        //
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpScreen()));
                              },
                              child: const Text(
                                'Signup',
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
