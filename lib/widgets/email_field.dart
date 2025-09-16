import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController emailController;
  const EmailField({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: 'Introduzca su email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor escriba su email';
                  }
                  if(!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Por favor escriba un email valido';
                  }
                  return null;
                },
              );
  }
}