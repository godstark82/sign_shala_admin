import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String name;
  final void Function(String)? onChanged;
  const CustomTextField({
    super.key,
    required this.name,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        decoration: InputDecoration(
            hintText: name,
            label: Text(name),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: Colors.grey))),
        onChanged: onChanged,
      ),
    );
  }
}
