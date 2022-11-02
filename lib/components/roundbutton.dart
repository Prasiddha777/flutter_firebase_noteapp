import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {super.key,
      required this.color,
      required this.onTap,
      required this.titleText,
      required this.isLoading});
  final Color color;
  final String titleText;
  final VoidCallback onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Center(
          child: isLoading == true
              ? const CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.white,
                )
              : Text(
                  titleText,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
