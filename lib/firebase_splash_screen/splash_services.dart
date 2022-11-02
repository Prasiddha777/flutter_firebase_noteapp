import 'dart:async';

import 'package:firebase_note_app/screens/posts/postscreen.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer.periodic(Duration(seconds: 5), (timer) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PostScreen()));
    });
  }
}
