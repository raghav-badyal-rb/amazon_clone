import 'package:flutter/material.dart';

class CustomSimpleRoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double fontSize; // Added font size parameter
  const CustomSimpleRoundedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.fontSize = 16, // Default value for font size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey; // Disabled color
          }
          return Colors.white; // Default color
        }),
        foregroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.black.withOpacity(0.5); // Disabled text color
          }
          return Colors.black; // Default text color
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.black), // Border color
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize, // Used the passed font size
        ),
      ),
    );
  }
}
