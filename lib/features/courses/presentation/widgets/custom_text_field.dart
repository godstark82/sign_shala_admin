import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String name;
  final void Function(String)? onSubmit;
  final void Function(String)? onChanged;
  final bool isCompulsory;
  const CustomTextField({
    super.key,
    this.onSubmit,
    this.isCompulsory = true,
    required this.name,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        validator: (value) {
          if ((value == null || value.isEmpty) && isCompulsory) {
            return 'This field can\'t be null';
          }

          return null;
        },
        decoration: InputDecoration(
            hintText: name,
            label: Text(name),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: Colors.grey))),
        onChanged: onChanged,
        onFieldSubmitted: onSubmit,
      ),
    );
  }
}
