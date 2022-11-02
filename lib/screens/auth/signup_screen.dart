import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_note_app/components/roundbutton.dart';
import 'package:firebase_note_app/constants/color.dart';
import 'package:firebase_note_app/screens/auth/login_screen.dart';
import 'package:firebase_note_app/utils/toast.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //controller
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  //validation key
  final _formKey = GlobalKey<FormState>();

  //initialized Firebase Auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //for toast message
  Utils _toast = Utils();
  //
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: tdBlack),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.85,
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
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          //
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty || value == null) {
                                return 'Enter a valid name';
                              } else {
                                return null;
                              }
                            },
                            controller: _nameController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: 'Name',
                              prefixIcon: const Icon(Icons.person),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
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
                              prefixIcon:
                                  const Icon(Icons.mail_outline_outlined),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
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
                            height: 30,
                          ),
                          //
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty ||
                                  value == null ||
                                  value == _passwordController) {
                                return 'Enter a valid password';
                              } else {
                                return null;
                              }
                            },
                            controller: _confirmPassword,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: 'Confrim Password',
                              prefixIcon: const Icon(Icons.lock_outline),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          RoundButton(
                            isLoading: isLoading,
                            color: primaryColor,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });

                                //

                                _auth
                                    .createUserWithEmailAndPassword(
                                  email: _emailController.text.toString(),
                                  password: _passwordController.toString(),
                                )
                                    .then((value) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                }).onError((error, stackTrace) {
                                  _toast.toastMessage(error.toString());
                                  setState(() {
                                    isLoading = false;
                                  });
                                });
                              }
                            },
                            titleText: 'SignUp',
                          ),
                          const SizedBox(
                            height: 30,
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
                                          builder: (context) => LoginScreen()));
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
